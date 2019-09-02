//
//  DeliveryListDeliveryCellTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 03/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryListDeliveryCellTest: XCTestCase {
    
    var sut: DeliveryCell!
    
    override func setUp() {
        super.setUp()
        
        sut = DeliveryCell()
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
    func testViewNotNil() {
        sut.configure(description: "test description", uRLString: "placeHolder")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.descriptionLabel.text, "test description")
        XCTAssertEqual(sut.imageView?.image?.jpegData(compressionQuality: 1.0), UIImage(named: "placeHolder")?.jpegData(compressionQuality: 1.0))
    }


}
