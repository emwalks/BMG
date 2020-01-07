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
    
    func addRockClimbToDb (routeName: String, grade: String) -> Int64 {
        loggedRouteName = routeName
        loggedClimbGrade = grade
        loggedRockClimbId = Int64.random(in: 100..<200)
        return loggedRockClimbId

    }
    
    func getRockClimbDataFromDb(idOfRockClimb: Int64) -> String {

            if loggedRockClimbId == idOfRockClimb {
                return loggedRouteName
            } else {
                return "Climb id not found"}
    }
}
