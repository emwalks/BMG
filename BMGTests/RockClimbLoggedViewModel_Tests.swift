//
//  RockClimbLoggedViewModel_Tests.swift
//  BMGTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 29/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class RockClimbLoggedViewModel_Tests: XCTestCase {
        
    func testWhenRockClimbEntryIsReturnedFromDBToVmRouteNameIsPresentedOnScreen() {
        let mockDatabaseService = MockDatabaseService()
        let routeNameEntered: String = "I am a mockDatabaseService randomRouteName" + String(describing: Int.random(in: 200..<300))
               
        let climbId: Int64 = mockDatabaseService.addRockClimbToDb(routeName: routeNameEntered, grade: "", venueName: "", date: "", partners: "", climbingStyle: "")
        let mockRockClimbLoggedScreen = MockRockClimbLoggedScreen()
        let rockClimbLoggedViewModel = RockClimbLoggedViewModel(mockDatabaseService, idOfRockClimbReceived: climbId)
        
        let dictionary = rockClimbLoggedViewModel.getRockClimbData()
        
        
        let expectedResult = routeNameEntered
        let actualResult = mockRockClimbLoggedScreen.routeNameOnScreen
        
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenRockClimbEntryIsReturnedFromDBToVmGradeIsPresentedOnScreen() {
        let mockDatabaseService = MockDatabaseService()
        let routeNameEntered: String = "I am a mockDatabaseService randomRouteName" + String(describing: Int.random(in: 200..<300))
               
        let gradeEntered: String = Grades.adjectivalGrades.randomElement()! + " " + Grades.technicalGrades.randomElement()!
        
        let climbId: Int64 = mockDatabaseService.addRockClimbToDb(routeName: routeNameEntered, grade: gradeEntered, venueName: "", date: "", partners: "", climbingStyle: "")
        let mockRockClimbLoggedScreen = MockRockClimbLoggedScreen()
        let rockClimbLoggedViewModel = RockClimbLoggedViewModel(mockDatabaseService, idOfRockClimbReceived: climbId)
        
        rockClimbLoggedViewModel.getRockClimbData()
        
        let expectedResult = gradeEntered
        let actualResult = mockRockClimbLoggedScreen.gradeOnScreen
        
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenRockClimbEntryIsReturnedFromDBToVmVenueIsPresentedOnScreen() {
        let mockDatabaseService = MockDatabaseService()
    
        let venueNameEntered: String = "I am a mockDatabaseService randomVenueName" + String(describing: Int.random(in: 100..<200))
        
        let climbId: Int64 = mockDatabaseService.addRockClimbToDb(routeName: "", grade: "", venueName: venueNameEntered, date: "", partners: "", climbingStyle: "")
        let mockRockClimbLoggedScreen = MockRockClimbLoggedScreen()
        let rockClimbLoggedViewModel = RockClimbLoggedViewModel(mockDatabaseService, idOfRockClimbReceived: climbId)
        
        rockClimbLoggedViewModel.getRockClimbData()
        
        let expectedResult = venueNameEntered
        let actualResult = mockRockClimbLoggedScreen.venueNameOnScreen
        
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    
    func testWhenRockClimbEntryIsReturnedFromDBToVmDateIsPresentedOnScreen() {
        let mockDatabaseService = MockDatabaseService()
        
        let dateEntered: String = "07/01/2020"
        
        let climbId: Int64 = mockDatabaseService.addRockClimbToDb(routeName: "", grade: "", venueName: "", date: dateEntered, partners: "", climbingStyle: "")
        let mockRockClimbLoggedScreen = MockRockClimbLoggedScreen()
        let rockClimbLoggedViewModel = RockClimbLoggedViewModel(mockDatabaseService, idOfRockClimbReceived: climbId)
        
        rockClimbLoggedViewModel.getRockClimbData()
        
        let expectedResult = dateEntered
        let actualResult = mockRockClimbLoggedScreen.dateOnScreen
        
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenRockClimbEntryIsReturnedFromDBToVmPartnersIsPresentedOnScreen() {
        let mockDatabaseService = MockDatabaseService()
        
        let partnersEntered: String = "I am a mockDatabaseService partners" + String(describing: Int.random(in: 100..<200))
        
        let climbId: Int64 = mockDatabaseService.addRockClimbToDb(routeName: "", grade: "", venueName: "", date: "", partners: partnersEntered, climbingStyle: "")
        let mockRockClimbLoggedScreen = MockRockClimbLoggedScreen()
        let rockClimbLoggedViewModel = RockClimbLoggedViewModel(mockDatabaseService, idOfRockClimbReceived: climbId)
        
        rockClimbLoggedViewModel.getRockClimbData()
        
        let expectedResult = partnersEntered
        let actualResult = mockRockClimbLoggedScreen.partnersOnScreen
        
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testWhenRockClimbEntryIsReturnedFromDBToVmClimbingStyleIsPresentedOnScreen() {
        let mockDatabaseService = MockDatabaseService()
        
        let climbingStyleEntered: String = "I am a mockDatabaseService climbStyle" + String(describing: Int.random(in: 100..<200))
        
        let climbId: Int64 = mockDatabaseService.addRockClimbToDb(routeName: "", grade: "", venueName: "", date: "", partners: "", climbingStyle: climbingStyleEntered)
        let mockRockClimbLoggedScreen = MockRockClimbLoggedScreen()
        let rockClimbLoggedViewModel = RockClimbLoggedViewModel(mockDatabaseService, idOfRockClimbReceived: climbId)
        
        rockClimbLoggedViewModel.getRockClimbData()
        
        let expectedResult = climbingStyleEntered
        let actualResult = mockRockClimbLoggedScreen.climbingStyleOnScreen
        
        XCTAssertEqual(actualResult, expectedResult)
    }
    
}

