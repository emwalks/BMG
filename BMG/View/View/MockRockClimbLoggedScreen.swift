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
    public var climbingStyleOnScreen : String = ""
    
    var rockClimbLoggedViewModel: RockClimbLoggedViewModel?
    
    init(rockClimbLoggedViewModel: RockClimbLoggedViewModel) {
        self.rockClimbLoggedViewModel = rockClimbLoggedViewModel
        rockClimbLoggedViewModel.delegate = self
        rockClimbLoggedViewModel.getRockClimbData()
    }

}

extension MockRockClimbLoggedScreen: RockClimbLoggedViewModelDelegate {
    func presentData(route: NSAttributedString, grade: NSAttributedString, venue: NSAttributedString, date: NSAttributedString, partners: NSAttributedString, style: NSAttributedString) {
        routeNameOnScreen = route.string
        gradeOnScreen = grade.string
        venueNameOnScreen = venue.string
        dateOnScreen = date.string
        partnersOnScreen = partners.string
        climbingStyleOnScreen = style.string
    }
    
    
}
