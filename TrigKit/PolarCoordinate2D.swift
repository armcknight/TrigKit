//
//  PolarCoordinate2D.swift
//  TrigKit
//
//  Created by Andrew McKnight on 3/4/17.
//  Copyright © 2017 Andrew McKnight. All rights reserved.
//

import Foundation

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
