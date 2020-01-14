//
//  RockClimbLandingPage_Tests.swift
//  BMGTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class RockClimbHomePageViewModel_Tests: XCTestCase {
    
    func testWhenLogRockClimbButtonIsClickedTheLogRockClimbScreenIsNavigatedToViaMockScreenNavigationController() {
        //arrange
        let mockScreenNavigationController = MockScreenNavigationController()
        let rockClimbHomePageViewModel = RockClimbHomePageViewModel(screenNavigationController: mockScreenNavigationController)
        
        //act
        rockClimbHomePageViewModel.displayLogARockClimbScreen()
        
        //assert
        XCTAssertEqual(logARockClimbScreenExists, true, "The function: displayLogARockClimbScreen has run")
    }
    
    func testWhenViewLogbookButtonIsClickedTheLogRockClimbScreenIsNavigatedToViaMockScreenNavigationController() {
        //arrange
        let mockScreenNavigationController = MockScreenNavigationController()
        let rockClimbHomePageViewModel = RockClimbHomePageViewModel(screenNavigationController: mockScreenNavigationController)
        
        //act
        rockClimbHomePageViewModel.displayLogbookScreen()
        
        //assert
        XCTAssertEqual(logbookScreenExists, true, "The function: displayLogbookScreen has run")
    }
        
}

