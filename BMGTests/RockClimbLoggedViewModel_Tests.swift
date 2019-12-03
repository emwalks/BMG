//
//  RockClimbLoggedViewModel_Tests.swift
//  BMGTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 29/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class RockClimbLoggedViewModel_Tests: XCTestCase {
    
    func testWhenGivenAnIdRockClimbLoggedViewModelRetrievesTheCorrectRockClimbData() {
        
        let databaseService = MockDatabaseService()
        let loggedRockClimbId = Int64.random(in: 200..<300)
        let rockClimbLoggedViewModel = RockClimbLoggedViewModel(databaseService, idOfRockClimbReceived: loggedRockClimbId)
        
        rockClimbLoggedViewModel.retrieveRockClimb(idOfRockClimb: loggedRockClimbId)
        
        let actualResult =  databaseService.loggedRockClimbId
        
        XCTAssertEqual(loggedRockClimbId, actualResult)
        
    }
    
    func testWhenTheScreenIsNavigatedToTheIdIsHandedToTheRockClimbLoggedViewModel() {
        
        let databaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let rockClimbLoggedViewModel = RockClimbLoggedViewModel(databaseService, idOfRockClimbReceived: mockScreenNavigationController.loggedRockClimbId)
        
        let expectedResult = mockScreenNavigationController.loggedRockClimbId
        let actualResult = rockClimbLoggedViewModel.idOfRockClimbReceived
        
        XCTAssertEqual(actualResult, expectedResult, "the id has been passed from the Mock ScreenNavController to the RockClimbLoggedViewModel")
        
    }
    
    //next test the whole pathway
    
    
}

