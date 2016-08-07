//
//  Definitions.swift
//  TrigKit
//
//  Created by Andrew McKnight on 8/7/16.
//  Copyright © 2016 Andrew McKnight. All rights reserved.
//

import Foundation

public enum Quadrant {
    case First
    case Second
    case Third
    case Fourth

    public init(angle: Radian) {
        let cc = counterClockwiseAngle(angle)
        if cc <= M_PI / 2 {
            self = .First
        } else if cc <= M_PI {
            self = .Second
        } else if cc <= 3 * M_PI / 2 {
            self = .Third
        } else {
            self = .Fourth
        }
    }

    public func isPositiveX() -> Bool {
        return self == .First || self == .Fourth
    }
}

public enum Measure {
    case Hypotenuse
    case Chord

    case Sine
    case Cosine
    case Tangent

    case Secant
    case Cosecant
    case Cotangent

    case Versine
    case Coversine
    
    case Exsecant
    case Excosecant
}
