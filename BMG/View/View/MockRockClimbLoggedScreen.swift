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
    public var venueNameOnScreen: String = ""
    public var dateOnScreen: String = "01/01/1970"
    public var partnersOnScreen: String = ""
    
    func rockClimbDataPresented(rockClimbEntry: RockClimbEntry) {
        routeNameOnScreen = rockClimbEntry.routeName
        gradeOnScreen = rockClimbEntry.grade
        venueNameOnScreen = rockClimbEntry.venueName
        dateOnScreen = rockClimbEntry.date
        partnersOnScreen = rockClimbEntry.partners
    }
}
