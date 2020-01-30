//
//  RockClimbLoggedSegue_UITests.swift
//  BMGUITests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 20/12/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class RockClimbLoggedViewModel_UITests: XCTestCase {
    
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
        
        app.otherElements.buttons["Log Rock Climb"].tap()
        
        let routeField = app.scrollViews.otherElements.textFields["e.g. The Bat"]
        routeField.tap()
        routeField.typeText(routeNameEntered)
        
        let exitRouteFieldKeyboard = app.scrollViews.otherElements
        exitRouteFieldKeyboard.staticTexts["Route:"].tap()
        
        app.scrollViews.otherElements.buttons["Submit"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "routeNamePresented").label, " Route Name: \(routeNameEntered)")
        
    }
    
    func testWhenAGradeIsEnteredItIsPassedViaSenderInSegueToNextViewController() {
        let gradeSelected = "VDiff 7b"
        
        app.otherElements.buttons["Log Rock Climb"].tap()

        
        let gradeField = app.scrollViews.otherElements.textFields["E1 5b, E1 5c, etc."]
        gradeField.tap()
        app.pickerWheels["Mod"].adjust(toPickerWheelValue: "VDiff")
        app.pickers.children(matching: .pickerWheel).element(boundBy: 1).adjust(toPickerWheelValue: "7b")
        app.toolbars["Toolbar"].buttons["Done"].tap()
        
        app.scrollViews.otherElements.buttons["Submit"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "gradePresented").label, " Grade: \(gradeSelected)")
        
    }
    
    func testWhenARandomVenueNameIsEnteredItIsPassedViaSenderInSegueToNextViewController() {
        let venueNameEntered:String = "randomVenueName" + String(describing: Int.random(in: 500..<600))
        
        app.otherElements.buttons["Log Rock Climb"].tap()
        let venueField =  app.scrollViews.otherElements.textFields["e.g. Ben Nevis"]
        venueField.tap()
        venueField.typeText(venueNameEntered)
        
        let exitRouteFieldKeyboard = app.scrollViews.otherElements
        exitRouteFieldKeyboard.staticTexts["Route:"].tap()
        
        app.scrollViews.otherElements.buttons["Submit"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "venueNamePresented").label, " Venue: \(venueNameEntered)")
    }
    
    func testWhenDateIsEnteredItIsPassedViaSenderInSegueToNextViewController() {
        let dateSelected = "31/01/2020"
        
        
        app.otherElements.buttons["Log Rock Climb"].tap()
        
        let dateField = app.scrollViews.otherElements.textFields["DD/MM/YYYY"]
        dateField.tap()
        
        app.pickers.children(matching: .pickerWheel).element(boundBy: 0).adjust(toPickerWheelValue: "January")
        app.pickers.children(matching: .pickerWheel).element(boundBy: 1).adjust(toPickerWheelValue: "31")
        app.pickers.children(matching: .pickerWheel).element(boundBy: 2).adjust(toPickerWheelValue: "2020")
        app.toolbars["Toolbar"].buttons["Done"].tap()
        
        app.scrollViews.otherElements.buttons["Submit"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "datePresented").label, " Date: \(dateSelected)")
        
    }
    
    func testWhenARandomPartnersIsEnteredItIsPassedViaSenderInSegueToNextViewController() {
        let partnersEntered:String = "randomPartner" + String(describing: Int.random(in: 500..<600))
        
        app.otherElements.buttons["Log Rock Climb"].tap()
        let partnersField = app.scrollViews.otherElements.containing(.staticText, identifier:"Route:").children(matching: .textField).element(boundBy: 4)
        partnersField.tap()
        partnersField.typeText(partnersEntered)
        
        let exitRouteFieldKeyboard = app.scrollViews.otherElements
        exitRouteFieldKeyboard.staticTexts["Route:"].tap()
        
        app.scrollViews.otherElements.buttons["Submit"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "partnersPresented").label, " Partners: \(partnersEntered)")
    }
    
    func testWhenAClimbingStyleIsEnteredItIsPassedViaSenderInSegueToNextViewController() {
        let climbingStyleSelected:String = "Alternate"
        
        app.otherElements.buttons["Log Rock Climb"].tap()
        
        app.scrollViews.otherElements.tables.staticTexts[climbingStyleSelected].tap()
        
        app.scrollViews.otherElements.buttons["Submit"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "climbingStylePresented").label, " Style: \(climbingStyleSelected)")
    }
    
}
