//
//  RoundCornerButton.swift
//  Stock-Yard
//
//  Created by Bilawal Liaqat on 4/12/17.
//  Copyright © 2017 vteram. All rights reserved.
//

import UIKit

@IBDesignable class RoundCornerButton: UIButton {

   
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func drawRect(rect: CGRect) {
//        // Drawing code
//    }
 
//    private func setCustomTitleFont(){
//    self.titleLabel?.font = UIFont.systemFontOfSize((self.titleLabel?.font.pointSize)!)
//    
//    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable var titleColor: UIColor? {
        didSet {
            self.titleLabel?.textColor = titleColor
        }
    }
    
    @IBInspectable var titleFont: UIFont? {
        didSet {
            self.titleLabel?.font = titleFont
        }
    }


}
