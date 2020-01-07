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
    var rockClimbLoggedScreen: RockClimbLoggedScreen
    
    init(_ databaseService: DatabaseService, idOfRockClimbReceived: Int64, rockClimbLoggedScreen: RockClimbLoggedScreen) {
        self.databaseService = databaseService
        self.idOfRockClimbReceived = idOfRockClimbReceived
        self.rockClimbLoggedScreen = rockClimbLoggedScreen
    }
    
    func retrieveRockClimb(idOfRockClimb: Int64) {
        
        if idOfRockClimbReceived == idOfRockClimb {
           let rockClimbDataReceived = databaseService.getRockClimbDataFromDb(idOfRockClimb: idOfRockClimb)
            
            rockClimbLoggedScreen.rockClimbDataPresented(loggedRouteName: rockClimbDataReceived.routeName)
            print("id matched in RockClimbLoggedViewModel")

        } else {
            print("Error: Id of rock climb received does match id of rock climb logged")
        }
    }
    
}
