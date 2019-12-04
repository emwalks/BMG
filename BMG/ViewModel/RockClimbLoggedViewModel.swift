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
    
    func retrieveRockClimb(idOfRockClimb: Int64) {
        
        if idOfRockClimbReceived == idOfRockClimb {
            databaseService.getRockClimbDataFromDb(idOfRockClimb: idOfRockClimb)
            print("id matched in RockClimbLoggedViewModel" )
        } else {
            print("Error: Id of rock climb received does match id of rock climb logged")
        }
    }
    
}
