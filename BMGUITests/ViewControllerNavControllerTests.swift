//
//  ViewControllerNavControllerTests.swift
//  BMGUITests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 29/11/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest

class ViewControllerTests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
       super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        
    
    }
    
//    func testTheInitialViewControllerIsLogRockClimbViewController(){
//        sleep(4)
//
//        let test1 = UIApplication.shared
//        let appDelegate = test1.delegate as! AppDelegate
//
//        let test2 = appDelegate.window
//        var logRockClimbViewController = test2?.rootViewController
//
//        XCTAssertNotNil(logRockClimbViewController?.presentedViewController)
//    }
//}
//
//    func testNavigateToTheRockClimbLoggedScreen() {
//
//        var logRockClimbViewController = UIApplication.shared.
//
//        class rockClimbLoggedViewController: UIViewController {
//            override func viewDidLoad() {
//
//                super.viewDidLoad()
//                let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
//                label.center = CGPoint(x: 160, y: 285)
//                label.textAlignment = .center
//                label.text = "I'm a test label"
//                self.view.addSubview(label)
//                view.layoutSubviews()
//
//            }
//        }
//
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "LoggedRockClimbSegue"
//            {
//                logRockClimbViewController = segue.destination as? rockClimbLoggedViewController
//            }      }
//
//        logRockClimbViewController?.performSegue(withIdentifier: "LoggedRockClimbSegue", sender: nil)
//        XCTAssertTrue(((logRockClimbViewController?.presentedViewController) != nil))
//
//
//    }
    
}

