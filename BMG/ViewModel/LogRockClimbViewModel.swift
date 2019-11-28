//
//  LogRockClimbViewModel.swift
//  BMG
//
//  Created by Andrew Wilson-Jones on 18/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class LogRockClimbViewModel{
    
    var databaseService: DatabaseService
    var screenNavigationController: ScreenNavigationController
    
    init(_ databaseService: DatabaseService, screenNavigationController: ScreenNavigationController) {
        self.databaseService = databaseService
        self.screenNavigationController = screenNavigationController
    }

    ///Grades
    
    let rockClimbGrades = Grades.rockClimbGrades
    
    private var selectedGradeText : String?
    
    func selectGrade(adjectivalGrade: String, technicalGrade: String) -> Void
    {
        // Concat grades
        selectedGradeText = adjectivalGrade + " " + technicalGrade
    }
    
    func gradeText() -> String
    {
        return selectedGradeText ?? "Please select a grade"
    }
    
    ///Date
    //need to move done date picker logic into here
    
    ///Submit button
    
    func logClimbData(routeName: String) {
        
        databaseService.addRockClimbToDb(routeName: routeName)
        
        screenNavigationController.displayLoggedRockClimbDataScreen()
        
    }
    
    
}
