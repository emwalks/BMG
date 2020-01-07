//
//  RockClimbLoggedViewModel_Tests.swift
//  BMGTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 29/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class RockClimbLoggedViewModel_Tests: XCTestCase {
    
    
    func testWhenGivenAnIdRockClimbLoggedViewModelRetrievesTheRockClimbDataId() {
       
        let mockDatabaseService = MockDatabaseService()
        let routeNameEntered: String = "I am a mockDatabaseService randomRouteName" + String(describing: Int.random(in: 0..<100))
               
        let gradeEntered: String = Grades.adjectivalGrades.randomElement()! + " " + Grades.technicalGrades.randomElement()!
        
        
        let climbId: Int64 = mockDatabaseService.addRockClimbToDb(routeName: routeNameEntered, grade: gradeEntered)
        
       
        let mockRockClimbLoggedScreen = MockRockClimbLoggedScreen()
        let rockClimbLoggedViewModel = RockClimbLoggedViewModel(mockDatabaseService, idOfRockClimbReceived: climbId, rockClimbLoggedScreen: mockRockClimbLoggedScreen)
        
        rockClimbLoggedViewModel.retrieveRockClimb(idOfRockClimb: climbId)
        
        let actualResult =  mockDatabaseService.loggedRockClimbId
        
        XCTAssertEqual(climbId, actualResult)
        
    }
    
    func testWhenGivenAnIdRockClimbLoggedViewModelRetrievesTheRockClimbRouteName() {
        
        let mockDatabaseService = MockDatabaseService()
        let routeNameEntered: String = "I am a mockDatabaseService randomRouteName" + String(describing: Int.random(in: 100..<200))
               
        let gradeEntered: String = Grades.adjectivalGrades.randomElement()! + " " + Grades.technicalGrades.randomElement()!
        
        
        let climbId: Int64 = mockDatabaseService.addRockClimbToDb(routeName: routeNameEntered, grade: gradeEntered)
        
        let mockRockClimbLoggedScreen = MockRockClimbLoggedScreen()
        let rockClimbLoggedViewModel = RockClimbLoggedViewModel(mockDatabaseService, idOfRockClimbReceived: climbId, rockClimbLoggedScreen: mockRockClimbLoggedScreen)
        
        rockClimbLoggedViewModel.retrieveRockClimb(idOfRockClimb: climbId)

        let expectedResult = routeNameEntered
        let actualResult =  mockDatabaseService.loggedRouteName
        
        XCTAssertEqual(expectedResult, actualResult)
        
    }
    
    func testWhenRouteNameIsReturnedFromDBToVmItIsPresentedOnScreen() {
        let mockDatabaseService = MockDatabaseService()
        let routeNameEntered: String = "I am a mockDatabaseService randomRouteName" + String(describing: Int.random(in: 200..<300))
               
        let gradeEntered: String = Grades.adjectivalGrades.randomElement()! + " " + Grades.technicalGrades.randomElement()!
        
        let climbId: Int64 = mockDatabaseService.addRockClimbToDb(routeName: routeNameEntered, grade: gradeEntered)
        let mockRockClimbLoggedScreen = MockRockClimbLoggedScreen()
        let rockClimbLoggedViewModel = RockClimbLoggedViewModel(mockDatabaseService, idOfRockClimbReceived: climbId, rockClimbLoggedScreen: mockRockClimbLoggedScreen)
        
        rockClimbLoggedViewModel.retrieveRockClimb(idOfRockClimb: climbId)
        
        let expectedResult = routeNameEntered
        let actualResult = mockRockClimbLoggedScreen.routeNameOnScreen
        
        XCTAssertEqual(actualResult, expectedResult)
    }
    
}

