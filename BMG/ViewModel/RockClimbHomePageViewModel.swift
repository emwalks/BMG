//
//  RockClimbHomePageViewModel.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 14/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class RockClimbHomePageViewModel {
    
    var screenNavigationController: ScreenNavigationController
    
    init(screenNavigationController: ScreenNavigationController) {
        self.screenNavigationController = screenNavigationController
    }
    
    func displayLogARockClimbScreen() {
        screenNavigationController.displayLogARockClimbScreen()
    }
    
    func displayLogbookScreen() {
        screenNavigationController.displayLogbookScreen()
    }
    
}
