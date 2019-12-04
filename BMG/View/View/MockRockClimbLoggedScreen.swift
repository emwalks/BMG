//
//  MockRockClimbLoggedScreen.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 04/12/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockRockClimbLoggedScreen: RockClimbLoggedScreen {
    
    public var routeNameOnScreen: String = ""
    
    func rockClimbDataPresented(loggedRouteName: String) -> String {
        routeNameOnScreen = loggedRouteName
        return routeNameOnScreen
    }
}
