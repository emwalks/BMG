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
    
    func getRockClimbDataFromDb(idOfRockClimb: Int) {
        //to fulfil protocol requirement
    }
    

    
    let database: Connection
    
    var rockClimbTable:Table = Table("rockClimbTable")
    let loggedRockClimbId = Expression<Int64>("loggedRockClimbId")
    let loggedRouteName = Expression<String?>("loggedRouteName")
    
    init(_ db: Connection) {
        database = db
        
        do {
            try database.run(rockClimbTable.create(ifNotExists: true){
                table in
                table.column(loggedRockClimbId, primaryKey: true)
                table.column(loggedRouteName)
            })
        } catch {
            print("Unable to create table")
        }
    }
    
    func addRockClimbToDb(routeName: String) -> Int {
        do {
            try database.run(rockClimbTable.insert(loggedRouteName <- routeName))
        } catch {
            print("Insert failed")
        }
        //to conform to protocol
        return -1000
    }
}
