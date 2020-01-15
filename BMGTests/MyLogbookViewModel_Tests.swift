//
//  MyLogbookViewModel_Tests.swift
//  BMGTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 14/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class MyLogbookViewModel_Tests: XCTestCase {
    
    func testThatWhenLogbookScreenIsPresentedTheLoggedClimbDataIsDisplayed(){
        
        class MockLogbookViewModel {
            
            var databaseService: DatabaseService
            var mockLogbookScreen: MockLogbookScreen
            
            init(_ databaseService: DatabaseService, logbookScreen: MockLogbookScreen) {
                self.databaseService = databaseService
                self.mockLogbookScreen = logbookScreen
                retrieveAllRockClimbData()
            }
            
            func retrieveAllRockClimbData() {
                databaseService.getAllRockClimbDataFromDb()
                mockLogbookScreen.allRockClimbDataPresented()
            }
            
        }
        
        class MockLogbookScreen {
            
            public var tableOfLoggedClimbs: Bool = false
            
            func allRockClimbDataPresented() {
                tableOfLoggedClimbs = true
            }
            
        }
        
        //arrange
       
        let mockDatabaseService = MockDatabaseService()
        let mockLogbookScreen = MockLogbookScreen()
        
        let mockLogbookViewModel = MockLogbookViewModel(mockDatabaseService, logbookScreen: mockLogbookScreen)
        
        //act
        mockLogbookViewModel.retrieveAllRockClimbData()
        
        let actualResult = mockLogbookScreen.tableOfLoggedClimbs
        
        //assert
        XCTAssertEqual(actualResult, true, "the table of Rock Climbs exists in MockMyLogbookScreen")
    }
    
}
