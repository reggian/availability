//
// WikiModelNameLoader.swift
// Availability
//
// MIT License
//
// Copyright (c) 2022 reggian
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
// Adapted from Alessandro Ornano:
// https://github.com/aornano/WikiDevice
//

import Foundation

class WikiModelNameLoader: ModelNameLoader {
  func loadName(for model: String, completion: @escaping (String?) -> Void) {
    guard let wikiUrl = URL(string:"https://www.theiphonewiki.com//w/api.php?action=parse&format=json&page=Models") else { return completion(nil) }
    
    let request = URLRequest(url: wikiUrl)
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        do {
            guard let data = data,
                let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode,
                error == nil else { return completion(nil) }
            guard let convertedString = String(data: data, encoding: String.Encoding.utf8) else { return completion(nil) }
            var wikiTables = convertedString.components(separatedBy: "wikitable")
            wikiTables.removeFirst()
            var tables = [[String]]()
            wikiTables.enumerated().forEach{ index,table in
                let rawRows = table.components(separatedBy: #"<tr>\n<td"#)
                var counter = 0
                var rows = [String]()
                while counter < rawRows.count {
                    let rawRow = rawRows[counter]
                    if let subRowsNum = rawRow.components(separatedBy: #"rowspan=\""#).dropFirst().compactMap({ sub in
                        (sub.range(of: #"\">"#)?.lowerBound).flatMap { endRange in
                            String(sub[sub.startIndex ..< endRange])
                        }
                    }).first {
                        if let subRowsTot = Int(subRowsNum) {
                            var otherRows = ""
                            for i in counter..<counter+subRowsTot {
                                otherRows += rawRows[i]
                            }
                            let row = rawRow + otherRows
                            rows.append(row)
                            counter += subRowsTot-1
                        }
                    } else {
                        rows.append(rawRows[counter])
                    }
                    counter += 1
                }
                tables.append(rows)
            }
            for table in tables {
                if let rowIndex = table.firstIndex(where: {$0.lowercased().contains(model.lowercased())}) {
                    let rows = table[rowIndex].components(separatedBy: "<td>")
                    if rows.count>0 {
                        if rows[0].contains("title") { //hyperlink
                            if let (cleanedGen) = rows[0].components(separatedBy: #">"#).dropFirst().compactMap({ sub in
                                (sub.range(of: "</")?.lowerBound).flatMap { endRange in
                                    String(sub[sub.startIndex ..< endRange]).replacingOccurrences(of: #"\n"#, with: "")
                                }
                            }).first {
                                completion(cleanedGen)
                            }
                        } else {
                            let raw = rows[0].replacingOccurrences(of: "<td>", with: "")
                            let cleanedGen = raw.replacingOccurrences(of: #"\n"#, with: "")
                            completion(cleanedGen)
                        }
                        return
                    }
                }
            }
            completion(nil)
        }
    }.resume()
  }
}
