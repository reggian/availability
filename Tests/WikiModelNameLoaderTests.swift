//
// WikiModelNameLoaderTests.swift
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

import XCTest
@testable import Availability

class WikiModelNameLoaderTests: XCTestCase {
  func test_loadName_forwardsCorrectName() {
    let model = "iPhone7,2"
    let name = "iPhone 6"
    let spy = SpyWikiModelNameParser(loadNames: { models in
      XCTAssertEqual(models.count, 1)
      XCTAssertEqual(models.first, model)
      return ["other model": "other name", model: name]
    })
    
    let sut = WikiModelNameLoader()
    sut.parser = spy
    
    sut.loadName(for: model) { result in
      XCTAssertEqual(result, name)
    }
  }
  
  func test_loadName_forwardsNil() {
    let model = "iPhone7,2"
    let spy = SpyWikiModelNameParser(loadNames: { models in
      XCTAssertEqual(models.count, 1)
      return [:]
    })
    
    let sut = WikiModelNameLoader()
    sut.parser = spy
    
    sut.loadName(for: model) { name in
      XCTAssertNil(name)
    }
  }
}

// MARK: - Helpers
private class SpyWikiModelNameParser: WikiModelNameParser {
  let _loadNames: ([String]) -> [String : String]
  
  init(loadNames: @escaping ([String]) -> [String : String]) {
    _loadNames = loadNames
  }
  
  override func loadNames(for models: [String], completion: @escaping ([String : String]) -> Void) {
    let names = _loadNames(models)
    completion(names)
  }
}
