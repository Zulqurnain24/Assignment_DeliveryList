//
//  Location.swift
//  DeliveryList
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import Foundation

/* Location
 This entity contains the location data for displaying annotation on the map
 */
struct Location: Codable, Equatable {
    public let  lat: Double
    public let  lng: Double
    public let  address: String
    
    private enum UserKeys: String, CodingKey {
        case lat
        case lng
        case address
    }
    
    init(lat: Double, lng: Double, address: String) {
        self.lat = lat
        self.lng = lng
        self.address = address
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        return  lhs.lat == rhs.lat &&
                lhs.lng == rhs.lng &&
                lhs.address == rhs.address
    }
}
