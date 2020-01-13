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
        let gradeSelected = "VD 7b"
        let app = XCUIApplication()
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.textFields["E1 5b, E1 5c, etc."].tap()
        app.pickerWheels["M"].adjust(toPickerWheelValue: "VD")
        app.pickers.children(matching: .pickerWheel).element(boundBy: 1).adjust(toPickerWheelValue: "7b")
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
    
    func testWhenDateIsEnteredItIsPassedViaSenderInSegueToNextViewController() {
        let dateSelected = "31/01/2020"
        
        let app = XCUIApplication()
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.textFields["DD/MM/YYYY"].tap()
        
        app.pickers.children(matching: .pickerWheel).element(boundBy: 0).adjust(toPickerWheelValue: "January")
        app.pickers.children(matching: .pickerWheel).element(boundBy: 1).adjust(toPickerWheelValue: "31")
        app.pickers.children(matching: .pickerWheel).element(boundBy: 2).adjust(toPickerWheelValue: "2020")

        app.toolbars["Toolbar"].buttons["Done"].tap()
        elementsQuery.buttons["Submit"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "datePresented").label, " Date: \(dateSelected)")
        
    }
    
    func testWhenARandomPartnersIsEnteredItIsPassedViaSenderInSegueToNextViewController() {
        let partnersEntered:String = "randomPartner" + String(describing: Int.random(in: 500..<600))
        
        let elementsQuery = app.scrollViews.otherElements
        let textField = elementsQuery.containing(.staticText, identifier:"Route:").children(matching: .textField).element(boundBy: 4)
        textField.tap()
        textField.typeText(partnersEntered)
        
        let routeQuery = app.scrollViews.otherElements
        routeQuery.staticTexts["Route:"].tap()
        routeQuery.buttons["Submit"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "partnersPresented").label, " Partners: \(partnersEntered)")
    }

    func testWhenAClimbingStyleIsEnteredItIsPassedViaSenderInSegueToNextViewController() {
        let climbingStyleSelected:String = "Alternate"
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.tables.staticTexts[climbingStyleSelected].tap()
        elementsQuery.buttons["Submit"].tap()
    
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "climbingStylePresented").label, " Style: \(climbingStyleSelected)")
    }
    
}
