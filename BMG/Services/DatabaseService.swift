//
//  DatabaseService.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 21/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

protocol DatabaseService {
    
    func addRockClimbToDb (routeName: String, grade: String, venueName: String, date: String, partners: String, climbingStyle: String)  -> Int64
    
    func getRockClimbDataFromDb(idOfRockClimb: Int64) -> RockClimbEntry
    
    func getAllRockClimbDataFromDb()
    
}
