//
//  DeliveryCell.swift
//  DeliveryList
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

protocol DeliveryCellProtocol {
    func configure( description: String, uRLString:String, _ completionHandler: (() -> Void)?)
}

/* DeliveryCell
 This is the UITableViewCell which is used in DeliveryListBrowseView Tableview
 */
class DeliveryCell: UITableViewCell, DeliveryCellProtocol {
    
    internal var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.blackish
        label.font = Fonts.body
        label.enableAutoLayout()
        return label
    } ()
    
    internal static let thumbnailHeightWidth: CGFloat = 70.0
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = Colors.white
        addSubview(descriptionLabel)
        descriptionLabel.leadingAnchor.constraint(equalTo: (self.imageView?.trailingAnchor)!, constant: Padding.standard).activate()
        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).activate()
    }
    
    internal func configure( description: String, uRLString:String, _ completionHandler: (() -> Void)? = nil) {
        self.descriptionLabel.text = description
        self.imageView?.imageFromServerURL(urlString: uRLString, completionHandler: {
            self.imageView?.image = CommonFunctionality.resizeImage(image: self.imageView?.image ?? UIImage(named: "placeHolder")!, newWidth: 40)
            self.imageView?.clipsToBounds = true
            self.imageView?.layer.cornerRadius = 10
            self.imageView?.contentMode = .scaleAspectFit
            self.imageView?.setNeedsDisplay()
            guard completionHandler != nil else {return}
            completionHandler?()
        })
    }
}
