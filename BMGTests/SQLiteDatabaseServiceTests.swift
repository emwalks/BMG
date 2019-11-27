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
    
    var rockClimbTable:Table = Table("rockClimbTable")
  
    let loggedRouteName = Expression<String?>("loggedRouteName")
    
    
    func returnRockClimb() -> String {
        do {
            for rockClimb in try db!.prepare(rockClimbTable) {
                return "\(String(describing: rockClimb[loggedRouteName]!))"
            }
            
        } catch {
            print("Insert failed")
            return "Insert failed"
        }
        return "an error has occured during returnRockClimb function execution"
    }
    
    
    
    func testWhenReturnARockClimbIsCalledRouteNameIsReturn() {
        
        
        let sqliteDatabaseService = SQLiteDatabaseService(db!)
        
        let randomNumber: Int = Int.random(in: 1..<100)
        let routeNameEntered = "\(randomNumber)Jomo"
        
        sqliteDatabaseService.addRockClimbToDb(routeName: routeNameEntered)
        let actualResult = returnRockClimb()
        
        XCTAssertEqual(routeNameEntered, actualResult)
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


