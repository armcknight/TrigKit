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
