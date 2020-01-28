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
    var logbookScreen: LogbookScreenProtocol
    var screenNavigationController: ScreenNavigationController

    
    init(_ databaseService: DatabaseService, logbookScreen: LogbookScreenProtocol, screenNavigationController: ScreenNavigationController) {
        self.databaseService = databaseService
        self.logbookScreen = logbookScreen
        self.screenNavigationController = screenNavigationController
        retrieveAllRockClimbData()
    }
    
    func retrieveAllRockClimbData() {
        let rockClimbDataArrayReceived = databaseService.getAllRockClimbDataFromDb()
        logbookScreen.allRockClimbDataPresented(arrayOfRockClimbs: rockClimbDataArrayReceived)
    }
    
    //MARK: TODO
    //passing UI test means this data is passing only via segue and not via VM at all - is this correct?
//    var idOfRockClimbSelected: Int64 = -1
//    in logRockClimbVM needs to be returned from db and passed to segue nav controller
//    func showRockClimbDetails(){
//        screenNavigationController.displayLoggedRockClimbDataScreen(idOfRockClimbSelected)
//    }
    
}
