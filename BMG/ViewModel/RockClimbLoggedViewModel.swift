//
//  RockClimbLoggedViewModel.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 29/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation


class RockClimbLoggedViewModel {
    
    var idOfRockClimbReceived: Int64 = -1
    var databaseService: DatabaseService

    init(_ databaseService: DatabaseService, idOfRockClimbReceived: Int64) {
        self.databaseService = databaseService
        self.idOfRockClimbReceived = idOfRockClimbReceived
        
    }
    
    func getRockClimbData() -> [String : NSAttributedString] {
        var rockClimbDictionary = [String : NSAttributedString]()
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
        rockClimbDictionary["routeNamePresented"] = routeNamePresented
        rockClimbDictionary["gradePresented"] = gradePresented
        rockClimbDictionary["venueNamePresented"] = venueNamePresented
        rockClimbDictionary["datePresented"] = datePresented
        rockClimbDictionary["partnersPresented"] = partnersPresented
        rockClimbDictionary["climbingStylePresented"] = climbingStylePresented
        return rockClimbDictionary
    }
        
}

protocol RockClimbLoggedViewModelDelegate {
    func presentRockClimbData(rockClimbDictionary: [String : NSAttributedString])
}

    

