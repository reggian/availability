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
      // iPhone
    case "iPhone1,1":         return "iPhone (1st generation)"
    case "iPhone1,2":         return "iPhone 3G"
    case "iPhone2,1":         return "iPhone 3GS"
    case "iPhone3,1":         return "iPhone 4 (GSM)"
    case "iPhone3,2":         return "iPhone 4 (GSM, 2nd revision)"
    case "iPhone3,3":         return "iPhone 4 (CDMA)"
    case "iPhone4,1":         return "iPhone 4S"
    case "iPhone5,1":         return "iPhone 5 (GSM)"
    case "iPhone5,2":         return "iPhone 5 (GSM+CDMA)"
    case "iPhone5,3":         return "iPhone 5c (GSM)"
    case "iPhone5,4":         return "iPhone 5c (GSM+CDMA)"
    case "iPhone6,1":         return "iPhone 5s (GSM)"
    case "iPhone6,2":         return "iPhone 5s (GSM+CDMA)"
    case "iPhone7,2":         return "iPhone 6"
    case "iPhone7,1":         return "iPhone 6 Plus"
    case "iPhone8,1":         return "iPhone 6s"
    case "iPhone8,2":         return "iPhone 6s Plus"
    case "iPhone8,4":         return "iPhone SE"
    case "iPhone9,1":         return "iPhone 7 (GSM+CDMA)"
    case "iPhone9,3":         return "iPhone 7 (GSM)"
    case "iPhone9,2":         return "iPhone 7 Plus (GSM+CDMA)"
    case "iPhone9,4":         return "iPhone 7 Plus (GSM)"
    case "iPhone10,1":        return "iPhone 8 (GSM+CDMA)"
    case "iPhone10,4":        return "iPhone 8 (GSM)"
    case "iPhone10,2":        return "iPhone 8 Plus (GSM+CDMA)"
    case "iPhone10,5":        return "iPhone 8 Plus (GSM)"
    case "iPhone10,3":        return "iPhone X (GSM+CDMA)"
    case "iPhone10,6":        return "iPhone X (GSM)"
    case "iPhone11,2":        return "iPhone XS"
    case "iPhone11,6":        return "iPhone XS Max"
    case "iPhone11,8":        return "iPhone XR"
    case "iPhone12,1":        return "iPhone 11"
    case "iPhone12,3":        return "iPhone 11 Pro"
    case "iPhone12,5":        return "iPhone 11 Pro Max"
    case "iPhone12,8":        return "iPhone SE (2nd generation)"
    case "iPhone13,1":        return "iPhone 12 mini"
    case "iPhone13,2":        return "iPhone 12"
    case "iPhone13,3":        return "iPhone 12 Pro"
    case "iPhone13,4":        return "iPhone 12 Pro Max"
    case "iPhone14,4":        return "iPhone 13 mini"
    case "iPhone14,5":        return "iPhone 13"
    case "iPhone14,2":        return "iPhone 13 Pro"
    case "iPhone14,3":        return "iPhone 13 Pro Max"
    case "iPhone14,6":        return "iPhone SE (3rd generation)"
      
      // iPod Touch
    case "iPod1,1":           return "iPod Touch (1st generation)"
    case "iPod2,1":           return "iPod Touch (2nd generation)"
    case "iPod3,1":           return "iPod Touch (3rd generation)"
    case "iPod4,1":           return "iPod Touch (4th generation)"
    case "iPod5,1":           return "iPod Touch (5th generation)"
    case "iPod7,1":           return "iPod Touch (6th generation)"
    case "iPod9,1":           return "iPod Touch (7th generation)"
      
      // iPad
    case "iPad1,1":           return "iPad (1st generation)"
    case "iPad2,1":           return "iPad 2 (Wi-Fi)"
    case "iPad2,2":           return "iPad 2 (GSM)"
    case "iPad2,3":           return "iPad 2 (CDMA)"
    case "iPad2,4":           return "iPad 2 (Wi-Fi, Mid 2012)"
    case "iPad3,1":           return "iPad (3rd generation) (Wi-Fi)"
    case "iPad3,2":           return "iPad (3rd generation) (GSM+CDMA)"
    case "iPad3,3":           return "iPad (3rd generation) (GSM)"
    case "iPad3,4":           return "iPad (4th generation) (Wi-Fi)"
    case "iPad3,5":           return "iPad (4th generation) (GSM)"
    case "iPad3,6":           return "iPad (4th generation) (GSM+CDMA)"
    case "iPad6,11":          return "iPad (5th generation) (Wi-Fi)"
    case "iPad6,12":          return "iPad (5th generation) (Cellular)"
    case "iPad7,5":           return "iPad (6th generation) (Wi-Fi)"
    case "iPad7,6":           return "iPad (6th generation) (Cellular)"
    case "iPad7,11":          return "iPad (7th generation) (Wi-Fi)"
    case "iPad7,12":          return "iPad (7th generation) (Cellular)"
    case "iPad11,6":          return "iPad (8th generation) (Wi-Fi)"
    case "iPad11,7":          return "iPad (8th generation) (Cellular)"
    case "iPad12,1":          return "iPad (9th generation) (Wi-Fi)"
    case "iPad12,2":          return "iPad (9th generation) (Cellular)"
      
      // iPad Mini
    case "iPad2,5":           return "iPad mini (Wi-Fi)"
    case "iPad2,6":           return "iPad mini (GSM)"
    case "iPad2,7":           return "iPad mini (GSM+CDMA)"
    case "iPad4,4":           return "iPad mini 2 (Wi-Fi)"
    case "iPad4,5":           return "iPad mini 2 (Cellular)"
    case "iPad4,6":           return "iPad mini 2 (China)"
    case "iPad4,7":           return "iPad mini 3 (Wi-Fi)"
    case "iPad4,8":           return "iPad mini 3 (Cellular)"
    case "iPad4,9":           return "iPad mini 3 (China)"
    case "iPad5,1":           return "iPad mini 4 (Wi-Fi)"
    case "iPad5,2":           return "iPad mini 4 (Cellular)"
    case "iPad11,1":          return "iPad mini (5th generation) (Wi-Fi)"
    case "iPad11,2":          return "iPad mini (5th generation) (Cellular)"
    case "iPad14,1":          return "iPad mini (6th generation) (Wi-Fi)"
    case "iPad14,2":          return "iPad mini (6th generation) (Cellular)"
      
      // iPad Air
    case "iPad4,1":           return "iPad Air (Wi-Fi)"
    case "iPad4,2":           return "iPad Air (Cellular)"
    case "iPad4,3":           return "iPad Air (China)"
    case "iPad5,3":           return "iPad Air 2 (Wi-Fi)"
    case "iPad5,4":           return "iPad Air 2 (Cellular)"
    case "iPad11,3":          return "iPad Air (3rd generation) (Wi-Fi)"
    case "iPad11,4":          return "iPad Air (3rd generation) (Cellular)"
      
      // iPad Pro
    case "iPad6,3":           return "iPad Pro 9.7\" (Wi-Fi)"
    case "iPad6,4":           return "iPad Pro 9.7\" (Cellular)"
    case "iPad6,7":           return "iPad Pro 12.9\" (Wi-Fi)"
    case "iPad6,8":           return "iPad Pro 12.9\" (Cellular)"
    case "iPad7,1":           return "iPad Pro 12.9\" (2nd generation) (Wi-Fi)"
    case "iPad7,2":           return "iPad Pro 12.9\" (2nd generation) (Cellular)"
    case "iPad7,3":           return "iPad Pro 10.5\" (Wi-Fi)"
    case "iPad7,4":           return "iPad Pro 10.5\" (Cellular)"
    case "iPad8,1":           return "iPad Pro 11\" (Wi-Fi)"
    case "iPad8,2":           return "iPad Pro 11\" (Wi-Fi, 1TB)"
    case "iPad8,3":           return "iPad Pro 11\" (Cellular)"
    case "iPad8,4":           return "iPad Pro 11\" (Cellular 1TB)"
    case "iPad8,5":           return "iPad Pro 12.9\" (3rd generation) (Wi-Fi)"
    case "iPad8,6":           return "iPad Pro 12.9\" (3rd generation) (Cellular)"
    case "iPad8,7":           return "iPad Pro 12.9\" (3rd generation) (Wi-Fi, 1TB)"
    case "iPad8,8":           return "iPad Pro 12.9\" (3rd generation) (Cellular, 1TB)"
    case "iPad8,11":          return "iPad Pro 12.9\" (4th generation)"
    case "iPad8,12":          return "iPad Pro 12.9\" (4th generation)"
    case "iPad13,8":          return "iPad Pro 12.9\" (5th generation)"
    case "iPad13,9":          return "iPad Pro 12.9\" (5th generation)"
    case "iPad13,10":         return "iPad Pro 12.9\" (5th generation)"
    case "iPad13,11":         return "iPad Pro 12.9\" (5th generation)"
      
      // HomePod
    case "AudioAccessory1,1": return "HomePod"
    case "AudioAccessory5,1": return "HomePod mini"
      
      // Apple TV
    case "AppleTV2,1":        return "Apple TV 2G"
    case "AppleTV3,1":        return "Apple TV 3"
    case "AppleTV3,2":        return "Apple TV 3 (2013)"
    case "AppleTV5,3":        return "Apple TV 4"
    case "AppleTV6,2":        return "Apple TV 4K"
      
      // Apple Watch
    case "Watch1,1":          return "Apple Watch (1st generation) (38mm)"
    case "Watch1,2":          return "Apple Watch (1st generation) (42mm)"
    case "Watch2,6":          return "Apple Watch Series 1 (38mm)"
    case "Watch2,7":          return "Apple Watch Series 1 (42mm)"
    case "Watch2,3":          return "Apple Watch Series 2 (38mm)"
    case "Watch2,4":          return "Apple Watch Series 2 (42mm)"
    case "Watch3,1":          return "Apple Watch Series 3 (38mm Cellular)"
    case "Watch3,2":          return "Apple Watch Series 3 (42mm Cellular)"
    case "Watch3,3":          return "Apple Watch Series 3 (38mm)"
    case "Watch3,4":          return "Apple Watch Series 3 (42mm)"
    case "Watch4,1":          return "Apple Watch Series 4 (40mm)"
    case "Watch4,2":          return "Apple Watch Series 4 (44mm)"
    case "Watch4,3":          return "Apple Watch Series 4 (40mm Cellular)"
    case "Watch4,4":          return "Apple Watch Series 4 (44mm Cellular)"
      //else if platform == "Watch"    { return "Apple Watch Series 5 (40mm)" } //5,1?
      //else if platform == "Watch"    { return "Apple Watch Series 5 (44mm)" } //5,2?
      //else if platform == "Watch"    { return "Apple Watch Series 5 (40mm Cellular)" } //5,3?
      //else if platform == "Watch"    { return "Apple Watch Series 5 (44mm Cellular)" } //5,4?
      
      // Unhandled
    default:                  return nil
    }
  }
}
