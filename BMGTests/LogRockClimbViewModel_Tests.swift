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
        let logRockClimbViewModel = LogRockClimbViewModel(DatabaseService())
        let actualResult = logRockClimbViewModel.gradeText()
        let expectedResult = "Please select a grade"
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testSelectedGradeText() {
        
        let logRockClimbViewModel = LogRockClimbViewModel(DatabaseService())
        
        let selectedAdjectivalGrade = "E1"
        let selectedTechnicalGrade = "5c"
        
        _ = logRockClimbViewModel.selectGrade(adjectivalGrade: selectedAdjectivalGrade, technicalGrade: selectedTechnicalGrade)
        
        let actualResult = logRockClimbViewModel.gradeText()
        let expectedResult = "E1 5c"
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testSelectedGradeTextTechnicalBlank() {
        
        let logRockClimbViewModel = LogRockClimbViewModel(DatabaseService())
        
        let selectedAdjectivalGrade = "E1"
        let selectedTechnicalGrade = ""
        
        _ = logRockClimbViewModel.selectGrade(adjectivalGrade: selectedAdjectivalGrade, technicalGrade: selectedTechnicalGrade)
        
        let actualResult = logRockClimbViewModel.gradeText()
        let expectedResult = "E1 "
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    
    
    func testWhenSubmitButtonClickedTheDataIsRemovedFromTheArray(){
        let logRockClimbViewModel = LogRockClimbViewModel(DatabaseService())
        let enteredRouteName = "The Bat"
        _ = logRockClimbViewModel.logClimbData(routeName: enteredRouteName)
        
    }
    
    func testWhenSubmitButtonClickedClimbDataPersists() {
        
        let databaseService = DatabaseService()
        let logRockClimbViewModel = LogRockClimbViewModel(databaseService)
        
        let routeNameEntered = "Jomo"
        logRockClimbViewModel.logClimbData(routeName: routeNameEntered)
        
        let actualResult = databaseService.loggedRouteName
        XCTAssertEqual(routeNameEntered, actualResult)
    }
    
}
