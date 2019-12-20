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

        let routeElement = app.scrollViews.otherElements.containing(.staticText, identifier:"Route:").element
        routeElement.tap()
        routeElement.swipeUp()
        elementsQuery.buttons["Submit"].tap()
        
        let actualResult = app/*@START_MENU_TOKEN@*/.scrollViews/*[[".otherElements[\"rockClimbLoggedView\"].scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements.staticTexts[" Route Name: \(routeNameEntered)"]
        
        XCTAssertEqual(app/*@START_MENU_TOKEN@*/.scrollViews/*[[".otherElements[\"rockClimbLoggedView\"].scrollViews",".scrollViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.otherElements.staticTexts[" Route Name: \(routeNameEntered)"] , actualResult )
        
    }

    
    
}
