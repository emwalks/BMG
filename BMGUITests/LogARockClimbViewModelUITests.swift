//
//  LogARockClimbViewModelUITests.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 27/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class LogARockClimbViewModelUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        
    }
    
    override func tearDown() {
    }
    
    
    func testNavigateToTheRockClimbLoggedScreen() {
        
        XCUIApplication().scrollViews.otherElements.buttons["Submit"].tap()
        sleep(4)

        XCTAssertTrue(app.isDisplayingRockClimbLoggedView, "rockClimbLoggedView is being displayed")
    }
}

extension XCUIApplication {
    var isDisplayingRockClimbLoggedView: Bool {
        return otherElements["rockClimbLoggedView"].exists
    }
}

//class SegueScreenNavigationController: ScreenNavigationController
//{
//    func displayLoggedRockClimbDataScreen() {
//        //to conform to protocol
//    }
//
//    func displayLoggedRockClimbDataScreenInTest(_ delegate: UIApplicationDelegate) {
//
//        let logRockClimbViewController = UIApplication.shared.keyWindow?.rootViewController
//        //get a hold of the currently presented view controller
//
//        //then tell it to performSegue
//        class rockClimbLoggedViewController: UIViewController {
//            var rockClimbRouteName:String = "I am the rockClimbLoggedView"
//        }
//
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "LoggedRockClimbSegue"
//            {
//                let loggedRockClimbVC = segue.destination as? rockClimbLoggedViewController
//            }      }
//
//        logRockClimbViewController?.performSegue(withIdentifier: "LoggedRockClimbSegue", sender: nil)
//    }
//}
//
//
