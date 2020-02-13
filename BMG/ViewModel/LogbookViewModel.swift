//
//  LogbookViewModel.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 17/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class LogbookViewModel {
    
    var databaseService: DatabaseService
    var screenNavigationController: ScreenNavigationController
    
    init(_ databaseService: DatabaseService, screenNavigationController: ScreenNavigationController) {
        self.databaseService = databaseService
        self.screenNavigationController = screenNavigationController
    }
    
    //is it SOOOO bad to pass a model type into the VC?? seems a bit derivative to require a new object....???
    func retrieveAllRockClimbData()  -> Array<RockClimbEntry> {
        let rockClimbDataArrayReceived = databaseService.getAllRockClimbDataFromDb()
        return rockClimbDataArrayReceived
    }
    
    
    var idOfRockClimbSelected: Int64 = -1
   
    func showRockClimbDetails(){
        screenNavigationController.displayLoggedRockClimbDataScreen(idOfRockClimbSelected)
    }
    
}
