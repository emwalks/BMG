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
    let loggedVenueName = Expression<String?>("loggedVenueName")
    let loggedDate = Expression<String?>("loggedDate")
    let loggedPartners = Expression<String?>("loggedPartners")
    let loggedClimbingStyle = Expression<String?>("loggedClimbingStyle")



    var rowid:Int64 = -4000
    
    init(_ db: Connection) {
        database = db
        
        do {
            try database.run(rockClimbTable.create(ifNotExists: true){
                table in
                table.column(loggedRockClimbId, primaryKey: true)
                table.column(loggedRouteName)
                table.column(loggedGrade)
                table.column(loggedVenueName)
                table.column(loggedDate)
                table.column(loggedPartners)
                table.column(loggedClimbingStyle)
            })
        } catch {
            print("Unable to create table")
        }
    }
    
    func addRockClimbToDb(routeName: String, grade: String, venueName: String, date: String, partners: String, climbingStyle: String) -> Int64 {
        do {
            let insert = rockClimbTable.insert(
                loggedRouteName <- routeName,
                loggedGrade <- grade,
                loggedVenueName <- venueName,
                loggedDate <- date,
                loggedPartners <- partners,
                loggedClimbingStyle <- climbingStyle
            )
            rowid = try database.run(insert)
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
                let grade = String(describing: rockClimb[loggedGrade]!)
                let venueName = String(describing: rockClimb[loggedVenueName]!)
                let date = String(describing: rockClimb[loggedDate]!)
                let partners = String(describing: rockClimb[loggedPartners]!)
                let climbingStyle = String(describing: rockClimb[loggedClimbingStyle]!)
                let rockClimbEntryFromDB = RockClimbEntry.init(routeName: routeName, grade: grade, venueName: venueName, date: date, partners: partners, climbingStyle: climbingStyle)
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
