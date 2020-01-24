//
//  MockScreenNavigationController.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 28/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

public var logARockClimbScreenExists: Bool = false

public var logbookScreenExists: Bool = false

public var loggedRockClimbDataScreenExists: Bool = false

public var showLogbookDetailScreenExists: Bool = false


class MockScreenNavigationController: ScreenNavigationController {
    
    public var loggedRockClimbId: Int64 = -2000
    
    func displayLogARockClimbScreen() {
        logARockClimbScreenExists = true
    }
    
    func displayLogbookScreen() {
        logbookScreenExists = true
    }
    
    func displayLogbookDetailScreen() {
        showLogbookDetailScreenExists = true
    }

    func displayLoggedRockClimbDataScreen(_ loggedRockClimbId: Int64) {
        loggedRockClimbDataScreenExists = true
        self.loggedRockClimbId = loggedRockClimbId
    }
}
