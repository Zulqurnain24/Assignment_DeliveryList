//
//  DeliveryListDeliveryDetailViewTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 03/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryListDeliveryDetailViewTest: XCTestCase {
    
    var sut: DeliveryDetailView!
    
    override func setUp() {
        super.setUp()
        
        sut = DeliveryDetailView()
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
    func testSetConstraints() {
        sut.setConstraints()
        XCTAssertNotNil(sut)
    }
    
    func testViewNotNil() {
        XCTAssertNotNil(sut)
        XCTAssertNotNil(sut.map)
    }
    
    func testDescriptionLabelText() {
        sut.descriptionLabel.text = "Test Description"
        XCTAssertEqual(
            sut.descriptionLabel.text, "Test Description")
    }
    
    func testDistanceSpan() {
        XCTAssertEqual(
            sut.distanceSpan, 500)
    }
    
    func testImageView() {
       sut.imageView.image = UIImage(named: "placeHolder")
        XCTAssertEqual(UIImage(named: "placeHolder")?.jpegData(compressionQuality: 1.0), sut.imageView.image?.jpegData(compressionQuality: 1.0))
    }
    
    func testRegionRadius() {
        XCTAssertEqual(sut.regionRadius, 500.0)
    }
   
}
