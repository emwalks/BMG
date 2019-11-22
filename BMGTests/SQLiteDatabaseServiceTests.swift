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
    
    
    //    func testWhenAddRockClimbIsCalledTheDataIsAddedToADatabase() {
    //
    //        //arrange
    //        let routeNameEntered = "Jean Jeanie"
    //        let sqliteDatabaseService = SQLiteDatabaseService()
    //
    //
    //
    //
    //        func someSQLiteFunctionThatReadsBackTheData() -> String {
    //
    //            //arrange
    //
    //            //act
    //            sqliteDatabaseService.addRockClimbToDb(routeName: routeNameEntered)
    //
    //            //assert
    //            let actualResult = someSQLiteFunctionThatReadsBackTheData()
    //            let expectedResult = routeNameEntered
    //            XCTAssertEqual(expectedResult, actualResult)
    //
    //
    //        }
    //
    //    }
    
    //to make the test above pass there is a set of conditions we need to create. Rather than making one giant test time to break into smaller pieces
    
    //arrange
    
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
        ).first!
    
    var db: Connection?
    
    func createDB() -> Connection? {
        do {
            db = try Connection("\(path)/BMGDB.sqlite3")
        } catch {
            db = nil
        }
        return db
    }
    
    func testThatWhenCreateDBIsCalledADatabaseIsCreated() {
        
        //act
        db = createDB()
        
        //assert
        XCTAssertTrue(db != nil, "The database is not nil")
    }
    
    
    func testThatWhenCreateTableIsCalledATableIsCreated() {
        
        var rockClimbTable:Table? = Table("rockClimbTable")
        let id = Expression<Int64>("id")
        
        func createTable () -> Bool {
            db = createDB()
            print("Database location: " + path)
            do {
                try db!.run(rockClimbTable!.create {
                    table in
                    table.column(id, primaryKey: true)
                })
                return true
            } catch {
                print("Unable to create table")
                return false
            }
        }
        
        let resultOfCreateTableFunction = createTable()
        
        XCTAssertTrue(resultOfCreateTableFunction == true, "a rockClimbTable has been created in db" )
    }
    
    override func tearDown() {
        
        func deleteDatabase(filePath : String)
        {
            let fileManager = FileManager.default
            do {
                
                try fileManager.removeItem(atPath: filePath)
                print("Database Deleted!")
            } catch {
                print("Error on Delete Database!!!")
            }
        }
        
        deleteDatabase(filePath: path)
    }
    
}

