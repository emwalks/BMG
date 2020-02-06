//
//  MockLogbookScreen.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 17/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockLogbookScreen: LogbookScreenProtocol {
    
    func thereAreThisManyRows(count: Int) {
        
    }
    
    func addObserver(obs: LogbookScreenProtocolListener) {
        
    }
    
    
    //optionals for test purposes only?
    public var routeNameOnScreen: String? = nil
    public var gradeOnScreen: String? = nil
    public var venueNameOnScreen: String? = nil
    public var dateOnScreen: String? = nil
    public var partnersOnScreen: String? = nil
    public var climbingStyleOnScreen: String? = nil
    
    public var arrayOfRockClimbs: Array<RockClimbEntry> = []
    
    public var tableOfLoggedClimbs: Bool = false
    
    func allRockClimbDataPresented(arrayOfRockClimbs: Array<RockClimbEntry>) {
        arrayOfRockClimbs.forEach {
            routeNameOnScreen = $0.routeName;
            gradeOnScreen = $0.grade;
            venueNameOnScreen = $0.venueName;
            dateOnScreen = $0.date;
            partnersOnScreen = $0.partners;
            climbingStyleOnScreen = $0.climbingStyle
        }
        tableOfLoggedClimbs = true
    }
    
}
