//
//  UITableViewExtentions.swift
//  Stock-Yard
//
//  Created by Bilawal Liaqat on 11/9/17.
//  Copyright © 2017 vteram. All rights reserved.
//

import UIKit

public extension UITableView {
    
    /**
     This method returns the indexPath of the cell that contains the specified view
     
     - Parameter view: The view to find.
     
     - Returns: The indexPath of the cell containing the view, or nil if it can't be found
     
     */
    
    func indexPathForView(_ view: UIView) -> IndexPath? {
        let origin = view.bounds.origin
        let viewOrigin = self.convert(origin, from: view)
        let indexPath = self.indexPathForRow(at: viewOrigin)
        return indexPath
    }
}
