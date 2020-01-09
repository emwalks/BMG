//
//  DefaultSQLiteDataBaseService.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 26/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import SQLite

class SQLiteDatabaseServiceFactory {

    static func createDbService() -> DatabaseService {
        let appDocumetDirectory = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true).first!
        return SQLiteDatabaseService(createDB(appDocumetDirectory)!)
    }
    
    // prob shouldn't return an optional but for now needs to be for test
    static func createDB(_ dbDirectoryString: String) -> Connection? {
        var db:Connection?
        
        do {
            if !FileManager.default.fileExists(atPath: dbDirectoryString) {
                
                do {
                    try FileManager.default.createDirectory(atPath: dbDirectoryString, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    print(error.localizedDescription);
                }
            }
            
            db = try Connection("\(dbDirectoryString)/BMGDB.sqlite3")
        } catch {
            db = nil
            print("Unable to create SQLite database")
        }
        return db
    }
    
    
}

