//
//  DatabaseService.swift
//  BMG
//
//  Created by Andrew Wilson-Jones on 18/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import SQLite

class SQLiteDbService {
    
    static let dbInstance = SQLiteDbService()
    
    private var db : Connection?
    
    private let rockClimbs = Table("rockClimbs")
    private let id = Expression<Int64>("id")
    private let routeName = Expression<String?>("routeName")
    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        
        do {
            db = try Connection("\(path)/BMGDB.sqlite3")
            print("Database location: " + path)
        } catch {
            db = nil
            print ("Unable to open database")
        }
        
        createTable()
    }
    
    func createTable() {
        do {
            try db!.run(rockClimbs.create(ifNotExists: true) { table in
                table.column(id, primaryKey: true)
                table.column(routeName)
                
            })
        } catch {
            print("Unable to create table")
        }
    }
    
    func addRockClimb(crouteName: String) -> Int64? {
        do {
            let insert = rockClimbs.insert(routeName <- crouteName)
            let rowid = try db!.run(insert)
            print(insert.asSQL())
            
            for rockClimb in try db!.prepare(rockClimbs) {
                print("id: \(rockClimb[id]), routeName: \(String(describing: rockClimb[routeName]))")
            }
            return rowid

        } catch {
            print("Insert failed")
            return -1
        }
        
      
    }
    
    
    
    
}










