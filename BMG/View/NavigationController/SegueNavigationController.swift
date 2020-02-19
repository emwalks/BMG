////
////  SegueNavigationController.swift
////  BMG
////
////  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 29/11/2019.
////  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//// this should singleton
//class SegueNavigationController: ScreenNavigationController {
//    func displayLoggedRockClimbDataScreen(_ loggedRockClimbId: Int64) {
//        
//    }
//    
//    func displayLogARockClimbScreen() {
//        
//    }
//    
//    func displayLogbookScreen() {
//        
//    }
//    
//    
////    var viewController: UIViewController
////
////
////    init(_ viewController:UIViewController) {
////        self.viewController = viewController
////    }
////
////    func displayLogARockClimbScreen() {
////        viewController.performSegue(withIdentifier: "LogARockClimbSegue", sender: self)
////
////    }
////
////    func displayLogbookScreen() {
////        if let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "logbook") as? MyLogbookViewController {
////            newViewController.logbookViewModel = LogbookViewModel(SQLiteDatabaseServiceFactory.createDbService(), screenNavigationController: self)
////                viewController.navigationController?.pushViewController(newViewController, animated: true)
////
////            }
////        }
////
////    func displayLoggedRockClimbDataScreen(_ loggedRockClimbId: Int64) {
////
////        if let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "rockClimbLogged") as? RockClimbLoggedViewController {
////            let rockClimbViewModel = RockClimbLoggedViewModel(SQLiteDatabaseServiceFactory.createDbService(), idOfRockClimbReceived: loggedRockClimbId)
////            newViewController.rockClimbLoggedViewModel = rockClimbViewModel
////            viewController.navigationController?.pushViewController(newViewController, animated: true)
////        }
////    }
////
//}
//
//
