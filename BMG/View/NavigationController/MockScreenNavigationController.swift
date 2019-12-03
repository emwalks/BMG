//
//  MockScreenNavigationController.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 28/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

public var loggedRockClimbDataScreenExists: Bool = false

class MockScreenNavigationController: ScreenNavigationController {
    
    public var loggedRockClimbId: Int64 = -2000
    
    func displayLoggedRockClimbDataScreen(_ loggedRockClimbId: Int64) -> Int64 {
        loggedRockClimbDataScreenExists = true
        self.loggedRockClimbId = loggedRockClimbId
        return loggedRockClimbId
    }
}
