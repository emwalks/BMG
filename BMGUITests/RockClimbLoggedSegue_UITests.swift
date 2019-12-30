//
//  RockClimbLoggedSegue_UITests.swift
//  BMGUITests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 20/12/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class RockClimbLoggedSegue_UITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
       
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenARandomRouteNameIsEnteredItIsPassedViaSenderInSegueToNextViewController() {
        let routeNameEntered:String = "randomRouteName" + String(describing: Int.random(in: 500..<600))
        
        let elementsQuery = app.scrollViews.otherElements
        let textField = elementsQuery.textFields["e.g. The Bat"]
        textField.tap()
        textField.typeText(routeNameEntered)
        
        let routeQuery = app.scrollViews.otherElements
        routeQuery.staticTexts["Route:"].tap()
        routeQuery.buttons["Submit"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "rockClimbDataPresented").label, " Route Name: \(routeNameEntered)")
        
        
    }

    
    
}
