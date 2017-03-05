//
//  Functions.swift
//  TrigKit
//
//  Created by Andrew McKnight on 8/7/16.
//  Copyright © 2016 Two Ring Software. All rights reserved.
//

import CoreGraphics
import Foundation

extension CGPoint {

    public func distance(to coordinate: CGPoint) -> Double {
        return sqrt(pow(Double(x - coordinate.x), 2) + pow(Double(y - coordinate.y), 2))
    }

}

public typealias Degree = Double
public typealias Radian = Double

public func angleFrom(_ a: CartesianCoordinate2D, to b: CartesianCoordinate2D) -> Radian {
    let xDist = a.x - b.x
    let yDist = a.y - b.y
    let angle = atan2(yDist, xDist)
    return angle + M_PI
}

public func radians(fromDegrees degrees: Degree) -> Radian {
    return degrees * M_PI / 180.0
}

public func degrees(fromRadians radians: Radian) -> Degree {
    return radians * 180.0 / M_PI
}

/// Reduce any angle to its counter-clockwise equivalent in `[0,2π]`
public func counterClockwiseAngle(_ radians: Radian) -> Radian {
    return (2.0 * M_PI + radians).truncatingRemainder(dividingBy: (2.0 * M_PI))
}

/// Reduce any angle to its clockwise equivalent in `[0,2π]`
public func clockwiseAngle(_ radians: Radian) -> Radian {
    return (2.0 * M_PI - radians).truncatingRemainder(dividingBy: (2.0 * M_PI))
}
