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
        
        db = createDB()
        
        XCTAssertTrue(db != nil, "The database is not nil")
    }
    
    var rockClimbTable:Table = Table("rockClimbTable")
    let id = Expression<Int64>("id")
    let loggedRouteName = Expression<String?>("loggedRouteName")
    
    func createRockClimbTable () -> Bool {
        do {
            db = createDB()
            try db!.run(rockClimbTable.create(ifNotExists: true){
                table in
                table.column(id, primaryKey: true)
                table.column(loggedRouteName)
            })
            return true
        } catch {
            print("Unable to create table")
            return false
        }
    }
    
    func testThatWhenCreateTableIsCalledATableIsCreated() {
        
        let resultOfCreateTableFunction = createRockClimbTable()
        
        XCTAssertEqual(resultOfCreateTableFunction, true, "a rockClimbTable has been created in db" )
    }
    
    let routeNameEntered = "Jean Jeanie"
    
    func addRockClimbToDb(routeName: String) -> Bool {
        do {
            db = createDB()
            try db!.run(rockClimbTable.insert(loggedRouteName <- routeName))
            return true
        } catch {
            print("Insert failed")
            return false
        }
    }
    
    func testThatWhenAddRockClimbIsCalledRouteNameGetsAdded() {
        
        createRockClimbTable()
        
        let resultOfAddRockClimb = addRockClimbToDb(routeName: routeNameEntered)
        
        XCTAssertEqual(resultOfAddRockClimb, true, "a routeName row has been added" )
    }
    
    func testWhenReturnARockClimbIsCalledRouteNameIsReturn() {

        createRockClimbTable()
        addRockClimbToDb(routeName: routeNameEntered)

        func returnRockClimb() -> String {
            do {
                db = createDB()
                for rockClimb in try db!.prepare(rockClimbTable) {
                    return "\(String(describing: rockClimb[loggedRouteName]))"
                }
                
            } catch {
                print("Insert failed")
                return "Insert failed"
            }
            return "out of scope"
        }


        let actualResult = returnRockClimb()
        
        XCTAssertEqual(routeNameEntered, actualResult)
    }

   
    
    override class func tearDown() {

        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!

        func deleteDatabase(filePath : String)
        {
            let fileManager = FileManager.default
            do {

                try fileManager.removeItem(atPath: filePath)
                print("Database Deleted!")
            } catch {
                print("Error on Delete Database!")
            }
        }

        deleteDatabase(filePath: path)
        super.tearDown()
    }

}


