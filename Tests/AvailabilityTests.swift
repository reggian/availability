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
    let model = "iPhone0,0"
    let name = "Test"
    let moduleName = "TestModule"
    let componentName = "TestComponent"
    let isAvailable = true
    
    let sut = Availability(
      modelLoader: StubModelLoader(model: model),
      modelNameLoader: StubModelNameLoader(model: model, name: name),
      modules: [
        TestModuleAvailability(
          moduleInfo: TestModuleInfo(
            name: moduleName,
            components: [
              TestComponentInfo(
                name: componentName,
                availability: ["isAvailable" : isAvailable]
              )
            ]
          )
        )
      ]
    )
    
    let expectation = expectation(description: "Should receive result")
    
    sut.getAvailability { availabilityInfo in
      XCTAssertEqual(availabilityInfo.model, model)
      XCTAssertEqual(availabilityInfo.name, name)
      XCTAssertEqual(availabilityInfo.modules.count, 1)
      XCTAssertEqual(availabilityInfo.modules[0].name, moduleName)
      XCTAssertEqual(availabilityInfo.modules[0].components.count, 1)
      XCTAssertEqual(availabilityInfo.modules[0].components[0].name, componentName)
      XCTAssertEqual(availabilityInfo.modules[0].components[0].availability.count, 1)
      XCTAssertEqual(availabilityInfo.modules[0].components[0].availability["isAvailable"], isAvailable)
      expectation.fulfill()
    }
    
    wait(for: [expectation], timeout: 0.11)
  }
}

// MARK: - Helpers
struct StubModelLoader: ModelLoader {
  let model: String
  
  func loadModel() -> String {
    return model
  }
}

struct TestModuleAvailability: ModuleAvailability {
  let moduleInfo: TestModuleInfo
  
  func availability() -> ModuleInfo {
    return moduleInfo
  }
}
