//
//  UIViewController+Additions.swift
//  Lango
//
//  Created by Asif Bilal on 01/08/2016.
//  Copyright © 2016 Asif Bilal. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: Specific Methods
    
//    @IBAction func showMenu() {
//        
//        hideKeyboard()
//        
//        guard let slideMenuController = slideMenuController() else { return}
//        slideMenuController.openLeft()
//    }
    
    func presentViewController(viewControllerToPresent: UIViewController) {
        self.present(viewControllerToPresent, animated: true)
    }
    
    func presentViewController(viewControllerToPresent: UIViewController, animated flag: Bool) {
        self.present(viewControllerToPresent, animated: flag) { () -> Void in
         //   QL2("\(String(type(of: viewControllerToPresent))) is presented.")
        }
    }
    
    func dismissViewController(completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
    
    func dismissMe() {
        if let navigationViewController = self.navigationController {
            
            if (navigationViewController.viewControllers.count > 1) {
                dismissPushedController()
            } else {
                dismissPresentedController()
            }
            
        } else {
            dismissPresentedController()
        }
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }
    
    func addCancelButton() {
        
        let cancelButton = UIBarButtonItem(image: UIImage(named: "BackArrow"), style: .plain, target: self, action: #selector(dismissMe))
        navigationItem.leftBarButtonItem = cancelButton
        
    }
    
    class func topViewController(base: UIViewController? = UIApplication.shared.windows.first!.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
    
    private func dismissPresentedController() {
        self.dismiss(animated: true, completion: { () -> Void in
         //   QL2("\(String(type(of: self))) is dismiss.")
        })
    }
    
    private func dismissPushedController() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
