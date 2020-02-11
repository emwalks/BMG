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
    
    func displayLogARockClimbScreen() {
        viewController.performSegue(withIdentifier: "LogARockClimbSegue", sender: self)
        
    }
    
    func displayLogbookScreen() {
        viewController.performSegue(withIdentifier: "ViewLogbookSegue", sender: self)
    }
    
    func displayLoggedRockClimbDataScreen(_ loggedRockClimbId: Int64) {
        
        if let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "rockClimbLogged") as? RockClimbLoggedViewController {
            newViewController.rockClimbIdFromSegue = loggedRockClimbId
            viewController.navigationController?.pushViewController(newViewController, animated: true)
        }
//        viewController.performSegue(withIdentifier: "ViewLoggedRockClimbSegue", sender: self)
    }
    
}

