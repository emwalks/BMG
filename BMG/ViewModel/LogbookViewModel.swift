//
//  LogbookViewModel.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 17/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockLogbookViewModel {
       
       var databaseService: DatabaseService
       var mockLogbookScreen: MockLogbookScreen
       
       init(_ databaseService: DatabaseService, logbookScreen: MockLogbookScreen) {
           self.databaseService = databaseService
           self.mockLogbookScreen = logbookScreen
           retrieveAllRockClimbData()
       }
       
       func retrieveAllRockClimbData() {
           let rockClimbDataArrayReceived = databaseService.getAllRockClimbDataFromDb()
           mockLogbookScreen.allRockClimbDataPresented(arrayOfRockClimbs: rockClimbDataArrayReceived)
       }
       
   }
