//
//  Functions.swift
//  TrigKit
//
//  Created by Andrew McKnight on 8/7/16.
//  Copyright © 2016 Andrew McKnight. All rights reserved.
//

import Foundation

public struct CartesianCoordinate2D {
    let x: Double
    let y: Double
}

public struct PolarCoordinate2D {
    let r: Double
    let theta: Radian
}

public typealias CGCoordinate2D = CartesianCoordinate2D
public typealias Degree = Double
public typealias Radian = Double

public func cgCoordinateFrom(cartesianCoordinate: CartesianCoordinate2D) -> CGCoordinate2D {
    return CGCoordinate2D(x: cartesianCoordinate.x, y: -cartesianCoordinate.y)
}

public func cartesianCoordinateFrom(cgCoordinate: CGCoordinate2D) -> CartesianCoordinate2D {
    return CartesianCoordinate2D(x: cgCoordinate.x, y: -cgCoordinate.y)
}

public func angleFrom(a: CartesianCoordinate2D, b: CartesianCoordinate2D) -> Radian {
    let xDist = a.x - b.x
    let yDist = a.y - b.y
    let angle = atan2(yDist, xDist)
    return angle + M_PI
}

public func cartesianPointFrom(polarPoint: PolarCoordinate2D) -> CartesianCoordinate2D {
    return CartesianCoordinate2D(x: polarPoint.r * cos(polarPoint.theta), y: polarPoint.r * sin(polarPoint.theta))
}

public func radians(fromDegrees degrees: Degree) -> Radian {
    return degrees * M_PI / 180.0
}

public func degrees(fromRadians radians: Radian) -> Degree {
    return radians * 180.0 / M_PI
}

/// Reduce any angle to its counter-clockwise equivalent in `[0,2π]`
func counterClockwiseAngle(radians: Radian) -> Radian {
    return (2.0 * M_PI + radians) % (2.0 * M_PI)
}

/// Reduce any angle to its clockwise equivalent in `[0,2π]`
func clockwiseAngle(radians: Radian) -> Radian {
    return (2.0 * M_PI - radians) % (2.0 * M_PI)
}
