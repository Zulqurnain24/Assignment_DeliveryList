//
//  Delivery.swift
//  DeliveryList
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

/* DeliveriesList
 This class is used to house Delivery objects in order to display them in the tableview
 */
struct DeliveriesList: Codable {
    var deliveries: [Delivery]
    init() {
        deliveries = []
    }
}
