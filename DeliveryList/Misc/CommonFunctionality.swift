//
//  CommonFunctionality.swift
//  DeliveryList
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

class CommonFunctionality {
    
    static func presentAlert(viewController:UIViewController, title:String, message:String, callbackOnAffirmation: (() -> Void)? = nil, callbackOnNegation: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler:
            { alertViewAction in
                guard callbackOnAffirmation != nil else { return }
                callbackOnAffirmation?()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { alertViewAction in
            guard callbackOnNegation != nil else { return }
            callbackOnNegation?()
        }))
        
        viewController.present(alert, animated: true)
    }
    
    static func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}

