//
//  MockLogbookScreen.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 17/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockLogbookScreen: LogbookScreenProtocol {

  
    //optionals for test purposes only?
    public var routeNameOnScreen: String? = nil
    public var gradeOnScreen: String? = nil
    public var venueNameOnScreen: String? = nil
    public var dateOnScreen: String? = nil
    public var partnersOnScreen: String? = nil
    public var climbingStyleOnScreen: String? = nil
    
    public var arrayOfRockClimbs: Array<RockClimbEntry> = []
    
    public var tableOfLoggedClimbs: Bool = false
    
    var logbookViewModel: LogbookViewModel?
    
    init(logbookViewModel: LogbookViewModel) {
        self.logbookViewModel = logbookViewModel
        arrayOfRockClimbs = logbookViewModel.retrieveAllRockClimbData()
        if !arrayOfRockClimbs.isEmpty {
            tableOfLoggedClimbs = true
            routeNameOnScreen = arrayOfRockClimbs[0].routeName
            gradeOnScreen = arrayOfRockClimbs[0].grade
            venueNameOnScreen = arrayOfRockClimbs[0].venueName
            dateOnScreen = arrayOfRockClimbs[0].date
            partnersOnScreen = arrayOfRockClimbs[0].partners
            climbingStyleOnScreen = arrayOfRockClimbs[0].climbingStyle
        }
      }
    

    
}
