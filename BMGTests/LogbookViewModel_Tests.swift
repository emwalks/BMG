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
        let mockLogbookScreen = MockLogbookScreen()
        let mockScreenNavigationController = MockScreenNavigationController()
        
        //act
        _ = LogbookViewModel(mockDatabaseService, logbookScreen: mockLogbookScreen, screenNavigationController: mockScreenNavigationController)
        
        let actualResult = mockLogbookScreen.tableOfLoggedClimbs
        
        //assert
        XCTAssertEqual(actualResult, true, "the table of Rock Climbs exists in MockMyLogbookScreen")
    }
    
    func testThatWhenLogbookScreenIsPresentedTheLoggedClimbRouteNamesAreDisplayed(){
        
        //arrange
        
        let mockDatabaseService = MockDatabaseService()
        let mockLogbookScreen = MockLogbookScreen()
        let mockScreenNavigationController = MockScreenNavigationController()
        
        //act
        _ = LogbookViewModel(mockDatabaseService, logbookScreen: mockLogbookScreen, screenNavigationController: mockScreenNavigationController)
        //assert
        XCTAssertNotNil(mockLogbookScreen.routeNameOnScreen)
    }
    
    func testThatWhenLogbookScreenIsPresentedTheLoggedClimbGradesAreDisplayed(){
        
        //arrange
        
        let mockDatabaseService = MockDatabaseService()
        let mockLogbookScreen = MockLogbookScreen()
        let mockScreenNavigationController = MockScreenNavigationController()
        
        //act
        _ = LogbookViewModel(mockDatabaseService, logbookScreen: mockLogbookScreen, screenNavigationController: mockScreenNavigationController)
        //assert
        XCTAssertNotNil(mockLogbookScreen.gradeOnScreen)
    }
    
    func testThatWhenLogbookScreenIsPresentedTheLoggedClimbVenueAreDisplayed(){
        
        //arrange
        
        let mockDatabaseService = MockDatabaseService()
        let mockLogbookScreen = MockLogbookScreen()
        let mockScreenNavigationController = MockScreenNavigationController()
        
        //act
        _ = LogbookViewModel(mockDatabaseService, logbookScreen: mockLogbookScreen, screenNavigationController: mockScreenNavigationController)
        //assert
        XCTAssertNotNil(mockLogbookScreen.venueNameOnScreen)
    }
    
    func testThatWhenLogbookScreenIsPresentedTheLoggedClimbDatesAreDisplayed(){

        //arrange
        
        let mockDatabaseService = MockDatabaseService()
        let mockLogbookScreen = MockLogbookScreen()
        let mockScreenNavigationController = MockScreenNavigationController()
        
        //act
        _ = LogbookViewModel(mockDatabaseService, logbookScreen: mockLogbookScreen, screenNavigationController: mockScreenNavigationController)
        //assert
        XCTAssertNotNil(mockLogbookScreen.dateOnScreen)
    }
    
    func testThatWhenLogbookScreenIsPresentedTheLoggedClimbPartnersAreDisplayed(){
        
        //arrange
        
        let mockDatabaseService = MockDatabaseService()
        let mockLogbookScreen = MockLogbookScreen()
        let mockScreenNavigationController = MockScreenNavigationController()
        
        //act
        _ = LogbookViewModel(mockDatabaseService, logbookScreen: mockLogbookScreen, screenNavigationController: mockScreenNavigationController)
        //assert
        XCTAssertNotNil(mockLogbookScreen.partnersOnScreen)
    }
    
    func testThatWhenLogbookScreenIsPresentedTheLoggedClimbStyleAreDisplayed(){
        
        //arrange
        //arrange
        
        let mockDatabaseService = MockDatabaseService()
        let mockLogbookScreen = MockLogbookScreen()
        let mockScreenNavigationController = MockScreenNavigationController()
        
        //act
        _ = LogbookViewModel(mockDatabaseService, logbookScreen: mockLogbookScreen, screenNavigationController: mockScreenNavigationController)
        //assert
        XCTAssertNotNil(mockLogbookScreen.climbingStyleOnScreen)
    }
    
    
//    func testWhenShowRockClimbDetailButtonIsClickedTheRockClimbLoggedScreenIsNavigatedToViaMockScreenNavigationController() {
//        //arrange
//        let databaseService = MockDatabaseService()
//        let mockLogbookScreen = MockLogbookScreen()
//        let mockScreenNavigationController = MockScreenNavigationController()
//        let logbookViewModel = LogbookViewModel(databaseService, logbookScreen: mockLogbookScreen, screenNavigationController: mockScreenNavigationController)
//
//        //act
//        logbookViewModel.showRockClimbDetails()
//
//        //assert
//        XCTAssertEqual(logbookViewModel.idOfRockClimbSelected, mockScreenNavigationController.loggedRockClimbId)
//    }
//
}
