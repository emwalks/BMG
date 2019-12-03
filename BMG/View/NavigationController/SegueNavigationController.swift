//
//  SegueNavigationController.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 29/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

class SegueNavigationController: ScreenNavigationController {
    
    var viewController: UIViewController
    
    init(_ viewController:UIViewController) {
        self.viewController = viewController
    }

    func displayLoggedRockClimbDataScreen() {
         viewController.performSegue(withIdentifier: "RockClimbSubmittedSegue", sender: viewController)
    }
    
    
}
