//
//  DictionaryExtentions.swift
//  Stock-Yard
//
//  Created by Bilawal Liaqat on 7/24/17.
//  Copyright © 2017 vteram. All rights reserved.
//

import Foundation


extension Dictionary {
    mutating func update(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}
