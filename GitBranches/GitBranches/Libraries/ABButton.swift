//
//  ABButton.swift
//  Lango
//
//  Created by Asif Bilal on 02/08/2016.
//  Copyright © 2016 Asif Bilal. All rights reserved.
//

import UIKit


@IBDesignable class ABButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clipsToBounds = true
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        shouldCirlceButton = true
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? selectedBackgroundColor : normalBackgroundColor
            layer.borderColor =   isSelected ? selectedBorderColor.cgColor : borderColor.cgColor
        }
    }
    
    @IBInspectable var selectedBackgroundColor : UIColor = AppTheme.disableGrayColor() {
        didSet {
            backgroundColor = isSelected ? selectedBackgroundColor : normalBackgroundColor

        }
    }
   
    @IBInspectable var normalBackgroundColor : UIColor! = AppTheme.whiteColor() {
        didSet {
            backgroundColor = isSelected ? selectedBackgroundColor : normalBackgroundColor
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            if !shouldCirlceButton {
                layer.cornerRadius = cornerRadius
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = AppTheme.textViewBorderColor() {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var selectedBorderColor: UIColor = AppTheme.textViewBorderColor() {
        didSet {
            layer.borderColor =   isSelected ? selectedBorderColor.cgColor : borderColor.cgColor
            
        }
    }

    
    @IBInspectable var shadowColor: UIColor = AppTheme.whiteColor() {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize.zero {
        didSet {
            layer.shadowOffset = shadowOffset
            layer.shadowOpacity = 1.0
            layer.shadowRadius = 1.0
        }
    }
    
    @IBInspectable var textAlignment: Int = 0 {
        didSet {
            titleLabel?.textAlignment = NSTextAlignment(rawValue:textAlignment)!
        }
    }
    
    @IBInspectable var shouldCirlceButton: Bool = false {
        didSet {
            if shouldCirlceButton == true {
                layer.cornerRadius = bounds.width/2
            } else {
                layer.cornerRadius = 0
            }
        }
    }

}
