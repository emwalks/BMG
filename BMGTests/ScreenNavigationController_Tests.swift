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
       
        let enteredRouteName = "Knolle"
        logRockClimbViewModel.logClimbData(routeName: enteredRouteName)
        
        let idAssignedInLogRockClimbViewModel = logRockClimbViewModel.idGivenToRockClimb
        
        let expectedResult = databaseService.loggedRockClimbId
        let actualResult = mockScreenNavigationController.displayLoggedRockClimbDataScreen(idAssignedInLogRockClimbViewModel)
        
        XCTAssertEqual(expectedResult, actualResult, "id has been passed to Screen Navigation Controller")
    }
}

