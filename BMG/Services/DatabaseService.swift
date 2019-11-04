//
//  DatabaseService.swift
//  BMG
//
//  Created by Andrew Wilson-Jones on 18/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import SQLite

class BMGDB {
    
    static let dbInstance = BMGDB()
    
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
        } catch {
            db = nil
            print ("Unable to open database")
        }
        
        createTable()
    }
    
    func createTable() {
        do {
            try db!.run(rockClimbs.create(ifNotExists: true) { table in
                table.column(id, primaryKey: .autoincrement)
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
                print("id: \(rowid), routeName: \(String(describing: rockClimb[routeName]))")
            }
            return rowid

        } catch {
            print("Insert failed")
            return -1
        }
        
      
    }
    
    
    
    
}










