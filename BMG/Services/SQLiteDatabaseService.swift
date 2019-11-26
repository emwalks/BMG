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
    
    init(_ db: Connection) {
        database = db
        
        do {
            try database.run(rockClimbTable.create(ifNotExists: true){
                table in
                table.column(id, primaryKey: true)
                table.column(loggedRouteName)
            })
        } catch {
            print("Unable to create table")
        }
    }
    
    var rockClimbTable:Table = Table("rockClimbTable")
    let id = Expression<Int64>("id")
    let loggedRouteName = Expression<String?>("loggedRouteName")
    
    func addRockClimbToDb(routeName: String) {
        do {
            try database.run(rockClimbTable.insert(loggedRouteName <- routeName))
        } catch {
            print("Insert failed")
        }
    }
    
}
