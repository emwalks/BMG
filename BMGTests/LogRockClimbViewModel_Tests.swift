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
        let logRockClimbViewModel = LogRockClimbViewModel(MockDatabaseService())
        let actualResult = logRockClimbViewModel.gradeText()
        let expectedResult = "Please select a grade"
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testSelectedGradeText() {
        
        let logRockClimbViewModel = LogRockClimbViewModel(MockDatabaseService())
        
        let selectedAdjectivalGrade = "E1"
        let selectedTechnicalGrade = "5c"
        
        _ = logRockClimbViewModel.selectGrade(adjectivalGrade: selectedAdjectivalGrade, technicalGrade: selectedTechnicalGrade)
        
        let actualResult = logRockClimbViewModel.gradeText()
        let expectedResult = "E1 5c"
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testSelectedGradeTextTechnicalBlank() {
        
        let logRockClimbViewModel = LogRockClimbViewModel(MockDatabaseService())
        
        let selectedAdjectivalGrade = "E1"
        let selectedTechnicalGrade = ""
        
        _ = logRockClimbViewModel.selectGrade(adjectivalGrade: selectedAdjectivalGrade, technicalGrade: selectedTechnicalGrade)
        
        let actualResult = logRockClimbViewModel.gradeText()
        let expectedResult = "E1 "
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    
    
    func testWhenSubmitButtonClickedTheDataIsRemovedFromTheArray(){
        let logRockClimbViewModel = LogRockClimbViewModel(MockDatabaseService())
        let enteredRouteName = "The Bat"
        _ = logRockClimbViewModel.logClimbData(routeName: enteredRouteName)
        
    }
    
    func testWhenSubmitButtonClickedClimbDataPersists() {
        
        let databaseService = MockDatabaseService()
        let logRockClimbViewModel = LogRockClimbViewModel(databaseService)
        
        let routeNameEntered = "Jomo"
        logRockClimbViewModel.logClimbData(routeName: routeNameEntered)
        
        let actualResult = databaseService.loggedRouteName
        XCTAssertEqual(routeNameEntered, actualResult)
    }
    
    func testShowTheLoggedRockClimbScreenAfterSubmission() {
        
        class MockNavigationController:ScreenNavigationController {
            
            public var returnedRockClimbId: Int = -2
            
            func showLoggedRockClimbOnScreen(rockClimbId: Int) -> Int {
                returnedRockClimbId = rockClimbId
                return returnedRockClimbId
            }
            
            
        }
        
        let mockNavigationController: MockNavigationController = MockNavigationController()
        let idOfRockClimbDisplayed = Int.random(in: 200...300)
        
        
        //we need our mock database service to return an id (idOfRockClimbDisplayed) when its asked to save a route name ( "anyoldstring")
        
        //action
        let databaseService = MockDatabaseService()
        let logRockClimbViewModel = LogRockClimbViewModel(databaseService)
        logRockClimbViewModel.logClimbData(routeName: "anyoldstring")
        
        let actualResult = mockNavigationController.returnedRockClimbId
        XCTAssertEqual(idOfRockClimbDisplayed, actualResult)
        
        //next need to add functionality that the VM calls the mockNav controller
        
    }
    
}

protocol ScreenNavigationController {
    func displayLoggedRockClimbDataScreen()
    
}
