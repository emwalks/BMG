//
//  MockDatabaseService.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockDatabaseService: DatabaseService {
    
    public struct RockClimbEntry {
        
        let routeName:String
        let grade:String
        let venueName:String
        let date: String
        let partnersName:String
        let climbingStyle:String
        
    }

    public var loggedRouteName: String = ""
    public var loggedRockClimbId: Int64 = -5
    public var loggedClimbGrade: String = ""
    public var loggedVenueName: String = ""
    public var loggedDate: String = "01/01/1970"
    public var loggedPartnersName: String = ""
    public var loggedClimbingStyle: String = ""
    
    
    func addRockClimbToDb (routeName: String, grade: String) -> Int64 {
        loggedRouteName = routeName
        loggedClimbGrade = grade
        loggedRockClimbId = Int64.random(in: 100..<200)
        return loggedRockClimbId

    }
    
    func getRockClimbDataFromDb(idOfRockClimb: Int64) -> String {

            if loggedRockClimbId == idOfRockClimb {
               let rockClimbEntry = RockClimbEntry.init(routeName: loggedRouteName, grade: loggedClimbGrade, venueName: loggedVenueName, date: loggedDate, partnersName: loggedPartnersName, climbingStyle: loggedClimbingStyle)
                return rockClimbEntry.routeName
            } else {
                return "Climb id not found"}
    }
}
