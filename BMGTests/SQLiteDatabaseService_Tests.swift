//
//  SQLiteDbServiceTests.swift
//  BMGTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 22/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest
import SQLite

class SQLiteDatabaseServiceTests: XCTestCase {
    
    var dbDirectoryString: String = ""
    var db: Connection? = nil
    
    override func setUp() {
        super.setUp()
        
        dbDirectoryString = createDbDirectoryForTesting()
        db = SQLiteDatabaseServiceFactory.createDB(dbDirectoryString)
    }
    
    func createDbDirectoryForTesting() -> String {
        let appDocumetDirectory = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true).first!
        
        let appDocumetDirectoryURL = URL(string: appDocumetDirectory)!
        let randomNumber: Int = Int.random(in: 1..<100)
        return appDocumetDirectoryURL.appendingPathComponent("\(randomNumber)").absoluteString
        
    }

    func testThatWhenCreateDBIsCalledADatabaseIsCreated() {
       
        XCTAssertTrue(db != nil, "The database is not nil")
    }
    
    func testWhenARockClimbIsAddedTheIdIsReturned(){
        
        let routeNameEntered = "Highflyer"
        let sqliteDatabaseService = SQLiteDatabaseService(db!)
        
        let actualResult = sqliteDatabaseService.addRockClimbToDb(routeName: routeNameEntered, grade: "", venueName: "", date: "", partners: "", climbingStyle: "")
        
        let expectedResult = sqliteDatabaseService.rowid
        
        XCTAssertEqual(expectedResult, actualResult)

    }
    
    func testWhenMockScreenNavigationControllerIsCalledTheRockClimbIdGetsPassedToItFromRealDb() {
        
        let sqliteDatabaseService = SQLiteDatabaseService(db!)
        
        let enteredRouteName = "Bergweg"
        let idAssignedInLogRockClimbViewModel = sqliteDatabaseService.addRockClimbToDb(routeName: enteredRouteName, grade: "", venueName: "", date: "", partners: "", climbingStyle: "")
        
        let expectedResult = sqliteDatabaseService.returnRockClimbIdPK()
        let actualResult = idAssignedInLogRockClimbViewModel
        
        XCTAssertEqual(expectedResult, actualResult, "id has been passed to Mock Screen Navigation Controller from SQLiteDBService")
    }
    
    func testWhenIdIsPassedToDBServiceTheRouteNameIsReturned() {
        let routeNameEntered = "Huebere"
        let sqliteDatabaseService = SQLiteDatabaseService(db!)
        let idCorrespondingToRouteNameEntered = sqliteDatabaseService.addRockClimbToDb(routeName: routeNameEntered, grade: "", venueName: "", date: "", partners: "", climbingStyle: "")
        
        let actualResult = sqliteDatabaseService.getRockClimbDataFromDb(idOfRockClimb: idCorrespondingToRouteNameEntered).routeName
        let expectedResult = routeNameEntered
        
        XCTAssertEqual(expectedResult, actualResult, "Route name has been returned based on id")
        
    }
    
    func testWhenIdIsPassedToDBServiceTheGradeIsReturned() {

        let gradeEntered: String = Grades.adjectivalGrades.randomElement()! + " " + Grades.technicalGrades.randomElement()!
        let sqliteDatabaseService = SQLiteDatabaseService(db!)

        let idCorrespondingToRockClimbEntered = sqliteDatabaseService.addRockClimbToDb(routeName: "", grade: gradeEntered, venueName: "", date: "", partners: "", climbingStyle: "")

        let actualResult = sqliteDatabaseService.getRockClimbDataFromDb(idOfRockClimb: idCorrespondingToRockClimbEntered).grade
        
        XCTAssertEqual(gradeEntered, actualResult, "Grade of climb has been returned based on id")
           
       }
    
    func testWhenIdIsPassedToDBServiceTheVenueIsReturned() {

        let venueNameEntered: String = "randomVenueName" + String(describing: Int.random(in: 300..<400))
        let sqliteDatabaseService = SQLiteDatabaseService(db!)

        let idCorrespondingToRockClimbEntered = sqliteDatabaseService.addRockClimbToDb(routeName: "", grade: "", venueName: venueNameEntered, date: "", partners: "", climbingStyle: "")

        let actualResult = sqliteDatabaseService.getRockClimbDataFromDb(idOfRockClimb: idCorrespondingToRockClimbEntered).venueName
        
        XCTAssertEqual(venueNameEntered, actualResult, "Venue of climb has been returned based on id")
           
       }
    
    func testWhenIdIsPassedToDBServiceTheDateIsReturned() {

    let dateEntered: String = "07/01/2020"
        
     let sqliteDatabaseService = SQLiteDatabaseService(db!)

     let idCorrespondingToRockClimbEntered = sqliteDatabaseService.addRockClimbToDb(routeName: "", grade: "", venueName: "", date: dateEntered, partners: "", climbingStyle: "")

     let actualResult = sqliteDatabaseService.getRockClimbDataFromDb(idOfRockClimb: idCorrespondingToRockClimbEntered).date
     
     XCTAssertEqual(dateEntered, actualResult, "Venue of climb has been returned based on id")
        
    }
    
    func testWhenIdIsPassedToDBServiceThePartnersIsReturned() {

    let partnersEntered: String = "randomPartners" + String(describing: Int.random(in: 300..<400))
        
     let sqliteDatabaseService = SQLiteDatabaseService(db!)

     let idCorrespondingToRockClimbEntered = sqliteDatabaseService.addRockClimbToDb(routeName: "", grade: "", venueName: "", date: "", partners: partnersEntered, climbingStyle: "")

     let actualResult = sqliteDatabaseService.getRockClimbDataFromDb(idOfRockClimb: idCorrespondingToRockClimbEntered).partners
     
     XCTAssertEqual(partnersEntered, actualResult, "Climbing partner has been returned based on id")
        
    }
    
    func testWhenIdIsPassedToDBServiceTheClimbingStyleIsReturned() {

    let climbingStyleEntered: String = "I am a mockDatabaseService climbStyle" + String(describing: Int.random(in: 300..<400))
        
     let sqliteDatabaseService = SQLiteDatabaseService(db!)

     let idCorrespondingToRockClimbEntered = sqliteDatabaseService.addRockClimbToDb(routeName: "", grade: "", venueName: "", date: "", partners: "", climbingStyle: climbingStyleEntered)

     let actualResult = sqliteDatabaseService.getRockClimbDataFromDb(idOfRockClimb: idCorrespondingToRockClimbEntered).climbingStyle
     
     XCTAssertEqual(climbingStyleEntered, actualResult, "Climbing style has been returned based on id")
        
    }
    
    func testWhenGetAllRockClimbDataFromDbIsCalledAnArrayOfRockClimbEntriesIsReturned() {
        
        //arrange
        let sqliteDatabaseService = SQLiteDatabaseService(db!)
        
        let routeNameEntered:String = "randomRouteName" + String(describing: Int.random(in: 0..<100))
        let gradeSelected = "VD 7b"
        let venueNameEntered:String = "randomVenueName" + String(describing: Int.random(in: 0..<100))
        let dateSelected = "31/01/2020"
        let partnersEntered:String = "randomPartner" + String(describing: Int.random(in: 0..<100))
        let climbingStyleSelected:String = "Alternate"
        
        sqliteDatabaseService.addRockClimbToDb(routeName: routeNameEntered, grade: gradeSelected, venueName: venueNameEntered, date: dateSelected, partners: partnersEntered, climbingStyle: climbingStyleSelected)
        
        //act
        let actualResult = sqliteDatabaseService.getAllRockClimbDataFromDb()
        let expectedResult = [RockClimbEntry.init(routeName: routeNameEntered, grade: gradeSelected, venueName: venueNameEntered, date: dateSelected, partners: partnersEntered, climbingStyle: climbingStyleSelected)]
        
        //assert
        XCTAssertEqual(actualResult, expectedResult)
     }

    
    override func tearDown() {
        
        func deleteDatabase(filePath : String)
        {
            let fileManager = FileManager.default
            do {
                //close the db here?
                try fileManager.removeItem(atPath: filePath)
                print("Database Deleted")
            } catch {
                print("Error on Delete Database")
            }
        }
        
        deleteDatabase(filePath: "\(dbDirectoryString)")
        super.tearDown()
    }
    
}

//left as an extension for testing of db service, as actual implementation is by querying id (func getRockClimbDataFromDb)
extension SQLiteDatabaseService {
        
    func returnRockClimbIdPK() -> Int64 {
        do {
            for rockClimb in try database.prepare(rockClimbTable) {
              return rockClimb[loggedRockClimbId]
            }
            
        } catch {
            print("Query failed")
            return -1000
            
        }
        print("An error has occured during returnRockClimbIdPK function execution")
        return -4000
    }
    
}



