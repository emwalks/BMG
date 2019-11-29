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
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testNavigateToTheRockClimbLoggedScreen() {
        
        XCUIApplication().scrollViews.otherElements.buttons["Submit"].tap()
        
//
//        //aarange
//        let appDelegate : UIApplicationDelegate? = nil
//        let screenNavigationController = SegueScreenNavigationController()
//
//        //act
//        screenNavigationController.displayLoggedRockClimbDataScreenInTest(appDelegate!)
//
        XCTAssertTrue(app.isDisplayingRockClimbLoggedView, "rockClimbLoggedView is being displayed")
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
