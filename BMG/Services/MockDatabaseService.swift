//
//  MockDatabaseService.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockDatabaseService: DatabaseService {

    public var loggedRouteName: String = ""
    public var loggedRockClimbId: Int64 = -5
    public var loggedClimbGrade: String = ""
    public var loggedVenueName: String = ""
    public var loggedDate: String = "01/01/1970"
    public var loggedPartners: String = ""
    public var loggedClimbingStyle: String = ""
    
    
    func addRockClimbToDb (routeName: String, grade: String, venueName: String, date: String, partners: String, climbingStyle: String) -> Int64 {
        loggedRouteName = routeName
        loggedClimbGrade = grade
        loggedRockClimbId = Int64.random(in: 100..<200)
        loggedVenueName = venueName
        loggedDate = date
        loggedPartners = partners
        loggedClimbingStyle = climbingStyle
        return loggedRockClimbId
    }
    
    
    func getRockClimbDataFromDb(idOfRockClimb: Int64) -> RockClimbEntry {
         if loggedRockClimbId == idOfRockClimb {
            let rockClimbEntry = RockClimbEntry.init(climbId: loggedRockClimbId, routeName: loggedRouteName, grade: loggedClimbGrade, venueName: loggedVenueName, date: loggedDate, partners: loggedPartners, climbingStyle: loggedClimbingStyle)
                   return rockClimbEntry
               } else {
            //Untested path, need to considered what to do when an "exception" happens
                   let errorString = "Climb id not found"
            let errorStruct = RockClimbEntry.init(climbId: 400, routeName: errorString, grade: errorString, venueName: errorString, date: errorString, partners: errorString, climbingStyle: errorString)
                   return  errorStruct
               }
    }
    
    func getAllRockClimbDataFromDb() -> Array<RockClimbEntry> {
        let stringForExampleRockClimb1 = "rock climb data in mock db service 1"
        let rockClimbEntry1 = RockClimbEntry.init(climbId: 1, routeName: stringForExampleRockClimb1, grade: stringForExampleRockClimb1, venueName: stringForExampleRockClimb1, date: stringForExampleRockClimb1, partners: stringForExampleRockClimb1, climbingStyle: stringForExampleRockClimb1)
        
        let stringForExampleRockClimb2 = "rock climb data in mock db service 2"
        let rockClimbEntry2 = RockClimbEntry.init(climbId: 2, routeName: stringForExampleRockClimb2, grade: stringForExampleRockClimb2, venueName: stringForExampleRockClimb2, date: stringForExampleRockClimb2, partners: stringForExampleRockClimb2, climbingStyle: stringForExampleRockClimb2)
        
        let arrayOfRockClimbs = [rockClimbEntry1, rockClimbEntry2]
        return arrayOfRockClimbs
    }
    
}
