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

    func displayLoggedRockClimbDataScreen(_ loggedRockClimbId: Int64) -> Int64 {
         viewController.performSegue(withIdentifier: "RockClimbSubmittedSegue", sender: viewController)
        let loggedRockClimbId = loggedRockClimbId
        return loggedRockClimbId
    }
    
    
}
