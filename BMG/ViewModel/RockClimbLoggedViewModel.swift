//
//  RockClimbLoggedViewModel.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 29/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class RockClimbLoggedViewModel {
    var databaseService: DatabaseService
    
    init(_ databaseService: DatabaseService) {
        self.databaseService = databaseService
    }
    
    func retrieveRockClimb(idOfRockClimb: Int) {
        databaseService.getRockClimbDataFromDb(idOfRockClimb: idOfRockClimb)    }
    
}
