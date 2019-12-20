//
//  LogARockClimbViewModelUITests.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 27/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class LogARockClimbViewModelUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        
    }
    
    override func tearDown() {
    }
    
    
    func testNavigateToTheRockClimbLoggedScreen() {
        
        XCUIApplication().scrollViews.otherElements.buttons["Submit"].tap()
        sleep(4)
        
        XCTAssertTrue(app.isDisplayingRockClimbLoggedView, "rockClimbLoggedView is being displayed")
    }
    
}

extension XCUIApplication {
    var isDisplayingRockClimbLoggedView: Bool {
        return otherElements["rockClimbLoggedView"].exists
    }
}

