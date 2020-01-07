//
//  RockClimbEntry.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 07/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

struct RockClimbEntry {
    
    let routeName: String
    let grade: String
    let venueName: String
    let date: String
    let partners: String
    let climbingStyle: String
    
    init(routeName:String, grade:String, venueName:String, date: String, partners: String, climbingStyle: String) {
        self.routeName = routeName
        self.grade = grade
        self.venueName = venueName
        self.date = date
        self.partners = partners
        self.climbingStyle = climbingStyle
    }
    
}
