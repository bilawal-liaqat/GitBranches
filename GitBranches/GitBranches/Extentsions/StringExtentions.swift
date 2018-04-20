//
//  StringExtentions.swift
//  Stock-Yard
//
//  Created by Bilawal Liaqat on 5/24/17.
//  Copyright © 2017 vteram. All rights reserved.
//

import Foundation

extension String {

        var toDouble: Double {
            return Double(self) ?? 0.0
        }
    
    
    func toNumber() -> NSNumber{
        if let myInteger = Int(self) {
            return NSNumber(value:myInteger)
        }
        return NSNumber(value:0)
    }
    
    
}
