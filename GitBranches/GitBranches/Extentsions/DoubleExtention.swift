//
//  DoubleExtention.swift
//  Stock-Yard
//
//  Created by Bilawal Liaqat on 7/21/17.
//  Copyright © 2017 vteram. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
