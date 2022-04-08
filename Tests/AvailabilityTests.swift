//
// AvailabilityTests.swift
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

class AvailabilityTests: XCTestCase {
  func test_availability() {
    let sut = Availability(
      device: StubWikiDevice(name: "Test"),
      system: StubSystemInfo(model: "iPhone0,0")
    )
    
    let expectation = expectation(description: "Should receive result")
    
    sut.getAvailability { result in
      switch result {
      case .success(let result):
        print(result)
      case .failure(let error):
        XCTFail(error.localizedDescription)
      }
      
      expectation.fulfill()
    }
    
    wait(for: [expectation], timeout: 0.11)
  }
}

// MARK: - Helpers
class StubWikiDevice: WikiDevice {
  var name: String
  
  init(name: String) {
    self.name = name
  }
  
  override func retrieveModel(completion: @escaping (String) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [name] in
      completion(name)
    }
  }
}

class StubSystemInfo: SystemInfo {
  var model: String
  
  init(model: String) {
    self.model = model
  }
  
  override func hwMachine() -> String {
    model
  }
}
