//
//  DeliveryBrowseVCTests.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryBrowseVCTest: XCTestCase {
    
    var sut: DeliveryBrowseVC!
    
    override func setUp() {
        super.setUp()
        
        sut = DeliveryBrowseVC()
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
    func testViewDidLoad() {
        
        sut.viewDidLoad()
        XCTAssertNotNil(sut)
    }
    
    func testViewWillAppear() {
        
        sut.viewWillAppear(true)
        XCTAssertNotNil(sut)
    }
    
    func testSetupView() {
        
        sut.setupView()
        XCTAssertNotNil(sut)
      XCTAssertNotNil(sut.navigationItem.rightBarButtonItem)
    }
    
    func testLoadView() {
    
        sut.loadView()
        XCTAssertEqual(sut.title, "All Deliveries")
    }
    
    func testStopActivityIndicator() {
        
        sut.stopActivityIndicator()
        XCTAssertNotNil(sut.getActivityIndicator())
    }
    
    func testFetchDeliveryData() {
        
        sut.fetchDeliveryData()
        XCTAssertNotNil(sut)
        XCTAssertEqual(DeliveryBrowseVC.deliveriesLimit, 20)
        XCTAssertEqual(sut.getDeliveryList().count, 0)
    }
    
    func testPullDataFromPersistentStore() {
        sut.pullDataFromPersistentStore()
        let deliveries = PersistentStore.shared.getObject(StringConstants.deliveriesKey.rawValue, Array<Delivery>.self) as [Delivery]?
        XCTAssertTrue(deliveries!.count > 0)
    }
    
    func testUpdateTableView() {
        sut.updateTableView()
        XCTAssertNotNil(sut.getTableView())
    }
    
    func testCallWebService() {
        sut.callWebService(offset: 0, limit: 20)
        XCTAssertNotNil(sut.getDeliveryList())
    }
}
