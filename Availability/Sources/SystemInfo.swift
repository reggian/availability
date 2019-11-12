//
// SystemInfo.swift
// Availability
//
// MIT License
//
// Copyright (c) 2019 reggian
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

public class SystemInfo {
  
  public static func checkCurrentSystem() {
    printDeviceInfo(name: deviceName(), hw: hwMachine())
  }
  
  static func hwMachine() -> String {
    var size = 0
    sysctlbyname("hw.machine", nil, &size, nil, 0)
    var machine = [CChar](repeating: 0,  count: Int(size))
    sysctlbyname("hw.machine", &machine, &size, nil, 0)
    return String(cString: machine)
  }
  
  static func deviceName() -> String {
      let machine = hwMachine()

      //iPhone
      if machine == "iPhone1,1"        { return "iPhone (1st generation)" }
      else if machine == "iPhone1,2"   { return "iPhone 3G" }
      else if machine == "iPhone2,1"   { return "iPhone 3GS" }
      else if machine == "iPhone3,1"   { return "iPhone 4 (GSM)" }
      else if machine == "iPhone3,2"   { return "iPhone 4 (GSM, 2nd revision)" }
      else if machine == "iPhone3,3"   { return "iPhone 4 (CDMA)" }
      else if machine == "iPhone4,1"   { return "iPhone 4S" }
      else if machine == "iPhone5,1"   { return "iPhone 5 (GSM)" }
      else if machine == "iPhone5,2"   { return "iPhone 5 (GSM+CDMA)" }
      else if machine == "iPhone5,3"   { return "iPhone 5c (GSM)" }
      else if machine == "iPhone5,4"   { return "iPhone 5c (GSM+CDMA)" }
      else if machine == "iPhone6,1"   { return "iPhone 5s (GSM)" }
      else if machine == "iPhone6,2"   { return "iPhone 5s (GSM+CDMA)" }
      else if machine == "iPhone7,2"   { return "iPhone 6" }
      else if machine == "iPhone7,1"   { return "iPhone 6 Plus" }
      else if machine == "iPhone8,1"   { return "iPhone 6s" }
      else if machine == "iPhone8,2"   { return "iPhone 6s Plus" }
      else if machine == "iPhone8,4"   { return "iPhone SE" }
      else if machine == "iPhone9,1"   { return "iPhone 7 (GSM+CDMA)" }
      else if machine == "iPhone9,3"   { return "iPhone 7 (GSM)" }
      else if machine == "iPhone9,2"   { return "iPhone 7 Plus (GSM+CDMA)" }
      else if machine == "iPhone9,4"   { return "iPhone 7 Plus (GSM)" }
      else if machine == "iPhone10,1"  { return "iPhone 8 (GSM+CDMA)" }
      else if machine == "iPhone10,4"  { return "iPhone 8 (GSM)" }
      else if machine == "iPhone10,2"  { return "iPhone 8 Plus (GSM+CDMA)" }
      else if machine == "iPhone10,5"  { return "iPhone 8 Plus (GSM)" }
      else if machine == "iPhone10,3"  { return "iPhone X (GSM+CDMA)" }
      else if machine == "iPhone10,6"  { return "iPhone X (GSM)" }
      else if machine == "iPhone11,2"  { return "iPhone XS" }
      else if machine == "iPhone11,6"  { return "iPhone XS Max" }
      else if machine == "iPhone11,8"  { return "iPhone XR" }
      else if machine == "iPhone12,1"  { return "iPhone 11" }
      else if machine == "iPhone12,3"  { return "iPhone 11 Pro" }
      else if machine == "iPhone12,5"  { return "iPhone 11 Pro Max" }

      //iPod Touch
      else if machine == "iPod1,1"     { return "iPod Touch (1st generation)" }
      else if machine == "iPod2,1"     { return "iPod Touch (2nd generation)" }
      else if machine == "iPod3,1"     { return "iPod Touch (3rd generation)" }
      else if machine == "iPod4,1"     { return "iPod Touch (4th generation)" }
      else if machine == "iPod5,1"     { return "iPod Touch (5th generation)" }
      else if machine == "iPod7,1"     { return "iPod Touch (6th generation)" }
      else if machine == "iPod9,1"     { return "iPod Touch (7th generation)" }

      //iPad
      else if machine == "iPad1,1"     { return "iPad (1st generation)" }
      else if machine == "iPad2,1"     { return "iPad 2 (Wi-Fi)" }
      else if machine == "iPad2,2"     { return "iPad 2 (GSM)" }
      else if machine == "iPad2,3"     { return "iPad 2 (CDMA)" }
      else if machine == "iPad2,4"     { return "iPad 2 (Wi-Fi, Mid 2012)" }
      else if machine == "iPad3,1"     { return "iPad (3rd generation) (Wi-Fi)" }
      else if machine == "iPad3,2"     { return "iPad (3rd generation) (GSM+CDMA)" }
      else if machine == "iPad3,3"     { return "iPad (3rd generation) (GSM)" }
      else if machine == "iPad3,4"     { return "iPad (4th generation) (Wi-Fi)"}
      else if machine == "iPad3,5"     { return "iPad (4th generation) (GSM)" }
      else if machine == "iPad3,6"     { return "iPad (4th generation) (GSM+CDMA)" }
      else if machine == "iPad6,11"    { return "iPad (5th generation) (Wi-Fi)" }
      else if machine == "iPad6,12"    { return "iPad (5th generation) (Cellular)" }
      else if machine == "iPad7,5"     { return "iPad (6th generation) (Wi-Fi)" }
      else if machine == "iPad7,6"     { return "iPad (6th generation) (Cellular)" }
      else if machine == "iPad7,11"     { return "iPad (7th generation) (Wi-Fi)" }
      else if machine == "iPad7,12"     { return "iPad (7th generation) (Cellular)" }

      //iPad Mini
      else if machine == "iPad2,5"     { return "iPad mini (Wi-Fi)" }
      else if machine == "iPad2,6"     { return "iPad mini (GSM)" }
      else if machine == "iPad2,7"     { return "iPad mini (GSM+CDMA)" }
      else if machine == "iPad4,4"     { return "iPad mini 2 (Wi-Fi)" }
      else if machine == "iPad4,5"     { return "iPad mini 2 (Cellular)" }
      else if machine == "iPad4,6"     { return "iPad mini 2 (China)" }
      else if machine == "iPad4,7"     { return "iPad mini 3 (Wi-Fi)" }
      else if machine == "iPad4,8"     { return "iPad mini 3 (Cellular)" }
      else if machine == "iPad4,9"     { return "iPad mini 3 (China)" }
      else if machine == "iPad5,1"     { return "iPad mini 4 (Wi-Fi)" }
      else if machine == "iPad5,2"     { return "iPad mini 4 (Cellular)" }
      else if machine == "iPad11,1"    { return "iPad mini (5th generation) (Wi-Fi)" }
      else if machine == "iPad11,2"    { return "iPad mini (5th generation)  (Cellular)" }

      //iPad Air
      else if machine == "iPad4,1"     { return "iPad Air (Wi-Fi)" }
      else if machine == "iPad4,2"     { return "iPad Air (Cellular)" }
      else if machine == "iPad4,3"     { return "iPad Air (China)" }
      else if machine == "iPad5,3"     { return "iPad Air 2 (Wi-Fi)" }
      else if machine == "iPad5,4"     { return "iPad Air 2 (Cellular)" }
      else if machine == "iPad11,3"    { return "iPad Air (3rd generation) (Wi-Fi)" }
      else if machine == "iPad11,4"    { return "iPad Air (3rd generation) (Cellular)" }

      //iPad Pro
      else if machine == "iPad6,3"     { return "iPad Pro 9.7\" (Wi-Fi)" }
      else if machine == "iPad6,4"     { return "iPad Pro 9.7\" (Cellular)" }
      else if machine == "iPad6,7"     { return "iPad Pro 12.9\" (Wi-Fi)" }
      else if machine == "iPad6,8"     { return "iPad Pro 12.9\" (Cellular)" }
      else if machine == "iPad7,1"     { return "iPad Pro 12.9\" (2nd generation) (Wi-Fi)" }
      else if machine == "iPad7,2"     { return "iPad Pro 12.9\" (2nd generation) (Cellular)" }
      else if machine == "iPad7,3"     { return "iPad Pro 10.5\" (Wi-Fi)" }
      else if machine == "iPad7,4"     { return "iPad Pro 10.5\" (Cellular)" }
      else if machine == "iPad8,1"     { return "iPad Pro 11\" (Wi-Fi)" }
      else if machine == "iPad8,2"     { return "iPad Pro 11\" (Wi-Fi, 1TB)" }
      else if machine == "iPad8,3"     { return "iPad Pro 11\" (Cellular)" }
      else if machine == "iPad8,4"     { return "iPad Pro 11\" (Cellular 1TB)" }
      else if machine == "iPad8,5"     { return "iPad Pro 12.9\" (3rd generation) (Wi-Fi)" }
      else if machine == "iPad8,6"     { return "iPad Pro 12.9\" (3rd generation) (Cellular)" }
      else if machine == "iPad8,7"     { return "iPad Pro 12.9\" (3rd generation) (Wi-Fi, 1TB)" }
      else if machine == "iPad8,8"     { return "iPad Pro 12.9\" (3rd generation) (Cellular, 1TB)" }

      //Apple TV
      else if machine == "AppleTV2,1"  { return "Apple TV 2G" }
      else if machine == "AppleTV3,1"  { return "Apple TV 3" }
      else if machine == "AppleTV3,2"  { return "Apple TV 3 (2013)" }
      else if machine == "AppleTV5,3"  { return "Apple TV 4" }
      else if machine == "AppleTV6,2"  { return "Apple TV 4K" }

      //Apple Watch
      else if machine == "Watch1,1"    { return "Apple Watch (1st generation) (38mm)" }
      else if machine == "Watch1,2"    { return "Apple Watch (1st generation) (42mm)" }
      else if machine == "Watch2,6"    { return "Apple Watch Series 1 (38mm)" }
      else if machine == "Watch2,7"    { return "Apple Watch Series 1 (42mm)" }
      else if machine == "Watch2,3"    { return "Apple Watch Series 2 (38mm)" }
      else if machine == "Watch2,4"    { return "Apple Watch Series 2 (42mm)" }
      else if machine == "Watch3,1"    { return "Apple Watch Series 3 (38mm Cellular)" }
      else if machine == "Watch3,2"    { return "Apple Watch Series 3 (42mm Cellular)" }
      else if machine == "Watch3,3"    { return "Apple Watch Series 3 (38mm)" }
      else if machine == "Watch3,4"    { return "Apple Watch Series 3 (42mm)" }
      else if machine == "Watch4,1"    { return "Apple Watch Series 4 (40mm)" }
      else if machine == "Watch4,2"    { return "Apple Watch Series 4 (44mm)" }
      else if machine == "Watch4,3"    { return "Apple Watch Series 4 (40mm Cellular)" }
      else if machine == "Watch4,4"    { return "Apple Watch Series 4 (44mm Cellular)" }
      //else if platform == "Watch"    { return "Apple Watch Series 5 (40mm)" } //5,1?
      //else if platform == "Watch"    { return "Apple Watch Series 5 (44mm)" } //5,2?
      //else if platform == "Watch"    { return "Apple Watch Series 5 (40mm Cellular)" } //5,3?
      //else if platform == "Watch"    { return "Apple Watch Series 5 (44mm Cellular)" } //5,4?

      //Simulator
      else if machine == "i386"        { return "Simulator" }
      else if machine == "x86_64"      { return "Simulator"}

      return machine
  }

}
