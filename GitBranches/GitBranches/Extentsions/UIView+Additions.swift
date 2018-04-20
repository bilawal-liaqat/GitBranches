//
//  UIView+Additions.swift
//  SayHello
//
//  Created by Bilawal Liaqat on 09/08/2016.
//  Copyright © 2016 Vteams. All rights reserved.
//

import UIKit

extension UIView {
    
    func addBorder(color:UIColor , size:CGFloat , radius : CGFloat)  {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius;
        self.layer.borderWidth = size
        self.layer.borderColor = color.cgColor
    }
    
    
    
    class func viewFromNibClassName(nibClassName:UIView.Type) -> UIView? {
        return viewFromNibName(nibClassName: nibClassName, bundle: Bundle(for: nibClassName))
    }
    
    class func viewFromNibName(nibClassName:UIView.Type, bundle:Bundle = Bundle.main) -> UIView? {
        let views = viewsFromNibName(nibClassName: nibClassName)
        return views?.first
    }
    
    class func viewsFromNibName(nibClassName:UIView.Type, bundle:Bundle = Bundle.main) -> [UIView]? {
        return bundle.loadNibNamed(className(name: nibClassName), owner: nil, options: nil) as? [UIView]
    }
    
    // MARK: - Easy Frames
    
    func setFrameWidth(width:CGFloat) {
        //CGRect(x: self.frame, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        self.frame = CGRect(x : self.frame.origin.x, y : self.frame.origin.y, width : width, height : self.frame.size.height)
    }
    
    func setFrameHeight(height:CGFloat) {
        self.frame = CGRect(x: self.frame.origin.x, y : self.frame.origin.y, width : self.frame.size.width, height : height)
    }
    
    func setFrameX(x:CGFloat) {
        self.frame = CGRect(x : x, y : self.frame.origin.y, width : self.frame.size.width, height : self.frame.size.height)
    }
    
    func setFrameY(y:CGFloat) {
        self.frame = CGRect(x : self.frame.origin.x, y :  y, width : self.frame.size.width, height : self.frame.size.height)
    }
    
    func frameWidth() -> CGFloat {
        return self.frame.size.width;
    }
    
    func frameHeight() -> CGFloat {
        return self.frame.size.height;
    }
    
    func frameX() -> CGFloat {
        return self.frame.origin.x;
    }
    
    func frameY() -> CGFloat {
        return self.frame.origin.y;
    }
    
    // MARK: - Cornar Radius
    
    func setCornarRadius(cornarRadius:CGFloat, cornars:UIRectCorner, strokeColor:UIColor?) {
        
        
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: cornars, cornerRadii: CGSize(width: cornarRadius, height: cornarRadius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        if (strokeColor != nil) { maskLayer.strokeColor = strokeColor?.cgColor}
        maskLayer.path = maskPath.cgPath
        
        // Set the newly created shape layer as the mask for the image view's layer
        layer.mask = maskLayer
        
    }
    
    // MARK: - Utility
    
    func removeAllSubviews() {
        self.subviews.forEach{ $0.removeFromSuperview() }
    }
    
}

@IBDesignable class RoundRectView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = UIColor.black
    @IBInspectable var borderWidth: CGFloat = 0.5
    private var customBackgroundColor = UIColor.white
    override var backgroundColor: UIColor?{
        didSet {
            customBackgroundColor = backgroundColor!
            super.backgroundColor = UIColor.clear
        }
    }
    
    func setup() {
        layer.shadowColor = UIColor.black.cgColor;
        layer.shadowOffset = CGSize.zero;
        layer.shadowRadius = 5.0;
        layer.shadowOpacity = 0.5;
        super.backgroundColor = UIColor.clear
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override func draw(_ rect: CGRect) {
        customBackgroundColor.setFill()
        UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius ).fill()
        
        let borderRect = bounds.insetBy(dx: borderWidth/2, dy: borderWidth/2)
        let borderPath = UIBezierPath(roundedRect: borderRect, cornerRadius: cornerRadius - borderWidth/2)
        borderColor.setStroke()
        borderPath.lineWidth = borderWidth
        borderPath.stroke()
        
        // whatever else you need drawn
    }
}
