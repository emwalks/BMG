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
        let logRockClimbViewModel = LogRockClimbViewModel()
        let actualResult = logRockClimbViewModel.gradeText()
        let expectedResult = "Please select a grade"
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testSelectedGradeText() {
        
        let logRockClimbViewModel = LogRockClimbViewModel()
        
        let selectedAdjectivalGrade = "E1"
        let selectedTechnicalGrade = "5c"
        
        _ = logRockClimbViewModel.selectGrade(adjectivalGrade: selectedAdjectivalGrade, technicalGrade: selectedTechnicalGrade)
        
        let actualResult = logRockClimbViewModel.gradeText()
        let expectedResult = "E1 5c"
        XCTAssertEqual(actualResult, expectedResult)
    }
    
    func testSelectedGradeTextTechnicalBlank() {
        
        let logRockClimbViewModel = LogRockClimbViewModel()
        
        let selectedAdjectivalGrade = "E1"
        let selectedTechnicalGrade = ""
        
        _ = logRockClimbViewModel.selectGrade(adjectivalGrade: selectedAdjectivalGrade, technicalGrade: selectedTechnicalGrade)
        
        let actualResult = logRockClimbViewModel.gradeText()
        let expectedResult = "E1 "
        XCTAssertEqual(actualResult, expectedResult)
    }

    func testSubmitButtonPrintsToConsole() {
        
        let logRockClimbViewModel = LogRockClimbViewModel()
        
        let actualResult = logRockClimbViewModel.outputWhenSubmitButtonClicked()
        let expectedResult = "You clicked the submit button"
        XCTAssertEqual(actualResult, expectedResult)
    }

    
}
