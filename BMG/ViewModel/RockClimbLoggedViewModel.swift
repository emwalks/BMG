//
//  RockClimbLoggedViewModel.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 29/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

protocol RockClimbLoggedViewModelDelegate {
    func presentData(route: NSAttributedString, grade: NSAttributedString, venue: NSAttributedString, date: NSAttributedString, partners: NSAttributedString, style: NSAttributedString)
}


class RockClimbLoggedViewModel {
    
    var idOfRockClimbReceived: Int64 = -1
    var databaseService: DatabaseService
    var delegate: RockClimbLoggedViewModelDelegate?

    init(_ databaseService: DatabaseService, idOfRockClimbReceived: Int64) {
        self.databaseService = databaseService
        self.idOfRockClimbReceived = idOfRockClimbReceived
    }
    
    func getRockClimbData() {
        let rockClimbEntry = databaseService.getRockClimbDataFromDb(idOfRockClimb: idOfRockClimbReceived)
        let routeNameFromDb = rockClimbEntry.routeName
        let gradeFromDb = rockClimbEntry.grade
        let venueNameFromDb = rockClimbEntry.venueName
        let dateFromDb = rockClimbEntry.date
        let partnersFromDb = rockClimbEntry.partners
        let climbingStyleFromDb = rockClimbEntry.climbingStyle
        let routeNamePresented = NSAttributedString(string: " Route Name: \(routeNameFromDb)")
        let gradePresented = NSAttributedString(string: " Grade: \(gradeFromDb)")
        let venueNamePresented = NSAttributedString(string: " Venue: \(venueNameFromDb)")
        let datePresented = NSAttributedString(string: " Date: \(dateFromDb)")
        let partnersPresented = NSAttributedString(string: " Partners: \(partnersFromDb)")
        let climbingStylePresented = NSAttributedString(string: " Style: \(climbingStyleFromDb)")
        delegate?.presentData(route: routeNamePresented, grade: gradePresented, venue: venueNamePresented, date: datePresented, partners: partnersPresented, style: climbingStylePresented)

    }
        
}



    

