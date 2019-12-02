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
    
    func addRockClimbToDb (routeName: String) -> Int64 {
        loggedRouteName = routeName
        loggedRockClimbId = Int64.random(in: 100..<200)
        return loggedRockClimbId
        
    }
    
    func getRockClimbDataFromDb(idOfRockClimb: Int64) {
        loggedRockClimbId = idOfRockClimb
    }

}
