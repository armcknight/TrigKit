//
//  Definitions.swift
//  TrigKit
//
//  Created by Andrew McKnight on 8/7/16.
//  Copyright © 2016 Two Ring Software. All rights reserved.
//

import Foundation

public enum AngleOrientation {
    case Clockwise
    case Counterclockwise
}

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

    public func isPositiveY() -> Bool {
        return self == .First || self == .Second
    }
}

public enum Measure: Int {
    case Arc
    case Hypotenuse
    case Chord

    case Sine
    case Cosine
    case Tangent

    case SineOpposite
    case CosineOpposite

    case Secant
    case Cosecant
    case Cotangent

    case Versine
    case Coversine
    
    case Exsecant
    case Excosecant

    public func shortName() -> String {
        switch self {
        case .Arc: return "arc"
        case .Hypotenuse: return "hyp"
        case .Chord: return "crd"
        case .Sine, .SineOpposite: return "sin"
        case .Cosine, .CosineOpposite: return "cos"
        case .Tangent: return "tan"
        case .Secant: return "sec"
        case .Cosecant: return "csc"
        case .Cotangent: return "cot"
        case .Versine: return "siv"
        case .Coversine: return "cvs"
        case .Exsecant: return "exsec"
        case .Excosecant: return "excsc"
        }
    }

    public func longName() -> String {
        switch self {
        case .Arc: return "Arc"
        case .Hypotenuse: return "Hypotenuse"
        case .Chord: return "Chord"
        case .Sine: return "Sine"
        case .Cosine: return "Cosine"
        case .SineOpposite: return "Opposite Sine"
        case .CosineOpposite: return "Opposite Cosine"
        case .Tangent: return "Tangent"
        case .Secant: return "Secant"
        case .Cosecant: return "Cosecant"
        case .Cotangent: return "Cotangent"
        case .Versine: return "Versine"
        case .Coversine: return "Coversine"
        case .Exsecant: return "Exsecant"
        case .Excosecant: return "Excosecant"
        }
    }

    public static func allMeasures() -> [Measure] {
        return [
        Arc, Hypotenuse, Chord, Sine, SineOpposite, CosineOpposite, Cosine, Tangent, Secant, Cosecant, Cotangent, Versine, Coversine, Exsecant, Excosecant
        ]
    }
}
