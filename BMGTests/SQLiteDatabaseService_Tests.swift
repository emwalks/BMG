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
        
        let actualResult = sqliteDatabaseService.addRockClimbToDb(routeName: routeNameEntered)
        
        let expectedResult = sqliteDatabaseService.rowid
        
        XCTAssertEqual(expectedResult, actualResult)

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



