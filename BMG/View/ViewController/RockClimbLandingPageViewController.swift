//
//  RockClimbLandingPageViewController.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 13/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

class RockClimbLandingPageViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13, *) {
                   navigationController?.navigationBar.prefersLargeTitles = true
                   navigationItem.largeTitleDisplayMode = .always
                   navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
               }     
        
       view.accessibilityIdentifier = "rockClimbLandingPage"
    }
}
