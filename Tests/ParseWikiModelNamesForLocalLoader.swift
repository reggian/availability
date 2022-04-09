//
// ParseWikiModelNamesForLocalLoader.swift
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

class ParseWikiModelNamesForLocalLoader: XCTestCase {
  func test_scrape() {
    let majMax = 20
    let minMax = 20
    let iPhoneModels = (1...majMax).flatMap { maj in
      (1...minMax).map { min in
        "iPhone\(maj),\(min)"
      }
    }
    let iPodModels = (1...majMax).flatMap { maj in
      (1...minMax).map { min in
        "iPod\(maj),\(min)"
      }
    }
    let iPadModels = (1...majMax).flatMap { maj in
      (1...minMax).map { min in
        "iPad\(maj),\(min)"
      }
    }
    let watchModels = (1...majMax).flatMap { maj in
      (1...minMax).map { min in
        "Watch\(maj),\(min)"
      }
    }
    let homePodModels = (1...majMax).flatMap { maj in
      (1...minMax).map { min in
        "AudioAccessory\(maj),\(min)"
      }
    }
    let tvModels = (1...majMax).flatMap { maj in
      (1...minMax).map { min in
        "AppleTV\(maj),\(min)"
      }
    }
    
    let models = iPhoneModels + iPodModels + iPadModels + watchModels + homePodModels + tvModels
    
    let expectation = expectation(description: "Wiki parsing should complete")
    let parser = WikiModelNameParser()
    parser.loadNames(for: models) { names in
      models.forEach { model in
        if let name = names[model] {
          print("\"\(model)\": \"\(name)\"")
        }
      }
      expectation.fulfill()
    }
    
    wait(for: [expectation], timeout: 20)
  }
}
