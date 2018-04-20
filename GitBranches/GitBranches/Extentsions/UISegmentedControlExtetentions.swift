//
//  UISegmentedControlExtetentions.swift
//  Stock-Yard
//
//  Created by Bilawal Liaqat on 6/14/17.
//  Copyright © 2017 vteram. All rights reserved.
//

import Foundation
import UIKit

extension UISegmentedControl {
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: backgroundColor!), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: tintColor!), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        addBorder();
    }
    
    private func addBorder(){
    
        self.layer.cornerRadius = CGFloat(5)
        self.layer.borderWidth = 1
        self.layer.borderColor = AppTheme.bottomBackgroudColor().cgColor
        self.clipsToBounds = true
    }
    
    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}
