//
//  DeliveryListUIImageView+NetworkingTests.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryListUIImageView_NetworkingTest: XCTestCase {
    
    var sut: UIImageView!
    
    override func setUp() {
        super.setUp()
        
        sut = UIImageView()
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
    func testDownloadImage() {
         let expectation = self.expectation(description: "downloadedImage")
        sut.imageFromServerURL(urlString: "https://s3-ap-southeast-1.amazonaws.com/lalamove-mock-api/images/pet-2.jpeg", completionHandler: {
            XCTAssertNotNil(self.sut.image)
            XCTAssertEqual(UIImage(named: "catImage.jpeg")?.size, self.sut.image?.size)
             XCTAssertEqual(UIImage(named: "catImage.jpeg")?.jpegData(compressionQuality: 1.0), self.sut.image?.jpegData(compressionQuality: 1.0))
            expectation.fulfill()
        })
        
        self.waitForExpectations(timeout: 5, handler: nil)
        
    }
}
