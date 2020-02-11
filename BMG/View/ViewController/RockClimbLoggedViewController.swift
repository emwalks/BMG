//
//  RockClimbLoggedViewController.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 04/12/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

class RockClimbLoggedViewController: UIViewController, RockClimbLoggedScreen {
    
    var routeNameFromDb: String = ""
    var gradeFromDb: String = ""
    var venueNameFromDb: String = ""
    var dateFromDb: String = ""
    var partnersFromDb: String = ""
    var climbingStyleFromDb: String = ""
    var rockClimbIdFromSegue: Int64 = -5000
    var rockClimbLoggedViewModel: RockClimbLoggedViewModel? = nil
    
    
    
    func rockClimbDataPresented(rockClimbEntry: RockClimbEntry) {
        routeNameFromDb = rockClimbEntry.routeName
        gradeFromDb = rockClimbEntry.grade
        venueNameFromDb = rockClimbEntry.venueName
        dateFromDb = rockClimbEntry.date
        partnersFromDb = rockClimbEntry.partners
        climbingStyleFromDb = rockClimbEntry.climbingStyle
        let routeNamePresented = NSAttributedString(string: " Route Name: \(routeNameFromDb)")
        let gradePresented = NSAttributedString(string: " Grade: \(gradeFromDb)")
        let venueNamePresented = NSAttributedString(string: " Venue: \(venueNameFromDb)")
        let datePresented = NSAttributedString(string: " Date: \(dateFromDb)")
        let partnersPresented = NSAttributedString(string: " Partners: \(partnersFromDb)")
        let climbingStylePresented = NSAttributedString(string: " Style: \(climbingStyleFromDb)")
        routeNameLabel.attributedText = routeNamePresented
        gradeLabel.attributedText = gradePresented
        venueNameLabel.attributedText = venueNamePresented
        dateLabel.attributedText = datePresented
        partnersLabel.attributedText = partnersPresented
        climbingStyleLabel.attributedText = climbingStylePresented

    }
    
    @IBOutlet weak var routeNameLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var venueNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var partnersLabel: UILabel!
    @IBOutlet weak var climbingStyleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.accessibilityIdentifier = "rockClimbLoggedView"
        routeNameLabel.accessibilityIdentifier = "routeNamePresented"
        gradeLabel.accessibilityIdentifier = "gradePresented"
        venueNameLabel.accessibilityIdentifier = "venueNamePresented"
        dateLabel.accessibilityIdentifier = "datePresented"
        partnersLabel.accessibilityIdentifier = "partnersPresented"
        climbingStyleLabel.accessibilityIdentifier = "climbingStylePresented"
        
        routeNameLabel.layer.masksToBounds = true
        routeNameLabel.layer.cornerRadius = 5
        gradeLabel.layer.masksToBounds = true
        gradeLabel.layer.cornerRadius = 5
        venueNameLabel.layer.masksToBounds = true
        venueNameLabel.layer.cornerRadius = 5
        dateLabel.layer.masksToBounds = true
        dateLabel.layer.cornerRadius = 5
        partnersLabel.layer.masksToBounds = true
        partnersLabel.layer.cornerRadius = 5
        climbingStyleLabel.layer.masksToBounds = true
        climbingStyleLabel.layer.cornerRadius = 5
        
        
        //Emma thinks she has successfully refactored this - for review
        rockClimbLoggedViewModel = RockClimbLoggedViewModel(SQLiteDatabaseServiceFactory.createDbService(), idOfRockClimbReceived: rockClimbIdFromSegue, rockClimbLoggedScreen: self)
                
        routeNameLabel.backgroundColor = ColorCompatibility.systemGray4
        gradeLabel.backgroundColor = ColorCompatibility.systemGray4
        venueNameLabel.backgroundColor = ColorCompatibility.systemGray4
        dateLabel.backgroundColor = ColorCompatibility.systemGray4
        partnersLabel.backgroundColor = ColorCompatibility.systemGray4
        climbingStyleLabel.backgroundColor = ColorCompatibility.systemGray4
    }
    
}


