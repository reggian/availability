//
// ModelNameLoaderComposites.swift
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

struct ModelNameLoaderWithFallback: ModelNameLoader {
  let primary: ModelNameLoader
  let secondary: ModelNameLoader
  
  func loadName(for model: String, completion: @escaping (String?) -> Void) {
    primary.loadName(for: model) { result in
      if let result = result {
        completion(result)
      } else {
        secondary.loadName(for: model, completion: completion)
      }
    }
  }
}

struct ModelNameLoaderChain: ModelNameLoader {
  let loader: ModelNameLoader?
  
  init(_ loaders: [ModelNameLoader]) {
    if loaders.isEmpty {
      loader = nil
    } else {
      var loaders = loaders
      let first = loaders.removeFirst()
      loader = ModelNameLoaderWithFallback(
        primary: first,
        secondary: ModelNameLoaderChain(loaders)
      )
    }
  }
  
  func loadName(for model: String, completion: @escaping (String?) -> Void) {
    guard let loader = loader else { return completion(nil) }
    loader.loadName(for: model, completion: completion)
  }
}
