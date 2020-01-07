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
                try database.run(rockClimbTable.create(ifNotExists: true){
                table in
                table.column(loggedRockClimbId, primaryKey: true)
                table.column(loggedRouteName)
                table.column(loggedGrade)
           })
        } catch {
            print("Unable to create table")
        }
    }
    
    func addRockClimbToDb(routeName: String, grade: String, venueName: String, date: String, partners: String) -> Int64 {
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
    
    func getRockClimbDataFromDb(idOfRockClimb: Int64) -> RockClimbEntry {
        do {
            let query = rockClimbTable.filter(loggedRockClimbId == idOfRockClimb)
            for rockClimb in try database.prepare(query) {
                let routeName = String(describing: rockClimb[loggedRouteName]!)
                let rockClimbEntryFromDB = RockClimbEntry.init(routeName: routeName, grade: "", venueName: "", date: "", partners: "", climbingStyle: "")
                return rockClimbEntryFromDB
            }
            
        } catch {
            return RockClimbEntry.init(
                routeName: "getRockClimbDataFromDb query failed",
                grade: "getRockClimbDataFromDb query failed",
                venueName: "getRockClimbDataFromDb query failed",
                date: "getRockClimbDataFromDb query failed",
                partners: "getRockClimbDataFromDb query failed",
                climbingStyle: "getRockClimbDataFromDb query failed")
        }
        return RockClimbEntry.init(
            routeName: "an error has occured in getRockClimbDataFromDb function",
            grade: "an error has occured in getRockClimbDataFromDb function",
            venueName: "an error has occured in getRockClimbDataFromDb function",
            date: "an error has occured in getRockClimbDataFromDb function",
            partners: "an error has occured in getRockClimbDataFromDb function",
            climbingStyle: "an error has occured in getRockClimbDataFromDb function")
    }
        
}
