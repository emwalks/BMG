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
        
        class MockMyLogbookViewModel {
            
            var databaseService: DatabaseService
            
            init(_ databaseService: DatabaseService) {
                self.databaseService = databaseService
            }
            
        }
        
        class MockMyLogbookScreen {
            
            public var tableOfLoggedClimbs: Bool = false
            
        }
        
        //arrange
        //think about initialising the VC with the function calling all climb data back instead of calling a function in view did load?
        let mockDatabaseService = MockDatabaseService()
        let mockMyLogbookViewModel = MockMyLogbookViewModel(mockDatabaseService)
        
        let mockMyLogbookScreen = MockMyLogbookScreen()
        
        //act
        mockDatabaseService.getAllRockClimbData()
        let expectedResult = mockMyLogbookScreen.tableOfLoggedClimbs
        
        //assert
        XCTAssertEqual(true, expectedResult)
    }
    
}

extension MockDatabaseService {
    func getAllRockClimbData() {
        
    }
}
