//
// AvailabilityFormatter.swift
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

import Foundation

final class AvailabilityFormatter {
  func string(from deviceInfo: DeviceInfo) throws -> String {
    let encoder = JSONEncoder()
    encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
    let jsonData = try encoder.encode(deviceInfo.encodable)
    guard let jsonString = String(data: jsonData, encoding: .utf8) else { throw JSONStringConversionError() }
    return jsonString
  }
}

// MARK: - Private
private extension AvailabilityFormatter {
  struct JSONStringConversionError: LocalizedError {
    var errorDescription: String? {
      "Converting JSON data into string has failed."
    }
  }
}

private extension DeviceInfo {
  struct EncodableDeviceInfo: Encodable {
    let model: String
    let name: String
    let modules: [ModuleInfo]
    
    enum CodingKeys: String, CodingKey {
      case model
      case name
      case availability
    }
    
    func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
      try container.encode(model, forKey: .model)
      try container.encode(name, forKey: .name)
      
      let availability = modules.reduce(into: [:]) {
        $0[$1.name] = $1.components.reduce(into: [:]) {
          $0[$1.name] = $1.availability
        }
      }
      try container.encode(availability, forKey: .availability)
    }
  }
  
  var encodable: EncodableDeviceInfo {
    .init(model: model, name: name, modules: modules)
  }
}
