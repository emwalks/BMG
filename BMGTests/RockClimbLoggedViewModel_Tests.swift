//
//  RockClimbLoggedViewModel_Tests.swift
//  BMGTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 29/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class RockClimbLoggedViewModel_Tests: XCTestCase {
    
    func testWhenGivenAnIdTheVMRetrievesTheCorrectRockClimbData() {
        
        let databaseService = MockDatabaseService()
        let rockClimbLoggedViewModel = RockClimbLoggedViewModel(databaseService)
        
        let loggedRockClimbId = Int.random(in: 200...300)
        
        let actualResult = rockClimbLoggedViewModel.retrieveRockClimbDataFromDb(idOfRockClimb: loggedRockClimbId)
        
        XCTAssertEqual(loggedRockClimbId, actualResult)
        
    }
    
}

