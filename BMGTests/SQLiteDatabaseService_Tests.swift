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

    func testThatWhenAddRockClimbFunctionIsCalledRouteNameGetsAdded() {
        
        let routeNameEntered = "Blue-Eyes"
        let sqliteDatabaseService = SQLiteDatabaseService(db!)
        
        sqliteDatabaseService.addRockClimbToDb(routeName: routeNameEntered, grade: "")
        
        let routeNameReturned = sqliteDatabaseService.returnRockClimbRouteName()
        
        XCTAssertEqual(routeNameEntered, routeNameReturned)
    }
    
    func testThatWhenAddRockClimbFunctionIsCalledGradeGetsAdded() {

        let routeNameEntered: String = "randomRouteName" + String(describing: Int.random(in: 0..<200))
        let gradeEntered: String = Grades.adjectivalGrades.randomElement()! + " " + Grades.technicalGrades.randomElement()!
        let sqliteDatabaseService = SQLiteDatabaseService(db!)

        sqliteDatabaseService.addRockClimbToDb(routeName: routeNameEntered, grade: gradeEntered)

        let gradeReturned = sqliteDatabaseService.returnRockClimbGrade()

        XCTAssertEqual(gradeEntered, gradeReturned)
    }
    
    func testWhenARockClimbIsAddedTheIdIsReturned(){
        
        let routeNameEntered = "Highflyer"
        let sqliteDatabaseService = SQLiteDatabaseService(db!)
        
        let actualResult = sqliteDatabaseService.addRockClimbToDb(routeName: routeNameEntered, grade: "")
        
        let expectedResult = sqliteDatabaseService.rowid
        
        XCTAssertEqual(expectedResult, actualResult)

    }
    
    func testWhenMockScreenNavigationControllerIsCalledTheRockClimbIdGetsPassedToItFromRealDb() {
        
        let sqliteDatabaseService = SQLiteDatabaseService(db!)
        
        let enteredRouteName = "Bergweg"
        let idAssignedInLogRockClimbViewModel = sqliteDatabaseService.addRockClimbToDb(routeName: enteredRouteName, grade: "")
        
        let expectedResult = sqliteDatabaseService.returnRockClimbIdPK()
        let actualResult = idAssignedInLogRockClimbViewModel
        
        XCTAssertEqual(expectedResult, actualResult, "id has been passed to Mock Screen Navigation Controller from SQLiteDBService")
    }
    
    func testWhenIdIsPassedToDBServiceTheRouteNameIsReturned() {
        let routeNameEntered = "Huebere"
        let sqliteDatabaseService = SQLiteDatabaseService(db!)
        let idCorrespondingToRouteNameEntered = sqliteDatabaseService.addRockClimbToDb(routeName: routeNameEntered, grade: "")
        
        let actualResult = sqliteDatabaseService.getRockClimbDataFromDb(idOfRockClimb: idCorrespondingToRouteNameEntered)
        let expectedResult = routeNameEntered
        
        XCTAssertEqual(expectedResult, actualResult, "Route name has been returned based on id")
        
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
    
    func returnRockClimbRouteName() -> String {
        do {
            for rockClimb in try database.prepare(rockClimbTable) {
                return "\(String(describing: rockClimb[loggedRouteName]!))"
            }
            
        } catch {
            print("Query failed")
            return "Query failed"
        }
        return "an error has occured during returnRockClimbRouteName function execution"
    }
    
    func returnRockClimbGrade() -> String {
        do {
            for rockClimb in try database.prepare(rockClimbTable) {
                return "\(String(describing: rockClimb[loggedGrade]!))"
            }
            
        } catch {
            print("Query failed")
            return "Query failed"
        }
        return "an error has occured during returnRockClimbRouteName function execution"
    }
    
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



