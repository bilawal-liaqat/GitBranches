//
//  ABTextField.swift
//  InsureTrack
//
//  Created by Asif Bilal on 03/12/2015.
//  Copyright © 2015 Asif Bilal. All rights reserved.
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


let USERNAME_REGEX  = "^(?=.*[a-zA-Z0-9._])(?=^.{3,50}).+$"
let PASSWORD_REGEX  = "^(?=.*[A-Z])(?=.*\\d)(?=^.{6}).+$"

@IBDesignable class ABTextField: UITextField , UITextFieldDelegate {
    
    typealias MaxLengthReached = () -> Void
    
    var maxLengthReached: MaxLengthReached?
    var digitOnly: Bool = false

    @IBInspectable var required:Bool = false
    @IBInspectable var requiredUsernameValidation:Bool = false {
        didSet {required = requiredUsernameValidation}
    }
    
    @IBInspectable var requiredPasswordValidation:Bool = false {
        didSet {required = requiredPasswordValidation}
    }
    
    @IBInspectable var cornarRadius:CGFloat = 0.0 {
        didSet {self.layer.cornerRadius = cornarRadius}
    }
    
    @IBInspectable var borderWidth:CGFloat = 1.5 {
        didSet {
            
            //self.layer.borderWidth = borderWidth
            
            let borderHeight : CGFloat = 1.0
            let layer = CALayer()
            layer.borderColor = UIColor.lightGray.cgColor
            layer.borderWidth = borderHeight
            layer.frame = CGRect(x: 0, y: self.frame.size.height-borderHeight, width: self.frame.size.width, height: borderHeight)
            self.layer.addSublayer(layer)

        
        }
    }
    
     @IBInspectable var borderColor:UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var placeholderColor: UIColor? {
        didSet {
            guard let placeholderText = placeholder, let color = placeholderColor else { return}
            attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSForegroundColorAttributeName : color])
        }
    }
    
    @IBInspectable var rightImage:UIImage? {
        didSet {
            self.rightViewMode = .always
            let accessoryImageView = UIImageView(image: rightImage)
            accessoryImageView.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
            accessoryImageView.contentMode = .center
            self.rightView = accessoryImageView
        }
    }
    @IBInspectable var leftImage:UIImage? {
        didSet {
            self.leftViewMode = .always
            let accessoryImageView = UIImageView(image: leftImage)
            accessoryImageView.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
            accessoryImageView.contentMode = .center
            self.leftView = accessoryImageView
        }
    }
    
    @IBInspectable var isDigitOnly:Bool = false
    
    @IBInspectable var bottomShadow:Bool? {
        didSet {
            if bottomShadow == true {
                
                self.layer.shadowColor = AppTheme.whiteColor().cgColor
                self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
                self.layer.shadowOpacity = 1.0
                self.layer.shadowRadius = 0.0;
                self.layer.masksToBounds = false;
                
            }
        }
    }
    
    @IBInspectable var disableBackgroundColor: UIColor = AppTheme.disableGrayColor()  {
        didSet {
            self.backgroundColor = isEnabled ? AppTheme.whiteColor() : disableBackgroundColor
        }
    }
    
    @IBInspectable var maxLength: Int = Int.max {
        didSet {
            addTarget(self, action: #selector(ABTextField.checkMaxLength(_:)), for: .editingChanged)
        }
    }
    
    override internal(set) var isEnabled:Bool {
        didSet {self.backgroundColor = isEnabled ? AppTheme.whiteColor() : disableBackgroundColor}
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.backgroundColor = isEnabled ? AppTheme.whiteColor() : AppTheme.disableGrayColor();
        self.delegate = self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    deinit {
        
    }
    
    // MARK: Public Methods
    
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
    
    func checkMaxLength(_ sender: UITextField) {
        
        guard let newText = sender.text else { return}

        if newText.characters.count > maxLength {
            let cursorPosition = selectedTextRange
            
            let startIndex  = newText.startIndex
            let endIndex    = newText.index(startIndex, offsetBy: maxLength)
            text = newText.substring(with: startIndex..<endIndex)
            selectedTextRange = cursorPosition
        }
        
        if newText.characters.count >= maxLength {
            maxLengthReached?()
        }
        
    }
    
    func textByTrimmingWhiteSpaceCharacters() -> String? {
        return text?.trimmingCharacters(in: CharacterSet.whitespaces)
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        
        if isDigitOnly == true {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
        }
        else {
        return true
        }
    }
    
    
}
