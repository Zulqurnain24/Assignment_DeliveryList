//
//  DeliveryListColorTest.swift
//  DeliveryListTests
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import XCTest
@testable import DeliveryList

class DeliveryListColorsTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testColors() {
       Colors.changeDefaults()
       XCTAssertNotNil(Colors.self)
       XCTAssertEqual(Colors.clear, UIColor.clear)
       XCTAssertEqual(Colors.reddish, UIColor(red: 209/255, green: 102/255, blue: 102/255, alpha: 1.0))
       XCTAssertEqual(Colors.greenish, UIColor(red: 182/255, green: 198/255, blue: 73/255, alpha: 1.0))
       XCTAssertEqual(Colors.lightGray, UIColor(red: 193/255, green: 193/255, blue: 193/255, alpha: 1.0))
       XCTAssertEqual(Colors.white, UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0))
       XCTAssertEqual(Colors.blackish, UIColor(red: 0, green: 0, blue: 0, alpha: 1.0))
    }
}
