//
//  RockClimbLoggedViewController.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 04/12/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit



class RockClimbLoggedViewController: UIViewController {
    
    @IBOutlet weak var routeNameLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var venueNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var partnersLabel: UILabel!
    @IBOutlet weak var climbingStyleLabel: UILabel!
    
    var rockClimbLoggedViewModel: RockClimbLoggedViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.formatLabels()
        rockClimbLoggedViewModel?.delegate = self
        rockClimbLoggedViewModel?.getRockClimbData()
    }
    
    
    private func formatLabels() {
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
        
        routeNameLabel.backgroundColor = ColorCompatibility.systemGray4
        gradeLabel.backgroundColor = ColorCompatibility.systemGray4
        venueNameLabel.backgroundColor = ColorCompatibility.systemGray4
        dateLabel.backgroundColor = ColorCompatibility.systemGray4
        partnersLabel.backgroundColor = ColorCompatibility.systemGray4
        climbingStyleLabel.backgroundColor = ColorCompatibility.systemGray4
    }
    
}


extension RockClimbLoggedViewController : RockClimbLoggedViewModelDelegate {
    func presentData(route: NSAttributedString, grade: NSAttributedString, venue: NSAttributedString, date: NSAttributedString, partners: NSAttributedString, style: NSAttributedString) {
        routeNameLabel.attributedText = route
        gradeLabel.attributedText = grade
        venueNameLabel.attributedText = venue
        dateLabel.attributedText = date
        partnersLabel.attributedText = partners
        climbingStyleLabel.attributedText = style
    }
}


