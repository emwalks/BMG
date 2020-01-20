//
//  LogbookViewModel_UITests.swift
//  BMGUITests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 20/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class LogbookViewModel_UITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        app.otherElements.buttons["Log Rock Climb"].tap()
        
        let routeNameEntered:String = "randomRouteName" + String(describing: Int.random(in: 500..<600))
        let gradeSelected = "VD 7b"
        let venueNameEntered:String = "randomVenueName" + String(describing: Int.random(in: 500..<600))
        let dateSelected = "31/01/2020"
        let partnersEntered:String = "randomPartner" + String(describing: Int.random(in: 500..<600))
        let climbingStyleSelected:String = "Alternate"
        
        let routeField = app.scrollViews.otherElements.textFields["e.g. The Bat"]
        routeField.tap()
        routeField.typeText(routeNameEntered)
        
        let gradeField = app.scrollViews.otherElements.textFields["E1 5b, E1 5c, etc."]
        gradeField.tap()
        app.pickerWheels["M"].adjust(toPickerWheelValue: "VD")
        app.pickers.children(matching: .pickerWheel).element(boundBy: 1).adjust(toPickerWheelValue: "7b")
        app.toolbars["Toolbar"].buttons["Done"].tap()
        
        let venueField =  app.scrollViews.otherElements.textFields["e.g. Ben Nevis"]
        venueField.tap()
        venueField.typeText(venueNameEntered)
        
        let dateField = app.scrollViews.otherElements.textFields["DD/MM/YYYY"]
        dateField.tap()
        app.pickers.children(matching: .pickerWheel).element(boundBy: 0).adjust(toPickerWheelValue: "January")
        app.pickers.children(matching: .pickerWheel).element(boundBy: 1).adjust(toPickerWheelValue: "31")
        app.pickers.children(matching: .pickerWheel).element(boundBy: 2).adjust(toPickerWheelValue: "2020")
        app.toolbars["Toolbar"].buttons["Done"].tap()
        
        let partnersField = app.scrollViews.otherElements.containing(.staticText, identifier:"Route:").children(matching: .textField).element(boundBy: 4)
        partnersField.tap()
        partnersField.typeText(partnersEntered)
        
        app.scrollViews.otherElements.tables.staticTexts[climbingStyleSelected].tap()
        
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testThatWhenLogbookScreenIsPresentedATableOfLoggedClimbsIsDisplayed() {
        
        
    }
    
}
