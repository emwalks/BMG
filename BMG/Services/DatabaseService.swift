//
//  DatabaseService.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

protocol DatabaseService {
    
    //what should a database service do?
    //create a db if it doesn't exist
    //connect to db
    //create a table if it doesn't exist
    //add data
    //read data
    //update data
    //delete data
    
    //then every "database type e.g. mySQL, SQLite etc" will implement the DatabaseService protocol
    
    func createADatabase ()
    //should return an optional database?
    //if nil you would know it hasn't created a db?
    
    //the functions should throw an error if not executed? 
    
    func openADatabaseConnection () throws
    
    func createRockClimbingTable() throws
    
    func addRockClimbToDb (routeName: String) throws
    
    func fetchRockClimbData () throws
    
    func updateRockClimbData () throws
    
    func deleteARockClimb () throws
    
    func deleteAllRockClimbingData () throws
    
    
}
