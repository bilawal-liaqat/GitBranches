//
//  ABImageView.swift
//  Stock-Yard
//
//  Created by Bilawal Liaqat on 4/27/17.
//  Copyright © 2017 vteram. All rights reserved.
//



import UIKit

@IBDesignable class ABImageView: UIImageView {
    
    @IBInspectable var cornarRadius:CGFloat = 0.0 {
        
        didSet {
            layer.cornerRadius = cornarRadius
        }
        
    }
    
    @IBInspectable var borderWidth:CGFloat = 0.0 {
        
        didSet {
            layer.borderWidth = borderWidth
            layer.borderColor = borderColor.cgColor
        }
        
    }
    
    @IBInspectable var borderColor:UIColor = AppTheme.textViewBorderColor() {
        
        didSet {
            layer.borderColor = borderColor.cgColor
            if borderWidth == 0 {borderWidth = 1.0}
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        
        didSet {
            bottomShadow = true
        }
    }
    
    @IBInspectable var rotateAngle: CGFloat = 0 {
        
        didSet {
            //            layer.transform = CATransform3DMakeRotation((rotateAngle * CGFloat(M_PI) / 180.0), 0, 0, 1)
            //            transform = CGAffineTransformMakeRotation(rotateAngle * CGFloat(M_PI) / 180.0)
            transform = transform.rotated(by: rotateAngle * CGFloat(M_PI) / 180.0)
        }
    }
    
    @IBInspectable var bottomShadow:Bool = false {
        didSet {
            if bottomShadow {
                
                layer.shadowColor = shadowColor.cgColor
                layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
                layer.shadowOpacity = 0.5
                layer.shadowRadius = 3.0;
                layer.masksToBounds = false;
                
            }
        }
    }
    
}
