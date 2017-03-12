//
//  Angle.swift
//  TrigKit
//
//  Created by Andrew McKnight on 3/4/17.
//  Copyright © 2017 Andrew McKnight. All rights reserved.
//

import Foundation

public typealias Degree = Double
public typealias Radian = Double

public enum AngleOrientation {

    case clockwise
    case counterclockwise
    
}

public struct Angle {

    public var radians: Radian
    var orientation: AngleOrientation

    public init(radians: Radian, orientation: AngleOrientation = .counterclockwise) {
        self.radians = radians
        self.orientation = orientation
    }

    public init(degrees: Degree, orientation: AngleOrientation = .counterclockwise) {
        self.radians = Angle.radians(fromDegrees: degrees)
        self.orientation = orientation
    }

    public static var zero: Angle { get { return Angle(radians: 0) } }
    public static var π: Angle { get { return Angle(radians: M_PI) } }

    public func isZero() -> Bool {
        return radians == 0
    }

    public var degrees: Double {
        return Angle.degrees(fromRadians: radians)
    }

    public var minimized: Angle {
        get {
            return Angle(radians: fmod(radians, 2.0 * M_PI))
        }
    }

    /// Reduce any angle to its clockwise equivalent in `[0,2π]`
    public var clockwise: Angle {
        get {
            let value = (2.0 * M_PI - radians).truncatingRemainder(dividingBy: (2.0 * M_PI))
            return Angle(radians: value, orientation: .clockwise)
        }
    }

    /// Reduce any angle to its counter-clockwise equivalent in `[0,2π]`
    public var counterclockwise: Angle {
        get {
            let value = (2.0 * M_PI + radians).truncatingRemainder(dividingBy: (2.0 * M_PI))
            return Angle(radians: value, orientation: .counterclockwise)
        }
    }

}

private extension Angle {

    static func degrees(fromRadians radians: Radian) -> Degree {
        return radians * 180.0 / M_PI
    }

    static func radians(fromDegrees degrees: Degree) -> Radian {
        return degrees * M_PI / 180.0
    }

}

public func sin(_ x: Angle) -> Double { return sin(x.counterclockwise.radians) }
public func cos(_ x: Angle) -> Double { return cos(x.counterclockwise.radians) }
