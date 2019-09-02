//
//  DeliveryListEnumsTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryListEnumsTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEnums() {
     
        //IntConstants Enum Test
      XCTAssertEqual(IntConstants.deliveriesOffset.rawValue, 0)
        
      //StringConstants Enum
      XCTAssertEqual(StringConstants.internetErrorTitleText.rawValue, "Error")
      XCTAssertEqual(StringConstants.deliveryBrowseVCTitle.rawValue, "Delivery List")
      XCTAssertEqual(StringConstants.internetErrorMessageText.rawValue, "Please connect to internet.")
      XCTAssertEqual(StringConstants.serviceUnavailable.rawValue, "It seems service is unavailable temporarily. Please try again later")
      XCTAssertEqual(StringConstants.deliveriesKey.rawValue, "deliveries")
      XCTAssertEqual(StringConstants.persistentStoreData.rawValue, "Internet is unavailable for now the data is restored from persistent store. Please restore internet connection for the latest data")

    }
}
