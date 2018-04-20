//
//  ArrayExtention.swift
//  Stock-Yard
//
//  Created by Bilawal Liaqat on 15/11/2017.
//  Copyright © 2017 vteram. All rights reserved.
//

import Foundation
//Array extension for elements conforms the Copying protocol
extension Array where Element: Copying {
    func clone() -> Array {
        var copiedArray = Array<Element>()
        for element in self {
            copiedArray.append(element.copy())
        }
        return copiedArray
    }
}
