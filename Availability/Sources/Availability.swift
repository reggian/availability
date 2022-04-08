//
// Availability.swift
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

public final class Availability {
  private let device: WikiDevice
  private let system: SystemInfo
  
  public convenience init() {
    self.init(
      device: WikiDevice(),
      system: SystemInfo()
    )
  }
  
  init(device: WikiDevice, system: SystemInfo) {
    self.device = device
    self.system = system
  }
  
  public func getAvailability(completion: @escaping (Result<String, Error>) -> Void) {
    device.retrieveModel { [system] name in
      let model = system.hwMachine()
      let deviceInfo = DeviceInfo(
        model: model,
        name: name,
        modules: []
      )
      let encoder = JSONEncoder()
      encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
      do {
        let jsonData = try encoder.encode(deviceInfo)
        guard let jsonString = String(data: jsonData, encoding: .utf8) else { throw JSONStringConversionError() }
        completion(.success(jsonString))
      } catch let error {
        completion(.failure(error))
      }
    }
  }
}

// MARK: - Private
private extension Availability {
  struct JSONStringConversionError: LocalizedError {
    var errorDescription: String? {
      "Converting JSON data into string has failed."
    }
  }
}
