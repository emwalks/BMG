//
//  LogRockClimbViewModel.swift
//  BMG
//
//  Created by Andrew Wilson-Jones on 18/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class LogRockClimbViewModel{
    
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
    
    private var loggedRouteName: String?
    
    func getLoggedData(routeName: String) {
        loggedRouteName = routeName
    }
    
    func outputWhenSubmitButtonClicked() -> String {
        print(loggedRouteName ?? "No route name given")
        return loggedRouteName ?? "No route name given"
        
    }
    
}
