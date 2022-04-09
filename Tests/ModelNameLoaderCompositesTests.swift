//
// ModelNameLoaderCompositesTests.swift
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

class ModelNameLoaderWithFallbackTests: XCTestCase {
  func test_primary() {
    let primary = StubModelNameLoader(model: "iPhone0,0", name: "Primary")
    let secondary = StubModelNameLoader(model: "iPhone1,1", name: "Secondary")
    let sut = ModelNameLoaderWithFallback(primary: primary, secondary: secondary)
    
    sut.loadName(for: primary.model) { name in
      XCTAssertEqual(name, primary.name)
    }
  }
  
  func test_secondary() {
    let primary = StubModelNameLoader(model: "iPhone0,0", name: "Primary")
    let secondary = StubModelNameLoader(model: "iPhone1,1", name: "Secondary")
    let sut = ModelNameLoaderWithFallback(primary: primary, secondary: secondary)
    
    sut.loadName(for: secondary.model) { name in
      XCTAssertEqual(name, secondary.name)
    }
  }
  
  func test_unhandled() {
    let primary = StubModelNameLoader(model: "iPhone0,0", name: "Primary")
    let secondary = StubModelNameLoader(model: "iPhone1,1", name: "Secondary")
    let sut = ModelNameLoaderWithFallback(primary: primary, secondary: secondary)
    
    sut.loadName(for: "iPhone2,2") { name in
      XCTAssertNil(name)
    }
  }
}

class ModelNameLoaderChainTests: XCTestCase {
  func test_chain_returnsAtProperElement() {
    let elementRange = 1...10
    let resultElementIndex = Int.random(in: elementRange)
    let spy = SpyModelNameLoader { callIndex in
      return callIndex >= resultElementIndex ? "Name \(callIndex)" : nil
    }
    let sut = ModelNameLoaderChain(elementRange.map { _ in spy })
    
    sut.loadName(for: "iPhone0,0") { name in
      XCTAssertEqual(name, "Name \(resultElementIndex)")
    }
    XCTAssertEqual(spy.callCount, resultElementIndex)
  }
  
  func test_chain_returnsNilForUnhandledModel() {
    let elementRange = 1...10
    let spy = SpyModelNameLoader { callCount in
      return nil
    }
    let sut = ModelNameLoaderChain(elementRange.map { _ in spy })
    
    sut.loadName(for: "iPhone0,0") { name in
      XCTAssertNil(name)
    }
    XCTAssertEqual(spy.callCount, elementRange.upperBound)
  }
}

// MARK: - Helpers
struct StubModelNameLoader: ModelNameLoader {
  let model: String
  let name: String
  
  func loadName(for model: String, completion: @escaping (String?) -> Void) {
    if model == self.model {
      completion(name)
    } else{
      completion(nil)
    }
  }
}

class SpyModelNameLoader: ModelNameLoader {
  var callCount = 0
  let resultForCount: (Int) -> String?
  
  init(resultForCount: @escaping (Int) -> String?) {
    self.resultForCount = resultForCount
  }
  
  func loadName(for model: String, completion: @escaping (String?) -> Void) {
    callCount += 1
    let name = resultForCount(callCount)
    completion(name)
  }
}
