//
//  TrigKitTests.swift
//  TrigKitTests
//
//  Created by Andrew McKnight on 8/7/16.
//  Copyright © 2016 Two Ring Software. All rights reserved.
//

import XCTest
@testable import TrigKit

class TrigKitTests: XCTestCase {

    func testClockwiseConversion() {
        let counterclockwiseToClockwiseMap: [Degree: Degree] = [
            0: 0,
            1: 359,
            45: 315,
            90: 270,
            179: 181,
            180: 180,
            181: 179,
            270: 90,
            315: 45,
            359: 1,
            400: 310
        ]
        counterclockwiseToClockwiseMap.forEach { counterclockwise, clockwise in
            let clockwiseCalculated = degrees(fromRadians: clockwiseAngle(radians(fromDegrees: counterclockwise)))
            let accuracy = 1e-13
            XCTAssertEqualWithAccuracy(clockwise, clockwiseCalculated, accuracy: accuracy, "expected \(clockwise), got \(clockwiseCalculated)")
        }
    }
    
}
