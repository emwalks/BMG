//
//  AppCoordinator.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 19/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: ScreenNavigationController {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        displayRockClimbHomeScreen()
    }
    
    
    func displayRockClimbHomeScreen() {
        if let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "rockClimbHomeScreen") as? RockClimbHomePageViewController {
            newViewController.rockClimbHomePageViewModel = RockClimbHomePageViewModel(screenNavigationController: self)
            navigationController.pushViewController(newViewController, animated: true)
        }
    }
    
    
    func displayLogARockClimbScreen() {
        if let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "logRockClimbScreen") as? LogRockClimbViewController {
            newViewController.logRockClimbViewModel = LogRockClimbViewModel(SQLiteDatabaseServiceFactory.createDbService(), screenNavigationController: self)
            navigationController.pushViewController(newViewController, animated: true)
        }
        
    }
    
    func displayLogbookScreen() {
        if let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "logbookScreen") as? MyLogbookViewController {
            newViewController.logbookViewModel = LogbookViewModel(SQLiteDatabaseServiceFactory.createDbService(), screenNavigationController: self)
            navigationController.pushViewController(newViewController, animated: true)
            
        }
    }
    
    func displayLoggedRockClimbDataScreen(_ loggedRockClimbId: Int64) {
        
        if let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "rockClimbLoggedScreen") as? RockClimbLoggedViewController {
            let rockClimbViewModel = RockClimbLoggedViewModel(SQLiteDatabaseServiceFactory.createDbService(), idOfRockClimbReceived: loggedRockClimbId)
            newViewController.rockClimbLoggedViewModel = rockClimbViewModel
            navigationController.pushViewController(newViewController, animated: true)
        }
    }
    
}


