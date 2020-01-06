//
//  SQLiteDatabaseService.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 22/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import SQLite

class SQLiteDatabaseService: DatabaseService {
    
    let database: Connection
    
    var rockClimbTable:Table = Table("rockClimbTable")
    let loggedRockClimbId = Expression<Int64>("loggedRockClimbId")
    let loggedRouteName = Expression<String?>("loggedRouteName")
    let loggedGrade = Expression<String?>("loggedGrade")
    var rowid:Int64 = -4000
    
    init(_ db: Connection) {
        database = db
        
        do {
            try database.run(rockClimbTable.create(){
                table in
                table.column(loggedRockClimbId, primaryKey: true)
                table.column(loggedRouteName)
                table.column(loggedGrade)
           })
        } catch {
            print("Unable to create table")
        }
    }
    
    func addRockClimbToDb(routeName: String, grade: String) -> Int64 {
        do {
            let insert = rockClimbTable.insert(loggedRouteName <- routeName, loggedGrade <- grade)
            rowid = try database.run(insert)
            
            for rockClimb in try database.prepare(rockClimbTable) {
                print("id: \(rockClimb[loggedRockClimbId]), routeName: \(String(describing: rockClimb[loggedRouteName])), grade: \(String(describing: rockClimb[loggedGrade]))")
            }
            return rowid
        } catch {
            print("Insert failed")
            return -1000
        }
        
    }
    
    func getRockClimbDataFromDb(idOfRockClimb: Int64) -> String {
        do {
            let query = rockClimbTable.filter(loggedRockClimbId == idOfRockClimb)
            for rockClimb in try database.prepare(query) {
                return String(describing: (rockClimb[loggedRouteName]!)) }
        } catch {
            return "getRockClimbDataFromDb query failed"
        }
        return "an error has occured in getRockClimbDataFromDb function "
    }
    
    
}
