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
    public var loggedRockClimbId: Int = -5
    
    func addRockClimbToDb (routeName: String) -> Int {
        loggedRouteName = routeName
        loggedRockClimbId = Int.random(in: 100..<200)
        return loggedRockClimbId
    }
    
    func getRockClimbDataFromDb(idOfRockClimb: Int) {
        loggedRockClimbId = idOfRockClimb
    }

}
