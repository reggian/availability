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
  private let modelLoader: ModelLoader
  private let modelNameLoader: ModelNameLoader
  private let modules: [ModuleAvailability]
  
  public convenience init() {
    self.init(
      modelLoader: CurrentModelLoader(),
      modelNameLoader: ModelNameLoaderChain([
        SimulatorModelNameLoader(),
        WikiModelNameLoader(),
        LocalModelNameLoader(),
      ]),
      modules: [
        CoreMotionAvailability(),
        CoreLocationAvailability(),
        CoreNFCAvailability(),
      ]
    )
  }
  
  init(modelLoader: ModelLoader, modelNameLoader: ModelNameLoader, modules: [ModuleAvailability]) {
    self.modelLoader = modelLoader
    self.modelNameLoader = modelNameLoader
    self.modules = modules
  }
  
  public func getAvailability(completion: @escaping (Result<String, Error>) -> Void) {
    let model = modelLoader.loadModel()
    modelNameLoader.loadName(for: model) { [modules] name in
      let availabilityInfo = AvailabilityInfo(
        model: model,
        name: name ?? model,
        modules: modules.map({ $0.availability() })
      )
      do {
        let jsonString = try AvailabilityFormatter().string(from: availabilityInfo)
        completion(.success(jsonString))
      } catch let error {
        completion(.failure(error))
      }
    }
  }
}
