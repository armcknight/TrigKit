//
//  Functions.swift
//  TrigKit
//
//  Created by Andrew McKnight on 8/7/16.
//  Copyright © 2016 Two Ring Software. All rights reserved.
//

import Foundation

public struct CartesianCoordinate2D {
    public let x: Double
    public let y: Double

    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }

}

extension CartesianCoordinate2D {

    public func distance(to coordinate: CartesianCoordinate2D) -> Double {
        return sqrt(pow(x - coordinate.x, 2) + pow(y - coordinate.y, 2))
    }

}

extension CGPoint {

    public func distance(to coordinate: CGPoint) -> Double {
        return sqrt(pow(Double(x - coordinate.x), 2) + pow(Double(y - coordinate.y), 2))
    }

}

extension CartesianCoordinate2D {

    // MARK: CGPoint conversion

    init(x: CGFloat, y: CGFloat) {
        self.x = Double(x)
        self.y = Double(y)
    }

    public init(cgPoint: CGPoint, size: CGSize) {
        let x = cgPoint.x - size.width / 2
        let y = size.height / 2 - cgPoint.y
        self = CartesianCoordinate2D(x: x, y: y)
    }

    public func cgPoint(_ canvasSize: CGSize) -> CGPoint {
        let x = CGFloat(self.x) + canvasSize.width / 2
        let y = canvasSize.height / 2 - CGFloat(self.y)
        return CGPoint(x: x, y: y);
    }
}

public struct PolarCoordinate2D {
    public let r: Double
    public let theta: Radian
    public let orientation: AngleOrientation

    public init(r: Double, theta: Radian, orientation: AngleOrientation = .counterclockwise) {
        self.r = r
        self.theta = theta
        self.orientation = orientation
    }

    public func cartesian() -> CartesianCoordinate2D {
        let counterclockwiseTheta = orientation == .counterclockwise ? theta : 2 * M_PI - theta
        return CartesianCoordinate2D(x: r * cos(counterclockwiseTheta), y: r * sin(counterclockwiseTheta))
    }
}

public typealias CGCoordinate2D = CartesianCoordinate2D
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
