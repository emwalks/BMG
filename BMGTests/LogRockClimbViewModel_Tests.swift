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
    
    
    func testWhenSubmitButtonClickedRouteNameDataPersists() {
        
        let databaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logRockClimbViewModel = LogRockClimbViewModel(databaseService, screenNavigationController: mockScreenNavigationController)
        
        let routeNameEntered = "Jomo"
        logRockClimbViewModel.logClimbData(routeName: routeNameEntered, grade: "", venueName: "", date: "")
        
        let actualResult = databaseService.loggedRouteName
        XCTAssertEqual(routeNameEntered, actualResult)
    }
    
    func testWhenSubmitButtonClickedGradeDataPersists() {
        //arrange
        let databaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logRockClimbViewModel = LogRockClimbViewModel(databaseService, screenNavigationController: mockScreenNavigationController)
        
        let selectedAdjectivalGrade: String = Grades.adjectivalGrades.randomElement()!
        let selectedTechnicalGrade:String = Grades.technicalGrades.randomElement()!
        
        //act
        logRockClimbViewModel.selectGrade(adjectivalGrade: selectedAdjectivalGrade, technicalGrade: selectedTechnicalGrade)
        let gradeEntered = logRockClimbViewModel.gradeText()
        
        logRockClimbViewModel.logClimbData(routeName: "", grade: gradeEntered, venueName: "", date: "")

        //assert
        let actualResult = databaseService.loggedClimbGrade
        XCTAssertEqual(gradeEntered, actualResult)
    }
    
    func testWhenSubmitButtonClickedVenueDataPersists() {
        //arrange
        let databaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logRockClimbViewModel = LogRockClimbViewModel(databaseService, screenNavigationController: mockScreenNavigationController)
        
        let venueNameEntered: String = "randomVenueName" + String(describing: Int.random(in: 0..<100))
        
        //act
        logRockClimbViewModel.logClimbData(routeName: "", grade: "", venueName: venueNameEntered, date: "")
        
        //assert
        let actualResult = databaseService.loggedVenueName
        XCTAssertEqual(venueNameEntered, actualResult)
       }
       
    
    func testWhenSubmitButtonClickedDatePersists() {
        
        let databaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logRockClimbViewModel = LogRockClimbViewModel(databaseService, screenNavigationController: mockScreenNavigationController)
        
        let dateEntered: String = "07/01/2020"
        
        
        logRockClimbViewModel.logClimbData(routeName: "", grade: "", venueName: "", date: dateEntered)
        
        
        let actualResult = databaseService.loggedDate
        XCTAssertEqual(dateEntered, actualResult)
    }
    
    
    func testThatTheLoggedRockClimbScreenIsShownAfterSubmission() {
        
        let databaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logRockClimbViewModel = LogRockClimbViewModel(databaseService, screenNavigationController: mockScreenNavigationController)
        
        
        let enteredRouteName = "Jean Jeanie"
        logRockClimbViewModel.logClimbData(routeName: enteredRouteName, grade: "", venueName: "", date: "")
        
        XCTAssertEqual(loggedRockClimbDataScreenExists, true, "The function: displayLoggedRockClimbDataScreen has run")
    }
    
    func testWhenARockClimbIsLoggedTheIdIsReturned() {
        let databaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logRockClimbViewModel = LogRockClimbViewModel(databaseService, screenNavigationController: mockScreenNavigationController)
        
        
        let enteredRouteName = "Just for Fun"
        logRockClimbViewModel.logClimbData(routeName: enteredRouteName, grade: "", venueName: "", date: "")
        
        let expectedResult = databaseService.loggedRockClimbId
        let actualResult = logRockClimbViewModel.idGivenToRockClimb
        
        XCTAssertEqual(expectedResult, actualResult)
    }
    
    func testWhenMockScreenNavigationControllerIsCalledTheRockClimbIdGetsPassedToIt() {
        
        let databaseService = MockDatabaseService()
        let mockScreenNavigationController = MockScreenNavigationController()
        let logRockClimbViewModel = LogRockClimbViewModel(databaseService, screenNavigationController: mockScreenNavigationController)
        
        let enteredRouteName = "Knolle"
        logRockClimbViewModel.logClimbData(routeName: enteredRouteName, grade: "", venueName: "", date: "")
        
        let idAssignedInLogRockClimbViewModel = logRockClimbViewModel.idGivenToRockClimb
        
        let expectedResult = databaseService.loggedRockClimbId
        let actualResult = mockScreenNavigationController.loggedRockClimbId
        
        XCTAssertEqual(expectedResult, actualResult, "id has been passed to Mock Screen Navigation Controller")
    }
    
}






