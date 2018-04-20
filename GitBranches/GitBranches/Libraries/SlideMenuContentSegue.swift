//
//  SlideMenuContentSegue.swift
//  Stock-Yard
//
//  Created by Bilawal Liaqat on 4/6/17.
//  Copyright © 2017 vteram. All rights reserved.
//

import UIKit

class SlideMenuContentSegue: UIStoryboardSegue {

    override func perform() {
        
        let sourceVC = source as! LeftMenuVC
        let destinationVC = destination
        
        let sliderVC = sourceVC.parent as! MenuParentClass
        sliderVC.changeMainViewController(destinationVC, close: true)
        
        
    }
    
}
