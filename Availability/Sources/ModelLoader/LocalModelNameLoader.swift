//
// LocalModelNameLoader.swift
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

class LocalModelNameLoader: ModelNameLoader {
  func loadName(for model: String, completion: @escaping (String?) -> Void) {
    completion(LocalModelNameLoader.name(for: model))
  }
}

// MARK: - Private
private extension LocalModelNameLoader {
  static func name(for model: String) -> String? {
    switch model {
    case "iPhone1,1": return "iPhone"
    case "iPhone1,2": return "iPhone 3G"
    case "iPhone2,1": return "iPhone 3GS"
    case "iPhone3,1": return "iPhone 4"
    case "iPhone3,2": return "iPhone 4"
    case "iPhone3,3": return "iPhone 4"
    case "iPhone4,1": return "iPhone 4S"
    case "iPhone5,1": return "iPhone 5"
    case "iPhone5,2": return "iPhone 5"
    case "iPhone5,3": return "iPhone 5c"
    case "iPhone5,4": return "iPhone 5c"
    case "iPhone6,1": return "iPhone 5s"
    case "iPhone6,2": return "iPhone 5s"
    case "iPhone7,1": return "iPhone 6 Plus"
    case "iPhone7,2": return "iPhone 6"
    case "iPhone8,1": return "iPhone 6s"
    case "iPhone8,2": return "iPhone 6s Plus"
    case "iPhone8,4": return "iPhone SE (1st generation)"
    case "iPhone9,1": return "iPhone 7"
    case "iPhone9,2": return "iPhone 7 Plus"
    case "iPhone9,3": return "iPhone 7"
    case "iPhone9,4": return "iPhone 7 Plus"
    case "iPhone10,1": return "iPhone 8"
    case "iPhone10,2": return "iPhone 8 Plus"
    case "iPhone10,3": return "iPhone X"
    case "iPhone10,4": return "iPhone 8"
    case "iPhone10,5": return "iPhone 8 Plus"
    case "iPhone10,6": return "iPhone X"
    case "iPhone11,2": return "iPhone XS"
    case "iPhone11,4": return "iPhone XS Max"
    case "iPhone11,6": return "iPhone XS Max"
    case "iPhone11,8": return "iPhone XR"
    case "iPhone12,1": return "iPhone 11"
    case "iPhone12,3": return "iPhone 11 Pro"
    case "iPhone12,5": return "iPhone 11 Pro Max"
    case "iPhone12,8": return "iPhone SE (2nd generation)"
    case "iPhone13,1": return "iPhone 12 mini"
    case "iPhone13,2": return "iPhone 12"
    case "iPhone13,3": return "iPhone 12 Pro"
    case "iPhone13,4": return "iPhone 12 Pro Max"
    case "iPhone14,2": return "iPhone 13 Pro"
    case "iPhone14,3": return "iPhone 13 Pro Max"
    case "iPhone14,4": return "iPhone 13 mini"
    case "iPhone14,5": return "iPhone 13"
    case "iPhone14,6": return "iPhone SE (3rd generation)"
    case "iPod1,1": return "iPod touch"
    case "iPod2,1": return "iPod touch (2nd generation)"
    case "iPod3,1": return "iPod touch (3rd generation)"
    case "iPod4,1": return "iPod touch (4th generation)"
    case "iPod5,1": return "iPod touch (5th generation)"
    case "iPod7,1": return "iPod touch (6th generation)"
    case "iPod9,1": return "iPod touch (7th generation)"
    case "iPad1,1": return "iPad"
    case "iPad2,1": return "iPad 2"
    case "iPad2,2": return "iPad 2"
    case "iPad2,3": return "iPad 2"
    case "iPad2,4": return "iPad 2"
    case "iPad2,5": return "iPad mini"
    case "iPad2,6": return "iPad mini"
    case "iPad2,7": return "iPad mini"
    case "iPad3,1": return "iPad (3rd generation)"
    case "iPad3,2": return "iPad (3rd generation)"
    case "iPad3,3": return "iPad (3rd generation)"
    case "iPad3,4": return "iPad (4th generation)"
    case "iPad3,5": return "iPad (4th generation)"
    case "iPad3,6": return "iPad (4th generation)"
    case "iPad4,1": return "iPad Air"
    case "iPad4,2": return "iPad Air"
    case "iPad4,3": return "iPad Air"
    case "iPad4,4": return "iPad mini 2"
    case "iPad4,5": return "iPad mini 2"
    case "iPad4,6": return "iPad mini 2"
    case "iPad4,7": return "iPad mini 3"
    case "iPad4,8": return "iPad mini 3"
    case "iPad4,9": return "iPad mini 3"
    case "iPad5,1": return "iPad mini 4"
    case "iPad5,2": return "iPad mini 4"
    case "iPad5,3": return "iPad Air 2"
    case "iPad5,4": return "iPad Air 2"
    case "iPad6,1": return "iPad (5th generation)"
    case "iPad6,3": return "iPad Pro (9.7-inch)"
    case "iPad6,4": return "iPad Pro (9.7-inch)"
    case "iPad6,7": return "iPad Pro (12.9-inch)"
    case "iPad6,8": return "iPad Pro (12.9-inch)"
    case "iPad6,11": return "iPad (5th generation)"
    case "iPad6,12": return "iPad (5th generation)"
    case "iPad7,1": return "iPad (7th generation)"
    case "iPad7,2": return "iPad Pro (12.9-inch) (2nd generation)"
    case "iPad7,3": return "iPad Pro (10.5-inch)"
    case "iPad7,4": return "iPad Pro (10.5-inch)"
    case "iPad7,5": return "iPad (6th generation)"
    case "iPad7,6": return "iPad (6th generation)"
    case "iPad7,11": return "iPad (7th generation)"
    case "iPad7,12": return "iPad (7th generation)"
    case "iPad8,1": return "iPad Pro (11-inch)"
    case "iPad8,2": return "iPad Pro (11-inch)"
    case "iPad8,3": return "iPad Pro (11-inch)"
    case "iPad8,4": return "iPad Pro (11-inch)"
    case "iPad8,5": return "iPad Pro (12.9-inch) (3rd generation)"
    case "iPad8,6": return "iPad Pro (12.9-inch) (3rd generation)"
    case "iPad8,7": return "iPad Pro (12.9-inch) (3rd generation)"
    case "iPad8,8": return "iPad Pro (12.9-inch) (3rd generation)"
    case "iPad8,9": return "iPad Pro (11-inch) (2nd generation)"
    case "iPad8,10": return "iPad Pro (11-inch) (2nd generation)"
    case "iPad8,11": return "iPad Pro (12.9-inch) (4th generation)"
    case "iPad8,12": return "iPad Pro (12.9-inch) (4th generation)"
    case "iPad11,1": return "iPad mini (5th generation)"
    case "iPad11,2": return "iPad mini (5th generation)"
    case "iPad11,3": return "iPad Air (3rd generation)"
    case "iPad11,4": return "iPad Air (3rd generation)"
    case "iPad11,6": return "iPad (8th generation)"
    case "iPad11,7": return "iPad (8th generation)"
    case "iPad12,1": return "iPad (9th generation)"
    case "iPad12,2": return "iPad (9th generation)"
    case "iPad13,1": return "iPad Air (4th generation)"
    case "iPad13,2": return "iPad Air (4th generation)"
    case "iPad13,4": return "iPad Pro (11-inch) (3rd generation)"
    case "iPad13,5": return "iPad Pro (11-inch) (3rd generation)"
    case "iPad13,6": return "iPad Pro (11-inch) (3rd generation)"
    case "iPad13,7": return "iPad Pro (11-inch) (3rd generation)"
    case "iPad13,8": return "iPad Pro (12.9-inch) (5th generation)"
    case "iPad13,9": return "iPad Pro (12.9-inch) (5th generation)"
    case "iPad13,10": return "iPad Pro (12.9-inch) (5th generation)"
    case "iPad13,11": return "iPad Pro (12.9-inch) (5th generation)"
    case "iPad13,16": return "iPad Air (5th generation)"
    case "iPad13,17": return "iPad Air (5th generation)"
    case "iPad14,1": return "iPad mini (6th generation)"
    case "iPad14,2": return "iPad mini (6th generation)"
    case "Watch1,1": return "Apple Watch (1st generation)"
    case "Watch1,2": return "Apple Watch (1st generation)"
    case "Watch2,3": return "Apple Watch Series 2"
    case "Watch2,4": return "Apple Watch Series 2"
    case "Watch2,6": return "Apple Watch Series 1"
    case "Watch2,7": return "Apple Watch Series 1"
    case "Watch3,1": return "Apple Watch Series 3"
    case "Watch3,2": return "Apple Watch Series 3"
    case "Watch3,3": return "Apple Watch Series 3"
    case "Watch3,4": return "Apple Watch Series 3"
    case "Watch4,1": return "Apple Watch Series 4"
    case "Watch4,2": return "Apple Watch Series 4"
    case "Watch4,3": return "Apple Watch Series 4"
    case "Watch4,4": return "Apple Watch Series 4"
    case "Watch5,1": return "Apple Watch Series 5"
    case "Watch5,2": return "Apple Watch Series 5"
    case "Watch5,3": return "Apple Watch Series 5"
    case "Watch5,4": return "Apple Watch Series 5"
    case "Watch5,9": return "Apple Watch SE"
    case "Watch5,10": return "Apple Watch SE"
    case "Watch5,11": return "Apple Watch SE"
    case "Watch5,12": return "Apple Watch SE"
    case "Watch6,1": return "Apple Watch Series 6"
    case "Watch6,2": return "Apple Watch Series 6"
    case "Watch6,3": return "Apple Watch Series 6"
    case "Watch6,4": return "Apple Watch Series 6"
    case "Watch6,6": return "Apple Watch Series 7"
    case "Watch6,7": return "Apple Watch Series 7"
    case "Watch6,8": return "Apple Watch Series 7"
    case "Watch6,9": return "Apple Watch Series 7"
    case "AudioAccessory1,1": return "HomePod"
    case "AudioAccessory1,2": return "HomePod"
    case "AudioAccessory5,1": return "HomePod mini"
    case "AppleTV1,1": return "Apple TV (1st generation)"
    case "AppleTV2,1": return "Apple TV (2nd generation)"
    case "AppleTV3,1": return "Apple TV (3rd generation)"
    case "AppleTV3,2": return "Apple TV (3rd generation)"
    case "AppleTV5,3": return "Apple TV (4th generation)"
    case "AppleTV6,2": return "Apple TV 4K"
    case "AppleTV11,1": return "Apple TV 4K (2nd generation)"
      
    default:                  return nil
    }
  }
}
