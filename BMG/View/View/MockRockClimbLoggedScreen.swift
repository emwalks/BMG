//
//  MockRockClimbLoggedScreen.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 04/12/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockRockClimbLoggedScreen: RockClimbLoggedScreen {
    
    public var routeNameOnScreen: String = ""
    public var gradeOnScreen: String = ""
    
    func rockClimbDataPresented(rockClimbEntry: RockClimbEntry) {
        routeNameOnScreen = rockClimbEntry.routeName
        gradeOnScreen = rockClimbEntry.grade
    }
}
