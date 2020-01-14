//
//  RockClimbLandingPage_UITests.swift
//  BMGUITests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class RockClimbHomePageViewModel_UITests: XCTestCase {
    
    
    var app: XCUIApplication!
    
    override func setUp() {
        
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
    }
    
    func testThatTheRockClimbHomePageExists(){
                
        XCTAssertTrue(app.isDisplayingRockClimbHomePage, "RockClimbHomePage exists")
    }
    
    func testWhenLogRockClimbIsSelectedThatUserIsTakenToLogRockClimbView() {
        XCUIApplication().otherElements.buttons["Log Rock Climb"].tap()
        
        XCTAssertTrue(app.isDisplayingLogRockClimbPage, "logRockClimbView is being displayed")
    }
    
    func testWhenViewLogbookIsSelectedThatUserIsTakenToLogRockClimbView() {
          XCUIApplication().otherElements.buttons["View Logbook"].tap()
          
          XCTAssertTrue(app.isDisplayingLogbookPage, "logbookView is being displayed")
      }
    
}

extension XCUIApplication {
    var isDisplayingRockClimbHomePage: Bool {
        return otherElements["rockClimbHomePage"].exists
    }
    
    var isDisplayingLogRockClimbPage: Bool {
        return otherElements["logRockClimbView"].exists
    }
    
    var isDisplayingLogbookPage: Bool {
        return otherElements["logbookView"].exists
    }
    
}

