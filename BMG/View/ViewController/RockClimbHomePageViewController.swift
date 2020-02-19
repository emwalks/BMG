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
        
        //I feel like ViewControl should not instantiate the navigationcontroller (and it does not even need to)
//        rockClimbHomePageViewModel = RockClimbHomePageViewModel(screenNavigationController: SegueNavigationController(self))
        
        if #available(iOS 13, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .always
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        
        view.accessibilityIdentifier = "rockClimbHomeScreen"
    }
    
    //Is it correct for the View controller to have logic? should it be the ViewModel responsability to say which method to call and viewController should just say "Somebody pressed this botton of mine!)
    @IBAction func logARockClimbButtonClicked(_ sender: Any) {
        rockClimbHomePageViewModel?.displayLogARockClimbScreen()
    }
    
    @IBAction func viewLogbookButtonClicked(_ sender: Any) {
        rockClimbHomePageViewModel?.displayLogbookScreen()
    }
}
