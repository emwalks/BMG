//
//  ShowLogbookDetailViewModel.swift
//  BMGTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 24/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class ShowLogbookDetailViewModel_Tests: XCTestCase {
        
    func testThatWhenLogbookScreenIsPresentedATableOfLoggedClimbsIsDisplayed(){
        
        class ShowLogbookDetailViewModel {
            
            var idOfRockClimbReceived: Int64 = -1
            
            var databaseService: DatabaseService
            var showLogbookDetailScreen: ShowLogbookDetailScreenProtocol
            
            init(_ databaseService: DatabaseService, idOfRockClimbReceived: Int64, showLogbookDetailScreen: ShowLogbookDetailScreenProtocol) {
                self.databaseService = databaseService
                self.idOfRockClimbReceived = idOfRockClimbReceived
                self.showLogbookDetailScreen = showLogbookDetailScreen
                retrieveRockClimb(idOfRockClimb: idOfRockClimbReceived)
            }
            
            func retrieveRockClimb(idOfRockClimb: Int64) {
                
                if idOfRockClimbReceived == idOfRockClimb {
                    let rockClimbDataReceived = databaseService.getRockClimbDataFromDb(idOfRockClimb: idOfRockClimb)
                    showLogbookDetailScreen.rockClimbDataPresented(rockClimbEntry: rockClimbDataReceived)
                } else {
                    print("Error: Id of rock climb received does match id of rock climb logged")
                }
            }
        }
        
        class MockShowLogbookDetailScreen: ShowLogbookDetailScreenProtocol {
            
            public var routeNameOnScreen: String = ""
            public var gradeOnScreen: String = ""
            public var venueNameOnScreen: String = ""
            public var dateOnScreen: String = "01/01/1970"
            public var partnersOnScreen: String = ""
            public var climbingStyleOnScreen : String = ""
            
            func rockClimbDataPresented(rockClimbEntry: RockClimbEntry) {
                routeNameOnScreen = rockClimbEntry.routeName
                gradeOnScreen = rockClimbEntry.grade
                venueNameOnScreen = rockClimbEntry.venueName
                dateOnScreen = rockClimbEntry.date
                partnersOnScreen = rockClimbEntry.partners
                climbingStyleOnScreen = rockClimbEntry.climbingStyle
            }
            
        }
        
        //arrange
        
        let mockDatabaseService = MockDatabaseService()
        let mockShowLogbookDetailScreen = MockShowLogbookDetailScreen()
        let routeNameEntered: String = "I am a mockDatabaseService randomRouteName" + String(describing: Int.random(in: 200..<300))
                      
        let climbId = mockDatabaseService.addRockClimbToDb(routeName: routeNameEntered, grade: "", venueName: "", date: "", partners: "", climbingStyle: "")
        
        //act
        _ = ShowLogbookDetailViewModel(mockDatabaseService, idOfRockClimbReceived: climbId, showLogbookDetailScreen: mockShowLogbookDetailScreen)
        
        let expectedResult = routeNameEntered
        let actualResult = mockShowLogbookDetailScreen.routeNameOnScreen
        //assert
        XCTAssertEqual(actualResult, expectedResult, "the Rock Climb detail exists in MockLogbookShowDetailScreen")
    }
    
}
