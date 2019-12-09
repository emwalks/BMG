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

    func testThatWhenAddRockClimbFucntionIsCalledRouteNameGetsAdded() {
        
        let routeNameEntered = "Blue-Eyes"
        let sqliteDatabaseService = SQLiteDatabaseService(db!)
        sqliteDatabaseService.addRockClimbToDb(routeName: routeNameEntered)
        
        let routeNameReturned = sqliteDatabaseService.returnRockClimbRouteName()

        let actualResult = routeNameReturned
        let expectedResult = routeNameEntered
        
        XCTAssertEqual(expectedResult, actualResult)
    }
    
    func testWhenARockClimbIsAddedTheIdIsReturned(){
        
        let routeNameEntered = "Highflyer"
        let sqliteDatabaseService = SQLiteDatabaseService(db!)
        
        let actualResult = sqliteDatabaseService.addRockClimbToDb(routeName: routeNameEntered)
        
        let expectedResult = sqliteDatabaseService.rowid
        
        XCTAssertEqual(expectedResult, actualResult)

    }
    
    func testWhenMockScreenNavigationControllerIsCalledTheRockClimbIdGetsPassedToItFromRealDb() {
        
        let sqliteDatabaseService = SQLiteDatabaseService(db!)
        
        let enteredRouteName = "Bergweg"
        let idAssignedInLogRockClimbViewModel = sqliteDatabaseService.addRockClimbToDb(routeName: enteredRouteName)
        
        let expectedResult = sqliteDatabaseService.returnRockClimbIdPK()
        let actualResult = idAssignedInLogRockClimbViewModel
        
        XCTAssertEqual(expectedResult, actualResult, "id has been passed to Mock Screen Navigation Controller from SQLiteDBService")
    }
    
    func testWhenIdIsPassedToDBServiceTheRouteNameIsReturned() {
        let routeNameEntered = "Huebere"
        let sqliteDatabaseService = SQLiteDatabaseService(db!)
        let idCorrespondingToRouteNameEntered = sqliteDatabaseService.addRockClimbToDb(routeName: routeNameEntered)
        
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



