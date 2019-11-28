//
//  LogRockClimbViewModel_Tests.swift
//  BMGTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 30/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class LogRockClimbViewModel_Tests: XCTestCase {
    
    func testDefaultGradeText() {
        let databaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logRockClimbViewModel = LogRockClimbViewModel(databaseService, screenNavigationController: mockScreenNavigationController)
       
        let actualResult = logRockClimbViewModel.gradeText()
        let expectedResult = "Please select a grade"
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testSelectedGradeText() {
        
        let databaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logRockClimbViewModel = LogRockClimbViewModel(databaseService, screenNavigationController: mockScreenNavigationController)
        
        let selectedAdjectivalGrade = "E1"
        let selectedTechnicalGrade = "5c"
        
        _ = logRockClimbViewModel.selectGrade(adjectivalGrade: selectedAdjectivalGrade, technicalGrade: selectedTechnicalGrade)
        
        let actualResult = logRockClimbViewModel.gradeText()
        let expectedResult = "E1 5c"
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testSelectedGradeTextTechnicalBlank() {
        
        let databaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logRockClimbViewModel = LogRockClimbViewModel(databaseService, screenNavigationController: mockScreenNavigationController)
        
        let selectedAdjectivalGrade = "E1"
        let selectedTechnicalGrade = ""
        
        _ = logRockClimbViewModel.selectGrade(adjectivalGrade: selectedAdjectivalGrade, technicalGrade: selectedTechnicalGrade)
        
        let actualResult = logRockClimbViewModel.gradeText()
        let expectedResult = "E1 "
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    
    func testWhenSubmitButtonClickedClimbDataPersists() {
        
        let databaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logRockClimbViewModel = LogRockClimbViewModel(databaseService, screenNavigationController: mockScreenNavigationController)
        
        let routeNameEntered = "Jomo"
        logRockClimbViewModel.logClimbData(routeName: routeNameEntered)
        
        let actualResult = databaseService.loggedRouteName
        XCTAssertEqual(routeNameEntered, actualResult)
    }
    
    func testThatTheLoggedRockClimbScreenIsShownAfterSubmission() {

        
        let databaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logRockClimbViewModel = LogRockClimbViewModel(databaseService, screenNavigationController: mockScreenNavigationController)
        
        
        let enteredRouteName = "Jean Jeanie"
        logRockClimbViewModel.logClimbData(routeName: enteredRouteName)

        XCTAssertEqual(loggedRockClimbDataScreenExists, true, "The function: displayLoggedRockClimbDataScreen has run")
    }
}







