//
//  RockClimbLandingPage_Tests.swift
//  BMGTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class RockClimbLandingPage_Tests: XCTestCase {

    func testThatWhenLogRockClimbIsSelectedFromLandingPageUserGoesToLogRockClimb() {
        
        //arrange
        let mockRockClimbLandingPage = MockRockClimbLandingPage()
        var mockLogRockClimbScreen: MockLogRockClimbScreen? = nil

        class MockRockClimbLandingPage {
            func goToLogRockClimbScreen() -> MockLogRockClimbScreen? {
                let resultOfGoToLogRockClimbScreenFunction = MockLogRockClimbScreen()
                return resultOfGoToLogRockClimbScreenFunction
            }
        }
    
        class MockLogRockClimbScreen {
            
        }

        //act
        mockLogRockClimbScreen = mockRockClimbLandingPage.goToLogRockClimbScreen()

        //assert
        XCTAssertNotNil(mockLogRockClimbScreen, "The mockLogRockClimbScreen exists")
    }
   
}
