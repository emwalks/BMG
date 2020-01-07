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
    public var loggedPartnersName: String = ""
    public var loggedClimbingStyle: String = ""
    
    
    func addRockClimbToDb (routeName: String, grade: String, venueName: String) -> Int64 {
        loggedRouteName = routeName
        loggedClimbGrade = grade
        loggedRockClimbId = Int64.random(in: 100..<200)
        loggedVenueName = venueName
        return loggedRockClimbId

    }
    
    
    func getRockClimbDataFromDb(idOfRockClimb: Int64) -> RockClimbEntry {
         if loggedRockClimbId == idOfRockClimb {
                   let rockClimbEntry = RockClimbEntry.init(routeName: loggedRouteName, grade: loggedClimbGrade, venueName: loggedVenueName, date: loggedDate, partnersName: loggedPartnersName, climbingStyle: loggedClimbingStyle)
                   return rockClimbEntry
               } else {
                   let errorString = "Climb id not found"
                   let errorStruct = RockClimbEntry.init(routeName: errorString, grade: errorString, venueName: errorString, date: errorString, partnersName: errorString, climbingStyle: errorString)
                   return  errorStruct
               }
    }
    
}
