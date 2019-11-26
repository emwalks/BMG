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
    
    override func setUp() {
        super.setUp()
        let appDocumetDirectory = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true).first!
        
        let appDocumetDirectoryURL = URL(string: appDocumetDirectory)!
        let randomNumber: Int = Int.random(in: 1..<100)
        let dbDirectory = appDocumetDirectoryURL.appendingPathComponent("\(randomNumber)").absoluteString
        dbDirectoryString = dbDirectory
        
        if !FileManager.default.fileExists(atPath: dbDirectory) {
            do {
                try FileManager.default.createDirectory(atPath: dbDirectory, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription);
            }
        }
    }
    
    var db: Connection?
    
    func createDB() -> Connection? {
        do {
            db = try Connection("\(dbDirectoryString)/BMGDB.sqlite3")
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
        
        db = createDB()
        let sqliteDatabaseService = SQLiteDatabaseService(db!)
        
        let routeNameEntered = "Jomo"
        
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


