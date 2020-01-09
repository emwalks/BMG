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
    var rockClimbIdFromSegue: Int64 = -5000
    var rockClimbLoggedViewModel: RockClimbLoggedViewModel? = nil
    
    func rockClimbDataPresented(rockClimbEntry: RockClimbEntry) {
        routeNameFromDb = rockClimbEntry.routeName
        gradeFromDb = rockClimbEntry.grade
        let routeNamePresented = NSAttributedString(string: " Route Name: \(routeNameFromDb)")
         let gradePresented = NSAttributedString(string: " Grade: \(gradeFromDb)")
        routeNameLabel.attributedText = routeNamePresented
        gradeLabel.attributedText = gradePresented
    }
    
    @IBOutlet weak var routeNameLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this is for the UI Test to be able to identify the correct view is segued to
        view.accessibilityIdentifier = "rockClimbLoggedView"
        routeNameLabel.accessibilityIdentifier = "routeNamePresented"
        gradeLabel.accessibilityIdentifier = "gradePresented"
        
        routeNameLabel.layer.masksToBounds = true
        routeNameLabel.layer.cornerRadius = 5
        gradeLabel.layer.masksToBounds = true
        gradeLabel.layer.cornerRadius = 5
        
        //let's review this
        rockClimbLoggedViewModel = RockClimbLoggedViewModel(SQLiteDatabaseServiceFactory.createDbService(), idOfRockClimbReceived: rockClimbIdFromSegue, rockClimbLoggedScreen: self)
        rockClimbLoggedViewModel?.retrieveRockClimb(idOfRockClimb: rockClimbIdFromSegue)
        routeNameLabel.backgroundColor = ColorCompatibility.systemGray4
        gradeLabel.backgroundColor = ColorCompatibility.systemGray4
    }
    
}


