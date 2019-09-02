//
//  WebserviceManagerTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryList_WebserviceManagerTest: XCTestCase {
    
    var sut: WebserviceManager!
    
    override func setUp() {
        super.setUp()
        
        sut = WebserviceManager()
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
    func testIsListNotNil() {
        XCTAssertNotNil(sut)
    }

    func testFetchServiceList() {
        let expectation = self.expectation(description: "Deliveries")
        var deliveryListFromWebservice: [Delivery]!
        sut.getDeliveriesList(offset: 0, limit: 70,{ results in
            switch results {
            case .Success(let value):
                XCTAssertNotNil(value)
                deliveryListFromWebservice = value
                expectation.fulfill()
                break
            case .Failure(_):
                deliveryListFromWebservice = []
                expectation.fulfill()
                break
                
        }})
        
        self.waitForExpectations(timeout: 10, handler: nil)
        
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "delivery", withExtension: "json") else {
            XCTFail("Missing file: Delivery.json")
            return
        }
        let data = try! Data(contentsOf: url)
        let deliveryListFromJSONFile = try! JSONDecoder().decode([Delivery].self, from: data)
        XCTAssertEqual(deliveryListFromJSONFile.count, deliveryListFromWebservice.count)
    }
}
