//
//  RockClimb.swift
//  BMG
//
//  Created by Andrew Wilson-Jones on 18/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation


// Struct containing a single rock climb
struct RockClimb {
    
    let routeName:String
    let adjGradeRoute:String
    let techGradeRoute: String
    let venueName:String
    let date: Date
    let partnersName:String
    let climbingStyle:String
    
    init(routeName:String, adjGradeRoute:String, techGradeRoute: String, venueName:String, date: Date, partnersName:String, climbingStyle:String) {
        self.routeName = routeName
        self.adjGradeRoute = adjGradeRoute
        self.techGradeRoute = techGradeRoute
        self.venueName  = venueName
        self.date   = date
        self.partnersName = partnersName
        self.climbingStyle = climbingStyle
    }
}

