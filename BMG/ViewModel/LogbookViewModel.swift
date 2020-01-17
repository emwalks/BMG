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
       
       init(_ databaseService: DatabaseService, logbookScreen: LogbookScreenProtocol) {
           self.databaseService = databaseService
           self.logbookScreen = logbookScreen
           retrieveAllRockClimbData()
       }
       
       func retrieveAllRockClimbData() {
           let rockClimbDataArrayReceived = databaseService.getAllRockClimbDataFromDb()
           logbookScreen.allRockClimbDataPresented(arrayOfRockClimbs: rockClimbDataArrayReceived)
       }
       
   }
