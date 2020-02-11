//
//  LogbookViewModel_UITests.swift
//  BMGUITests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 20/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest
import SQLite

class LogbookViewModel_UITests: XCTestCase {
    
    var app: XCUIApplication!
    let routeNameEntered: String = "randomRouteName" + String(describing: Int.random(in: 500..<600))
    let gradeSelected = "VDiff 7b"
    let venueNameEntered: String = "randomVenueName" + String(describing: Int.random(in: 500..<600))
    let dateSelected = "31/01/2020"
    let partnersEntered: String = "randomPartner" + String(describing: Int.random(in: 500..<600))
    let climbingStyleSelected: String = "Alternate"
    
    override func setUp() {
        
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        
        app.launchArguments = ["RESET_DB"]
        app.launch()
        app.otherElements.buttons["Log Rock Climb"].tap()
        
        let routeField = app.scrollViews.otherElements.textFields["routeTextField"]
        routeField.tap()
        routeField.typeText(routeNameEntered)
        
        let gradeField = app.scrollViews.otherElements.textFields["gradeTextField"]
        gradeField.tap()
        app.pickerWheels["Mod"].adjust(toPickerWheelValue: "VDiff")
        app.pickers.children(matching: .pickerWheel).element(boundBy: 1).adjust(toPickerWheelValue: "7b")
        app.toolbars["Toolbar"].buttons["Done"].tap()
        
        let venueField =  app.scrollViews.otherElements.textFields["venueTextField"]
        venueField.tap()
        venueField.typeText(venueNameEntered)
        
        let dateField = app.scrollViews.otherElements.textFields["dateTextField"]
        dateField.tap()
        app.pickers.children(matching: .pickerWheel).element(boundBy: 0).adjust(toPickerWheelValue: "January")
        app.pickers.children(matching: .pickerWheel).element(boundBy: 1).adjust(toPickerWheelValue: "31")
        app.pickers.children(matching: .pickerWheel).element(boundBy: 2).adjust(toPickerWheelValue: "2020")
        app.toolbars["Toolbar"].buttons["Done"].tap()
        
        
        let partnersField = app.scrollViews.otherElements.textFields["partnersTextField"]
        partnersField.tap()
        partnersField.typeText(partnersEntered)
        
        let exitRouteFieldKeyboard = app.scrollViews.otherElements
        exitRouteFieldKeyboard.staticTexts["Route:"].tap()
        
        app.scrollViews.otherElements.tables.staticTexts["Alternate"].tap()
        app.scrollViews.otherElements.buttons["Submit"].tap()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testThatWhenLogbookScreenIsNavigatedToTheRouteNamesOfClimbEnteredAreDisplayedInTheTitlePositionOfTheCell() {
        
        app.launchArguments = []
        app.launch()
        
        app.otherElements.buttons["View Logbook"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "cellTitleText").label, "Route: \(routeNameEntered)")
        
    }
    
    
    func testThatWhenLogbookScreenIsNavigatedToTheGradeAndStyleOfClimbEnteredAreDisplayedInTheDetailPositionOfTheCell(){
        
        app.launchArguments = []
        app.launch()
        
        app.otherElements.buttons["View Logbook"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "cellDetailText").label, "Grade: \(gradeSelected) Style: \(climbingStyleSelected)")
        
    }
    
    func testThatWhenShowDetailButtonIsClickedTheLoggedClimbDataIsShown(){
        
        app.launchArguments = []
        app.launch()
        
        app.otherElements.buttons["View Logbook"].tap()
        app.tables["logbookView"].cells.children(matching: .other).element(boundBy: 0).tap()
        
        XCTAssertTrue(app.staticTexts.element(matching:.any, identifier: "routeNamePresented").exists)
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "routeNamePresented").label, " Route Name: \(routeNameEntered)")
        
        XCTAssertTrue(app.staticTexts.element(matching:.any, identifier: "gradePresented").exists)
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "gradePresented").label, " Grade: \(gradeSelected)")
        
        XCTAssertTrue(app.staticTexts.element(matching:.any, identifier: "venueNamePresented").exists)
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "venueNamePresented").label, " Venue: \(venueNameEntered)")
        
        XCTAssertTrue(app.staticTexts.element(matching:.any, identifier: "datePresented").exists)
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "datePresented").label, " Date: \(dateSelected)")
        
        XCTAssertTrue(app.staticTexts.element(matching:.any, identifier: "partnersPresented").exists)
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "partnersPresented").label, " Partners: \(partnersEntered)")
        
        XCTAssertTrue(app.staticTexts.element(matching:.any, identifier: "climbingStylePresented").exists)
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "climbingStylePresented").label, " Style: \(climbingStyleSelected)")
        
        
    }
    
}
