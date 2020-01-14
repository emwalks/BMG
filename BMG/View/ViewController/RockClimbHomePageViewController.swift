//
//  RockClimbLandingPageViewController.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 13/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

class RockClimbHomePageViewController: UIViewController {
    
    var rockClimbHomePageViewModel: RockClimbHomePageViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rockClimbHomePageViewModel = RockClimbHomePageViewModel(screenNavigationController: SegueNavigationController(self))
        
        if #available(iOS 13, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .always
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        
        view.accessibilityIdentifier = "rockClimbHomePage"
    }
    
    
    @IBAction func logARockClimbButtonClicked(_ sender: Any) {
        rockClimbHomePageViewModel?.displayLogARockClimbScreen()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
//        if segue.identifier == "LogARockClimbSegue" {
//            _ = segue.destination as? LogRockClimbViewController
//        }
//    }
    
}
