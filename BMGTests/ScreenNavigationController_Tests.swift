//
//  ScreenNavigationController_Tests.swift
//  BMGTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 03/12/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class ScreenNavigationController_Tests: XCTestCase {
    
    func testWhenScreenNavigationControllerIsCalledTheRockClimbIdGetsPassedToIt() {
        
        let databaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logRockClimbViewModel = LogRockClimbViewModel(databaseService, screenNavigationController: mockScreenNavigationController)
        
        let actualResult = mockScreenNavigationController.loggedRockClimbId
        let expectedResult =  databaseService.loggedRockClimbId
        
        XCTAssertEqual(expectedResult, actualResult, "id hass been passed to Screen Navigation Controller")
    }
}

