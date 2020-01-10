//
//  RockClimbLandingPage_Tests.swift
//  BMGTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class RockClimbLandingPage_Tests: XCTestCase {
    class MockRockClimbLandingPage {
        func goToLogRockClimbScreen() -> MockLogRockClimbScreen? {
            let resultOfGoToLogRockClimbScreenFunction = MockLogRockClimbScreen()
            return resultOfGoToLogRockClimbScreenFunction
        }

        func goToViewLogbookScreen() -> MockViewLogbookScreen? {
            return nil
        }
    }

    class MockLogRockClimbScreen {

    }

    class MockViewLogbookScreen {

    }

    func testThatWhenLogRockClimbIsSelectedFromLandingPageUserGoesToLogRockClimbScreen() {
        
        let mockRockClimbLandingPage = MockRockClimbLandingPage()
        var mockLogRockClimbScreen: MockLogRockClimbScreen? = nil

        mockLogRockClimbScreen = mockRockClimbLandingPage.goToLogRockClimbScreen()

        XCTAssertNotNil(mockLogRockClimbScreen, "The mockLogRockClimbScreen exists")
    }

    func testThatWhenViewLogbookIsSelectedFromLandingPageUserGoesToViewLogbookScreen() {
        //arrange
        let mockRockClimbLandingPage = MockRockClimbLandingPage()
        var mockViewLogbookScreen: MockViewLogbookScreen? = nil

        //act
        mockViewLogbookScreen = mockRockClimbLandingPage.goToViewLogbookScreen()

        //assert
        XCTAssertNotNil(mockViewLogbookScreen, "The mockViewLogbookScreen exists")
    }
}
