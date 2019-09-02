//
//  PersistentStoreTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryList_PersistentStoreTest: XCTestCase {
    
    var sut: PersistentStore!
    
    override func setUp() {
        super.setUp()
        
        sut = PersistentStore()
    }
    
    override func tearDown() {

        sut = nil
        
        super.tearDown()
    }

    func testIsListNil() {
        PersistentStore.shared.clearData(StringConstants.deliveriesKey.rawValue)
        let deliveries = PersistentStore.shared.getObject(StringConstants.deliveriesKey.rawValue, Array<Delivery>.self) as [Delivery]?
         XCTAssertNil(deliveries)
    }
    
    func testIsListSaved() {
        PersistentStore.shared.setObject(key: StringConstants.deliveriesKey.rawValue, value: [Delivery(id: 0, description: "Test Description", imageUrl: "placeHolder", location: Location(lat: 22.336093, lng: 114.155288, address: "Cheung Sha Wan"))])
        let deliveries = PersistentStore.shared.getObject(StringConstants.deliveriesKey.rawValue, Array<Delivery>.self) as [Delivery]?
        XCTAssertNotNil(deliveries)
    }
    
    func testIsListRetrieved() {
        PersistentStore.shared.setObject(key: StringConstants.deliveriesKey.rawValue, value: [Delivery(id: 0, description: "Test Description", imageUrl: "placeHolder", location: Location(lat: 22.336093, lng: 114.155288, address: "Cheung Sha Wan"))])
        let deliveries = PersistentStore.shared.getObject(StringConstants.deliveriesKey.rawValue, Array<Delivery>.self) as [Delivery]?
        XCTAssertEqual(Delivery(id: 0, description: "Test Description", imageUrl: "placeHolder", location: Location(lat: 22.336093, lng: 114.155288, address: "Cheung Sha Wan")), deliveries!.first!)
    }

}
