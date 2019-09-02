//
//  FriendCoordinate.swift
//  DeliveryList
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import MapKit

/* DeliveryCoordinate
 This is the class responsible for displaying delivery coordinates
 */
class DeliveryCoordinate: NSObject, MKAnnotation{
    var identifier = "delivery location"
    var title: String?
    var coordinate: CLLocationCoordinate2D
    init(name:String, lat:CLLocationDegrees, long:CLLocationDegrees){
        title = name
        coordinate = CLLocationCoordinate2DMake(lat, long)
    }
}

