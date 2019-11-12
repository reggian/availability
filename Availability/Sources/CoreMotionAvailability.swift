//
// CoreMotionAvailability.swift
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
import CoreMotion

public class CoreMotionAvailability {
  
  public static func checkAvailability() {
    printFramework("CoreMotion")
    checkPedometerAvailability()
    checkMotionManagerAvailability()
    checkMotionActivityAvailability()
    checkSensorRecorderAvailability()
    checkAltimeterAvailability()
  }
  
  static func checkPedometerAvailability() {
    printComponent("CMPedometer")
    printAvailability(name: "isStepCountingAvailable", available: CMPedometer.isStepCountingAvailable())
    printAvailability(name: "isDistanceAvailable", available: CMPedometer.isDistanceAvailable())
    printAvailability(name: "isFloorCountingAvailable", available: CMPedometer.isFloorCountingAvailable())
    printAvailability(name: "isPaceAvailable", available: CMPedometer.isPaceAvailable())
    #if os(iOS)
    printAvailability(name: "isCadenceAvailable", available: CMPedometer.isCadenceAvailable())
    printAvailability(name: "isPedometerEventTrackingAvailable", available: CMPedometer.isPedometerEventTrackingAvailable())
    #endif
  }
  
  static func checkMotionManagerAvailability() {
    #if os(iOS)
    let motionManager = CMMotionManager()
    printComponent("CMMotionManager")
    printAvailability(name: "isAccelerometerAvailable", available: motionManager.isAccelerometerAvailable)
    printAvailability(name: "isGyroAvailable", available: motionManager.isGyroAvailable)
    printAvailability(name: "isMagnetometerAvailable", available: motionManager.isMagnetometerAvailable)
    printAvailability(name: "isDeviceMotionAvailable", available: motionManager.isDeviceMotionAvailable)
    #endif
  }
  
  static func checkMotionActivityAvailability() {
    #if os(iOS)
    printComponent("CMMotionActivityManager")
    printAvailability(name: "isActivityAvailable", available: CMMotionActivityManager.isActivityAvailable())
    #endif
  }
  
  static func checkSensorRecorderAvailability() {
    #if os(iOS)
    printComponent("CMSensorRecorder")
    printAvailability(name: "isAccelerometerRecordingAvailable", available: CMSensorRecorder.isAccelerometerRecordingAvailable())
    #endif
  }
  
  static func checkAltimeterAvailability() {
    #if os(iOS)
    printComponent("CMAltimeter")
    printAvailability(name: "isRelativeAltitudeAvailable", available: CMAltimeter.isRelativeAltitudeAvailable())
    #endif
  }
  
}
