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
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "routeNamePresented").label, " Route Name: \(routeNameEntered)")
        
    }
    
    func testWhenAGradeIsEnteredItIsPassedViaSenderInSegueToNextViewController() {
        let gradeSelected = "M 7b"
        let app = XCUIApplication()
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.textFields["E1 5b, E1 5c, etc."].tap()
        app/*@START_MENU_TOKEN@*/.pickerWheels["M"].swipeRight()/*[[".pickers.pickerWheels[\"M\"]",".swipeUp()",".swipeRight()",".pickerWheels[\"M\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        app.pickers.children(matching: .pickerWheel).element(boundBy: 1).swipeUp()
        app.toolbars["Toolbar"].buttons["Done"].tap()
        elementsQuery.buttons["Submit"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "gradePresented").label, " Grade: \(gradeSelected)")
        
    }

    func testWhenARandomVenueNameIsEnteredItIsPassedViaSenderInSegueToNextViewController() {
        let venueNameEntered:String = "randomVenueName" + String(describing: Int.random(in: 500..<600))
        
        let elementsQuery = app.scrollViews.otherElements
        let textField = elementsQuery.textFields["e.g. Ben Nevis"]
        textField.tap()
        textField.typeText(venueNameEntered)
        
        let routeQuery = app.scrollViews.otherElements
        routeQuery.staticTexts["Route:"].tap()
        routeQuery.buttons["Submit"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "venueNamePresented").label, " Venue: \(venueNameEntered)")
        
    }
    
}
