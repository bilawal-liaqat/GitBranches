//
//  ModifiedTextfield.swift
//  Stock-Yard
//
//  Created by Bilawal Liaqat on 4/12/17.
//  Copyright © 2017 vteram. All rights reserved.
//

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


@IBDesignable class ModifiedTextfield: UITextField {
    
    
    
    fileprivate var ImgIcon: UIImageView?
    
    @IBInspectable var errorEntry: Bool = false {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderColour:UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColour.cgColor
            layer.masksToBounds = true
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.masksToBounds = borderWidth > 0
        }
    }
    @IBInspectable var leftTextPedding: Int = 0 {
        didSet {
            self.setNeedsDisplay()
            
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(leftTextPedding), height: self.frame.height))
            self.leftViewMode = .always
        }
    }
    @IBInspectable var lineColor: UIColor = UIColor.white {
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable var placeHolerColor: UIColor = UIColor.lightText {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var errorColor: UIColor = UIColor.red {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var imageWidth: Int = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    
    @IBInspectable var leftIconName : String = "" {
        didSet {
            setLeftImage()
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var rightImageWidth: Int = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var rightIconName: String = "" {
        didSet {
            setRightImageWithName()
            self.setNeedsDisplay()
        }
    }
    
    //        override func textRectForBounds(bounds: CGRect) -> CGRect {
    //            return self.newBounds(bounds)
    //        }
    //        override func editingRectForBounds(bounds: CGRect) -> CGRect {
    //            return self.newBounds(bounds)
    //        }
    
    fileprivate func newBounds(_ bounds: CGRect) -> CGRect {
        
        var newBounds = bounds
        newBounds.origin.x += CGFloat(leftTextPedding) //+ CGFloat(imageWidth)
        
        return newBounds
    }
    
    fileprivate func setLeftImage() {
        //setting left image
        if  leftIconName.characters.count > 1 && leftView == nil
        {
            let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: CGFloat(imageWidth), height: self.frame.height))
            imgView.tintColor = self.tintColor
            imgView.image = UIImage(named: leftIconName, in: Bundle(for: type(of: self)), compatibleWith: nil)
            imgView.contentMode = .center
            self.leftView = imgView
            self.leftViewMode = .always
            //layer.sublayerTransform = CATransform3DMakeTranslation(0, 0, 0)
        }
    }
    
    //        private func setRightImage() {
    //
    //            if rightIconType > -1 && rightView == nil {
    //
    //                let imgView = UIImageView(frame: CGRectMake(0, 0, CGFloat(rightImageWidth), self.frame.height))
    //                imgView.tintColor = self.tintColor
    //               // imgView.iconType = rightIconType
    //                imgView.contentMode = .Center
    //                self.rightViewMode = .Always
    //                let lv = UIView(frame: CGRectMake(20, 0, CGFloat(rightImageWidth), self.frame.height))
    //                lv.addSubview(imgView)
    //                self.rightView = lv
    //            }
    //        }
    fileprivate func setRightImageWithName() {
        
        if rightIconName.characters.count > 1 && rightView == nil {
            
            let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: CGFloat(rightImageWidth), height: self.frame.height))
            imgView.tintColor = self.tintColor
            imgView.image = UIImage(named: rightIconName, in: Bundle(for: type(of: self)), compatibleWith: nil)
            imgView.contentMode = .center
            self.rightViewMode = .always
            let lv = UIView(frame: CGRect(x: 20, y: 0, width: CGFloat(rightImageWidth), height: self.frame.height))
            lv.addSubview(imgView)
            self.rightView = lv
        }
    }
    
    var errorMessage: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLeftImage()
        self.textColor = lineColor
        
        
    }
    
    override func draw(_ rect: CGRect)
    {
        //            let height = self.bounds.height
        //
        //            // get the current drawing context
        //            let context = UIGraphicsGetCurrentContext()
        //
        //            // set the line color and width
        //            if errorEntry {
        //                CGContextSetStrokeColorWithColor(context, errorColor.CGColor)
        //                CGContextSetLineWidth(context, 1.5)
        //            } else {
        //                CGContextSetStrokeColorWithColor(context, lineColor.CGColor)
        //                CGContextSetLineWidth(context, 0.5)
        //            }
        //
        //            // start a new Path
        //            CGContextBeginPath(context)
        //
        //            CGContextMoveToPoint(context!, self.bounds.origin.x, height - 0.5)
        //            CGContextAddLineToPoint(context!, self.bounds.size.width, height - 0.5)
        //            // close and stroke (draw) it
        //            CGContextClosePath(context)
        //            CGContextStrokePath(context)
        //
        //Setting custom placeholder color
        if let strPlaceHolder: String = self.placeholder
        {
            self.attributedPlaceholder = NSAttributedString(string:strPlaceHolder,
                                                            attributes:[NSForegroundColorAttributeName:placeHolerColor])
        }
    }
    
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect
    {
        
        var boundWidth: CGFloat = 0
        if let view = leftView {
            boundWidth = view.bounds.size.width
        }
        
        return CGRect(x: 0, y: 0, width: boundWidth, height: self.frame.height)
    }
    
    //        override func rightViewRectForBounds(bounds: CGRect) -> CGRect {
    //
    //            return CGRectMake(self.frame.width-CGFloat(rightImageWidth), 0, CGFloat(rightImageWidth), self.frame.height)
    //        }
    
    //==========================================================================================================
    // MARK: - Validations
    //==========================================================================================================
    
    fileprivate let USERNAME_REGEX  = "^(?=.*[a-zA-Z0-9._])(?=^.{3,50}).+$"
    fileprivate let PASSWORD_REGEX  = "^(?=.*[A-Z])(?=.*\\d)(?=^.{6}).+$"
    
    @IBInspectable var required:Bool = false
    @IBInspectable var requiredUsernameValidation:Bool = false {
        didSet {required = requiredUsernameValidation}
    }
    
    @IBInspectable var requiredPasswordValidation:Bool = false {
        didSet {required = requiredPasswordValidation}
    }
    
    func isValid() -> Bool {
        
        if (self.required == true && self.text?.isEmpty == true) {
            return false
        }
        
        if (self.requiredUsernameValidation == true) {
            let predicate = NSPredicate(format: "SELF MATCHES %@", USERNAME_REGEX)
            return predicate.evaluate(with: self.text)
        }
        
        if (self.requiredPasswordValidation == true) {
            let predicate = NSPredicate(format: "SELF MATCHES %@", PASSWORD_REGEX)
            return predicate.evaluate(with: self.text)
        }
        
        if (self.keyboardType == .emailAddress) {
            return isValidEmail(testStr: self.text!)
        }
        
        if (self.keyboardType == .phonePad) {
            return isPhoneNumberValid(self.text!)
        }
        
        
        return true
        
    }
    
    fileprivate func isPhoneNumberValid(_ phoneNumber: String) -> Bool {
        
        let inputRange = NSMakeRange(0, phoneNumber.characters.count);
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
        let matches = detector?.matches(in: phoneNumber, options: .reportCompletion, range: inputRange)
        
        if matches?.count > 0 {
            let result = matches?.first
            if result?.resultType == .phoneNumber && result?.range.location == inputRange.location && result?.range.length == inputRange.length {
                return true
            }
        }
        
        return false
    }
    
}
