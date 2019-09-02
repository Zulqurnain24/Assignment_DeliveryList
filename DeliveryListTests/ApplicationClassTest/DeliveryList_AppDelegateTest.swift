//
//  DeliveryList_AppDelegateTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryList_AppDelegateTest: XCTestCase {

    
    var sut: AppDelegate!
    
    override func setUp() {
        super.setUp()
        
        sut = AppDelegate()
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
    func testIsNotNil() {
        XCTAssertNotNil(sut)
    }
    
}
