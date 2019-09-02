//
//  DeliveryListDeliveryListBrowseViewTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 03/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryListDeliveryListBrowseViewTest: XCTestCase {
    
    var sut: DeliveryListBrowseView!
    
    override func setUp() {
        super.setUp()
        
        sut = DeliveryListBrowseView()
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
    func testViewNotNil() {

        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.activityView)
    }

    func testSetupActivityIndicator() {
       sut.setupActivityIndicator()
       XCTAssertEqual(sut.activityView.center, sut.center)
       XCTAssertEqual(sut.activityView.isAnimating, true)
    }
    
}
