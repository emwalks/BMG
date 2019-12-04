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
        
        let databaseService = MockDatabaseService()
        let loggedRockClimbId = Int64.random(in: 200..<300)
        let mockRockClimbLoggedScreen = MockRockClimbLoggedScreen()
        let rockClimbLoggedViewModel = RockClimbLoggedViewModel(databaseService, idOfRockClimbReceived: loggedRockClimbId, rockClimbLoggedScreen: mockRockClimbLoggedScreen)
        
        rockClimbLoggedViewModel.retrieveRockClimb(idOfRockClimb: loggedRockClimbId)
        
        let actualResult =  databaseService.loggedRockClimbId
        
        XCTAssertEqual(loggedRockClimbId, actualResult)
        
    }
    
    func testWhenGivenAnIdRockClimbLoggedViewModelRetrievesTheRockClimbRouteName() {
        
        let queryId: Int64 = -10
        let databaseService = MockDatabaseService()
        let mockRockClimbLoggedScreen = MockRockClimbLoggedScreen()
        let rockClimbLoggedViewModel = RockClimbLoggedViewModel(databaseService, idOfRockClimbReceived: queryId, rockClimbLoggedScreen: mockRockClimbLoggedScreen)
        
        rockClimbLoggedViewModel.retrieveRockClimb(idOfRockClimb: queryId)

        let expectedResult = "I am a mockDBService climb whose id is -10"
        let actualResult =  databaseService.loggedRouteName
        
        XCTAssertEqual(expectedResult, actualResult)
        
    }
    
    func testWhenRouteNameIsReturnedFromDBToVmItIsPresentedOnScreen() {
        
        let queryId: Int64 = -10
        let databaseService = MockDatabaseService()
        let mockRockClimbLoggedScreen = MockRockClimbLoggedScreen()
        let rockClimbLoggedViewModel = RockClimbLoggedViewModel(databaseService, idOfRockClimbReceived: queryId, rockClimbLoggedScreen: mockRockClimbLoggedScreen)
        
        rockClimbLoggedViewModel.retrieveRockClimb(idOfRockClimb: queryId)
        
        let expectedResult = databaseService.loggedRouteName
        let actualResult = mockRockClimbLoggedScreen.routeNameOnScreen
        
        XCTAssertEqual(actualResult, expectedResult)
    }
    
}

