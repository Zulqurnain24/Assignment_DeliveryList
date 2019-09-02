//
//  Colors.swift
//  DeliveryList
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

/* Colors
 This class contains our color pallette
 */
public struct Colors {
    static let white = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    static let lightGray = UIColor(red: 193/255, green: 193/255, blue: 193/255, alpha: 1.0)
    static let blackish = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
    static let reddish = UIColor(red: 209/255, green: 102/255, blue: 102/255, alpha: 1.0)
    static let greenish = UIColor(red: 182/255, green: 198/255, blue: 73/255, alpha: 1.0)
    static let clear = UIColor.clear
    
    public static func changeDefaults() {
        UINavigationBar.appearance().tintColor = reddish
        UINavigationBar.appearance().backItem?.backBarButtonItem?.tintColor = reddish
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: blackish, NSAttributedString.Key.font: Fonts.heading]
        _ = [.normal, .selected].map {
            UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.clear , NSAttributedString.Key.font: Fonts.button], for: $0)
        }
    }
}

