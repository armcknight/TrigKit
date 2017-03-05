//
//  Definitions.swift
//  TrigKit
//
//  Created by Andrew McKnight on 8/7/16.
//  Copyright © 2016 Two Ring Software. All rights reserved.
//

import Foundation

public enum Quadrant {
    case first
    case second
    case third
    case fourth

    public init(angle: Angle) {
        let cc = angle.counterclockwise.radians
        if cc <= M_PI / 2 {
            self = .first
        } else if cc <= M_PI {
            self = .second
        } else if cc <= 3 * M_PI / 2 {
            self = .third
        } else {
            self = .fourth
        }
    }

    public func isPositiveX() -> Bool {
        return self == .first || self == .fourth
    }

    public func isPositiveY() -> Bool {
        return self == .first || self == .second
    }
}

public enum Measure: Int {
    case arc
    case hypotenuse
    case chord

    case sine
    case cosine
    case tangent

    case sineOpposite
    case cosineOpposite

    case secant
    case cosecant
    case cotangent

    case versine
    case coversine
    
    case exsecant
    case excosecant

    public func shortName() -> String {
        switch self {
        case .arc: return "arc"
        case .hypotenuse: return "hyp"
        case .chord: return "crd"
        case .sine, .sineOpposite: return "sin"
        case .cosine, .cosineOpposite: return "cos"
        case .tangent: return "tan"
        case .secant: return "sec"
        case .cosecant: return "csc"
        case .cotangent: return "cot"
        case .versine: return "siv"
        case .coversine: return "cvs"
        case .exsecant: return "exsec"
        case .excosecant: return "excsc"
        }
    }

    public func longName() -> String {
        switch self {
        case .arc: return "Arc"
        case .hypotenuse: return "Hypotenuse"
        case .chord: return "Chord"
        case .sine: return "Sine"
        case .cosine: return "Cosine"
        case .sineOpposite: return "Opposite Sine"
        case .cosineOpposite: return "Opposite Cosine"
        case .tangent: return "Tangent"
        case .secant: return "Secant"
        case .cosecant: return "Cosecant"
        case .cotangent: return "Cotangent"
        case .versine: return "Versine"
        case .coversine: return "Coversine"
        case .exsecant: return "Exsecant"
        case .excosecant: return "Excosecant"
        }
    }

    public static func allMeasures() -> [Measure] {
        return [
        arc, hypotenuse, chord, sine, sineOpposite, cosineOpposite, cosine, tangent, secant, cosecant, cotangent, versine, coversine, exsecant, excosecant
        ]
    }
}
