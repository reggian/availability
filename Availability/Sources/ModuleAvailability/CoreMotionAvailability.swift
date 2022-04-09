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

class CoreMotionAvailability {
  func availability() -> ModuleInfo {
    .init(
      name: "CoreMotion",
      components: [
        CMPedometerAvailability().availability(),
        CMMotionManagerAvailability().availability(),
        CMMotionActivityManagerAvailability().availability(),
        CMSensorRecorderAvailability().availability(),
        CMAltimeterAvailability().availability(),
      ]
    )
  }
}

class CMPedometerAvailability {
  func availability() -> ComponentInfo {
    return .init(
      name: "CMPedometer",
      availability: [
        "isStepCountingAvailable": CMPedometer.isStepCountingAvailable(),
        "isDistanceAvailable": CMPedometer.isDistanceAvailable(),
        "isFloorCountingAvailable": CMPedometer.isFloorCountingAvailable(),
        "isPaceAvailable": CMPedometer.isPaceAvailable(),
        "isCadenceAvailable": CMPedometer.isCadenceAvailable(),
        "isPedometerEventTrackingAvailable": CMPedometer.isPedometerEventTrackingAvailable(),
      ]
    )
  }
}

class CMMotionManagerAvailability {
  func availability() -> ComponentInfo {
    let motionManager = CMMotionManager()
    return .init(
      name: "CMMotionManager",
      availability: [
        "isAccelerometerAvailable": motionManager.isAccelerometerAvailable,
        "isGyroAvailable": motionManager.isGyroAvailable,
        "isMagnetometerAvailable": motionManager.isMagnetometerAvailable,
        "isDeviceMotionAvailable": motionManager.isDeviceMotionAvailable,
      ]
    )
  }
}

class CMMotionActivityManagerAvailability {
  func availability() -> ComponentInfo {
    .init(
      name: "CMMotionActivityManager",
      availability: [
        "isActivityAvailable": CMMotionActivityManager.isActivityAvailable()
      ]
    )
  }
}

class CMSensorRecorderAvailability {
  func availability() -> ComponentInfo {
    .init(
      name: "CMSensorRecorder",
      availability: [
        "isAccelerometerRecordingAvailable": CMSensorRecorder.isAccelerometerRecordingAvailable()
      ]
    )
  }
}

class CMAltimeterAvailability {
  func availability() -> ComponentInfo {
    .init(
      name: "CMAltimeter",
      availability: [
        "isRelativeAltitudeAvailable": CMAltimeter.isRelativeAltitudeAvailable()
      ]
    )
  }
}
