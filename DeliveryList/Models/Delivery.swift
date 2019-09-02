//
//  Delivery.swift
//  DeliveryList
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

/* Delivery
 This entity contains the delivery data
 */
struct Delivery: Codable, Equatable {

    public let  id: Int
    public let  description: String
    public let  imageUrl: String
    public let  location: Location
    
    private enum UserKeys: String, CodingKey {
        case id
        case description
        case imageUrl
        case location
    }
    
    init(id: Int, description: String, imageUrl: String, location: Location) {
        self.id = id
        self.description = description
        self.imageUrl = imageUrl
        self.location = location
    }
    
    static func == (lhs: Delivery, rhs: Delivery) -> Bool {
        return lhs.description == rhs.description &&
               lhs.id == rhs.id &&
               lhs.imageUrl == rhs.imageUrl &&
               lhs.location == rhs.location
    }
    
}

