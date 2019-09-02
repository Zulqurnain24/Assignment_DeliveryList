//
//  Enums.swift
//  DeliveryList
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

//IntConstants Enum
enum IntConstants: Int {
    typealias RawValue = Int
    case deliveriesOffset = 0
}

//StringConstants Enum
enum StringConstants: String {
    typealias RawValue = String
    case internetErrorTitleText = "Error"
    case deliveryBrowseVCTitle = "Delivery List"
    case internetErrorMessageText = "Please connect to internet."
    case serviceUnavailable = "It seems service is unavailable temporarily. Please try again later"
    case deliveriesKey = "deliveries"
    case persistentStoreData = "Internet is unavailable for now the data is restored from persistent store. Please restore internet connection for the latest data"
}
