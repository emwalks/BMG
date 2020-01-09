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
    var rockClimbIdFromSegue: Int64 = -5000
    var rockClimbLoggedViewModel: RockClimbLoggedViewModel? = nil
    
    func rockClimbDataPresented(rockClimbEntry: RockClimbEntry) {
        routeNameFromDb = rockClimbEntry.routeName
        gradeFromDb = rockClimbEntry.grade
        venueNameFromDb = rockClimbEntry.venueName
        dateFromDb = rockClimbEntry.date
        let routeNamePresented = NSAttributedString(string: " Route Name: \(routeNameFromDb)")
        let gradePresented = NSAttributedString(string: " Grade: \(gradeFromDb)")
        let venueNamePresented = NSAttributedString(string: " Venue: \(venueNameFromDb)")
        let datePresented = NSAttributedString(string: " Date: \(dateFromDb)")
        routeNameLabel.attributedText = routeNamePresented
        gradeLabel.attributedText = gradePresented
        venueNameLabel.attributedText = venueNamePresented
        dateLabel.attributedText = datePresented

    }
    
    @IBOutlet weak var routeNameLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var venueNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this is for the UI Test to be able to identify the correct view is segued to
        view.accessibilityIdentifier = "rockClimbLoggedView"
        routeNameLabel.accessibilityIdentifier = "routeNamePresented"
        gradeLabel.accessibilityIdentifier = "gradePresented"
        venueNameLabel.accessibilityIdentifier = "venueNamePresented"
        dateLabel.accessibilityIdentifier = "datePresented"

        
        routeNameLabel.layer.masksToBounds = true
        routeNameLabel.layer.cornerRadius = 5
        gradeLabel.layer.masksToBounds = true
        gradeLabel.layer.cornerRadius = 5
        venueNameLabel.layer.masksToBounds = true
        venueNameLabel.layer.cornerRadius = 5
        dateLabel.layer.masksToBounds = true
        dateLabel.layer.cornerRadius = 5
        
        
        //let's review this
        rockClimbLoggedViewModel = RockClimbLoggedViewModel(SQLiteDatabaseServiceFactory.createDbService(), idOfRockClimbReceived: rockClimbIdFromSegue, rockClimbLoggedScreen: self)
        rockClimbLoggedViewModel?.retrieveRockClimb(idOfRockClimb: rockClimbIdFromSegue)
        
        routeNameLabel.backgroundColor = ColorCompatibility.systemGray4
        gradeLabel.backgroundColor = ColorCompatibility.systemGray4
        venueNameLabel.backgroundColor = ColorCompatibility.systemGray4
        dateLabel.backgroundColor = ColorCompatibility.systemGray4
    }
    
}


