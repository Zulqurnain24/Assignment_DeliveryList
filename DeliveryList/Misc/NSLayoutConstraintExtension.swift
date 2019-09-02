//
//  NSLayoutConstraintExtension.swift
//  DeliveryList
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

/* NSLayoutConstraint
 This extension contains method for activating the NSLayoutConstraints
 */
extension NSLayoutConstraint {
    @discardableResult func activate() -> NSLayoutConstraint {
        isActive = true
        return self
    }
}

