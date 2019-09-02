//
//  DeliveryDetailVCTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryDetailVCTest: XCTestCase {
    
    var sut: DeliveryDetailVC!
    
    override func setUp() {
        super.setUp()
        
        sut = DeliveryDetailVC()
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
    func testViewDidLoad() {
        
        sut.viewDidLoad()
        XCTAssertNotNil(sut)
    }
    
    func testLoadView() {

        sut.loadView()
        XCTAssertNotNil(sut.view)
    }
}
