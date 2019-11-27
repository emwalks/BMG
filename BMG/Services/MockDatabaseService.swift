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
    public var loggedRockClimbId: Int = -1
    
    func addRockClimbToDb (routeName: String) {
        loggedRouteName = routeName
    }
    
    func returnRockClimbFromDb (rockClimbId: Int) {
        loggedRockClimbId = rockClimbId
    }
}
