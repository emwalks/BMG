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
    var rockClimbIdFromSegue: Int64 = -5000
    var rockClimbLoggedViewModel: RockClimbLoggedViewModel? = nil
    
    func rockClimbDataPresented(loggedRouteName: String) {
        routeNameFromDb = loggedRouteName
        let attributedString = NSAttributedString(string: "Route: \(routeNameFromDb), id: \(rockClimbIdFromSegue)")
        routeNameLabel.attributedText = attributedString
        //printing id for now to show it gets updated
    }

    @IBOutlet weak var routeNameLabel: UILabel! {
        didSet {
            rockClimbDataPresented(loggedRouteName: routeNameFromDb)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this is for the UI Test to be able to identify the correct view is segued to
        view.accessibilityIdentifier = "rockClimbLoggedView"
        
        routeNameLabel.layer.masksToBounds = true
        routeNameLabel.layer.cornerRadius = 5
        rockClimbLoggedViewModel = RockClimbLoggedViewModel(SQLiteDatabaseServiceFactory.createDbService(), idOfRockClimbReceived: rockClimbIdFromSegue, rockClimbLoggedScreen: self)
//        routeNameFromDb = rockClimbLoggedViewModel?.retrieveRockClimb(idOfRockClimb: rockClimbIdFromSegue)
    
    
    }
    
    }
    

