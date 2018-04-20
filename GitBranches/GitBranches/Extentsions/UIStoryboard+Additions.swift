//
//  UIStoryboard+Additions.swift
//  Lango
//
//  Created by Bilawal Liaqat on 5/4/17.
//  Copyright © 2017 vteram. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    // MARK: Specific Methods
    
    class func storyboardLoan() -> UIStoryboard {
        return self.storyboard(loadWithName: "Loan")
    }
    class func storyboardMyStockYard() -> UIStoryboard {
        return self.storyboard(loadWithName: "MyStockYard")
    }
    
    class func storyboardMenu() -> UIStoryboard {
        return self.storyboard(loadWithName: "Menu")
    }
    
    class func storyboardRegister() -> UIStoryboard {
        return self.storyboard(loadWithName: "Register")
    }
    
    class func storyboardHome() -> UIStoryboard {
        return self.storyboard(loadWithName: "Home")
    }
    
    class func storyboardBuyCattle() -> UIStoryboard {
        return self.storyboard(loadWithName: "BuyCattle")
    }
    class func storyboardSellCattle() -> UIStoryboard {
        return self.storyboard(loadWithName: "SellCattle")
    }
    
    class func storyboardPayments() -> UIStoryboard {
        return self.storyboard(loadWithName: "Payments")
    }
    
    
    // MARK: Generic Methods
    
    func loadViewController(identifier:ViewControllers) -> UIViewController {
        return self.instantiateViewController(withIdentifier: identifier.rawValue)
    }
    
    /**
     * Generic method to load storyboard
     */
    private static func storyboard(loadWithName name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: Bundle.main)
    }
    
}
