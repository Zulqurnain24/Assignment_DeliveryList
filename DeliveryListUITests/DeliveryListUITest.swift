//
//  DeliveryListUITest.swift
//  DeliveryListUITests
//
//  Created by Mohammad Zulqarnain on 03/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest

class DeliveryListUITest: XCTestCase {

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false

        XCUIApplication().launch()

    }

    override func tearDown() {
        XCUIApplication().terminate()
         super.tearDown()
    }

    func testBrowseList() {
        
        let tablesQuery = XCUIApplication().tables

        let table = tablesQuery.firstMatch
        table.swipeUp()
        table.swipeDown()
    }
    
    func testPressRefreshListBarButton() {
        XCUIApplication().navigationBars["All Deliveries"].children(matching: .button).element.tap()
    }
    
    func testTapOnCell() {
        let table = XCUIApplication().tables.firstMatch
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: table, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        let cell = table.cells.firstMatch
        cell.tap()
    }
    
    func testMapInteraction() {
        let table = XCUIApplication().tables.firstMatch
        var exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: table, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        let cell = table.cells.firstMatch
        exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: cell, handler: nil)
        waitForExpectations(timeout: 15, handler: nil)
        cell.tap()
        let map = XCUIApplication().maps.firstMatch
        map.tap()
        map.tap()
        map.tap()
        map.tap()
    }
}
