//
//  RockClimbLandingPage_Tests.swift
//  BMGTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class RockClimbHomePageViewModel_Tests: XCTestCase {
    
    class MockRockClimbHomePageViewModel {
        
        var screenNavigationController: ScreenNavigationController
        
        init(screenNavigationController: ScreenNavigationController) {
            self.screenNavigationController = screenNavigationController
        }
        
        func displayLogARockClimbScreen() {
            screenNavigationController.displayLogARockClimbScreen()
        }
        
        func displayLogbookScreen() {
            screenNavigationController.displayLogbookScreen()
        }
        
    }
    
    func testWhenLogRockClimbButtonIsClickedTheLogRockClimbScreenIsNavigatedToViaScreenNavigationController() {
        //arrange
        let mockScreenNavigationController = MockScreenNavigationController()
        let mockRockClimbHomePageViewModel = MockRockClimbHomePageViewModel(screenNavigationController: mockScreenNavigationController)
        
        //act
        mockRockClimbHomePageViewModel.displayLogARockClimbScreen()
        
        //assert
        XCTAssertEqual(logARockClimbScreenExists, true, "The function: displayLogARockClimbScreen has run")
    }
    
    func testWhenViewLogbookButtonIsClickedTheLogRockClimbScreenIsNavigatedToViaScreenNavigationController() {
        //arrange
        let mockScreenNavigationController = MockScreenNavigationController()
        let mockRockClimbHomePageViewModel = MockRockClimbHomePageViewModel(screenNavigationController: mockScreenNavigationController)
        
        //act
        mockRockClimbHomePageViewModel.displayLogbookScreen()
        
        //assert
        XCTAssertEqual(logbookScreenExists, true, "The function: displayLogbookScreen has run")
    }
    
}

