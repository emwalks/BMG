//
//  RockClimbLandingPage_Tests.swift
//  BMGTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class RockClimbLandingPageViewModel_Tests: XCTestCase {
    
    
    func testWhenLogRockClimbButtonIsClickedTheLogRockClimbScreenIsNavigatedToViaScreenNavigationController() {
        //arrange
        let mockScreenNavigationController = MockScreenNavigationController()
        let mockRockClimbHomePageViewModel = MockRockClimbHomePageViewModel(screenNavigationController: mockScreenNavigationController)
        
        class MockRockClimbHomePageViewModel {
            
            var screenNavigationController: ScreenNavigationController
            
            init(screenNavigationController: ScreenNavigationController) {
                self.screenNavigationController = screenNavigationController
            }
            
            func displayLogARockClimbScreen() {
                screenNavigationController.displayLogARockClimbScreen()
            }
            
        }
        
        //act
        mockRockClimbHomePageViewModel.displayLogARockClimbScreen()
        
        //assert
        XCTAssertEqual(logARockClimbScreenExists, true, "The function: displayLogARockClimbScreen has run")
    }
    
}

