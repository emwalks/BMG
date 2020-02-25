//
//  MyLogbookViewModel_Tests.swift
//  BMGTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 14/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class LogbookViewModel_Tests: XCTestCase {
    
    func testThatWhenLogbookScreenIsPresentedATableOfLoggedClimbsIsDisplayed(){
        
        //arrange
        
        let mockDatabaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logbookViewModel = LogbookViewModel(mockDatabaseService, screenNavigationController: mockScreenNavigationController)
        let mockLogbookScreen = MockLogbookScreen(logbookViewModel: logbookViewModel)
        
        //act
        
        
        let actualResult = mockLogbookScreen.tableOfLoggedClimbs
        
        //assert
        XCTAssertEqual(actualResult, true, "the table of Rock Climbs exists in MockMyLogbookScreen")
    }
    
    func testThatWhenLogbookScreenIsPresentedTheLoggedClimbRouteNamesAreDisplayed(){
        
        //arrange
        
        let mockDatabaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logbookViewModel = LogbookViewModel(mockDatabaseService, screenNavigationController: mockScreenNavigationController)
        let mockLogbookScreen = MockLogbookScreen(logbookViewModel: logbookViewModel)
        
        //assert
        XCTAssertNotNil(mockLogbookScreen.routeNameOnScreen)
    }
    
    func testThatWhenLogbookScreenIsPresentedTheLoggedClimbGradesAreDisplayed(){
        
        //arrange
        
        let mockDatabaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logbookViewModel = LogbookViewModel(mockDatabaseService, screenNavigationController: mockScreenNavigationController)
        let mockLogbookScreen = MockLogbookScreen(logbookViewModel: logbookViewModel)
        //assert
        XCTAssertNotNil(mockLogbookScreen.gradeOnScreen)
    }
    
    func testThatWhenLogbookScreenIsPresentedTheLoggedClimbVenueAreDisplayed(){
        
        //arrange
        
        let mockDatabaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logbookViewModel = LogbookViewModel(mockDatabaseService, screenNavigationController: mockScreenNavigationController)
        let mockLogbookScreen = MockLogbookScreen(logbookViewModel: logbookViewModel)
        //assert
        XCTAssertNotNil(mockLogbookScreen.venueNameOnScreen)
    }
    
    func testThatWhenLogbookScreenIsPresentedTheLoggedClimbDatesAreDisplayed(){
        
        //arrange
        
        let mockDatabaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logbookViewModel = LogbookViewModel(mockDatabaseService, screenNavigationController: mockScreenNavigationController)
        let mockLogbookScreen = MockLogbookScreen(logbookViewModel: logbookViewModel)
        //assert
        XCTAssertNotNil(mockLogbookScreen.dateOnScreen)
    }
    
    func testThatWhenLogbookScreenIsPresentedTheLoggedClimbPartnersAreDisplayed(){
        
        //arrange
        
        let mockDatabaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logbookViewModel = LogbookViewModel(mockDatabaseService, screenNavigationController: mockScreenNavigationController)
        let mockLogbookScreen = MockLogbookScreen(logbookViewModel: logbookViewModel)
        //assert
        XCTAssertNotNil(mockLogbookScreen.partnersOnScreen)
    }
    
    func testThatWhenLogbookScreenIsPresentedTheLoggedClimbStyleAreDisplayed(){
        
        //arrange
        //arrange
        
        let mockDatabaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logbookViewModel = LogbookViewModel(mockDatabaseService, screenNavigationController: mockScreenNavigationController)
        let mockLogbookScreen = MockLogbookScreen(logbookViewModel: logbookViewModel)
        //assert
        XCTAssertNotNil(mockLogbookScreen.climbingStyleOnScreen)
    }
    
}
