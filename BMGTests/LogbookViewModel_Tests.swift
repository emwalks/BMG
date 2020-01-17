//
//  MyLogbookViewModel_Tests.swift
//  BMGTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 14/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class LogbookViewModel_Tests: XCTestCase {
    
    class MockLogbookViewModel {
             
             var databaseService: DatabaseService
             var mockLogbookScreen: MockLogbookScreen
             
             init(_ databaseService: DatabaseService, logbookScreen: MockLogbookScreen) {
                 self.databaseService = databaseService
                 self.mockLogbookScreen = logbookScreen
                 retrieveAllRockClimbData()
             }
             
             func retrieveAllRockClimbData() {
                 let rockClimbDataArrayReceived = databaseService.getAllRockClimbDataFromDb()
                 mockLogbookScreen.allRockClimbDataPresented(arrayOfRockClimbs: rockClimbDataArrayReceived)
             }
             
         }
         
         class MockLogbookScreen {
             
            //optiopnals for test purposes only?
             public var routeNameOnScreen: String? = nil
             public var gradeOnScreen: String? = nil
             public var venueNameOnScreen: String? = nil
             public var dateOnScreen: String? = nil
             public var partnersOnScreen: String? = nil
             public var climbingStyleOnScreen: String? = nil
             
             public var arrayOfRockClimbs: Array<RockClimbEntry> = []
             
             public var tableOfLoggedClimbs: Bool = false
             
             func allRockClimbDataPresented(arrayOfRockClimbs: Array<RockClimbEntry>) {
                arrayOfRockClimbs.forEach {
                     (routeNameOnScreen = $0.routeName,
                     gradeOnScreen = $0.grade,
                     venueNameOnScreen = $0.venueName,
                     dateOnScreen = $0.date,
                     partnersOnScreen = $0.partners,
                     climbingStyleOnScreen = $0.climbingStyle)
                 }
                 tableOfLoggedClimbs = true
             }
             
         }
    
    func testThatWhenLogbookScreenIsPresentedATableOfLoggedClimbsIsDisplayed(){
    
        //arrange
        
        let mockDatabaseService = MockDatabaseService()
        let mockLogbookScreen = MockLogbookScreen()
        
        //act
        _ = MockLogbookViewModel(mockDatabaseService, logbookScreen: mockLogbookScreen)
        
        let actualResult = mockLogbookScreen.tableOfLoggedClimbs
        
        //assert
        XCTAssertEqual(actualResult, true, "the table of Rock Climbs exists in MockMyLogbookScreen")
    }
    
     func testThatWhenLogbookScreenIsPresentedTheLoggedClimbRouteNamesAreDisplayed(){
        
        //arrange
        
        let mockDatabaseService = MockDatabaseService()
        let mockLogbookScreen = MockLogbookScreen()
        
        //act
        _ = MockLogbookViewModel(mockDatabaseService, logbookScreen: mockLogbookScreen)
        print(mockLogbookScreen.routeNameOnScreen!)
        //assert
        XCTAssertNotNil(mockLogbookScreen.routeNameOnScreen)
    }
    
}
