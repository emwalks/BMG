//
//  LogRockClimbViewModel.swift
//  BMG
//
//  Created by Andrew Wilson-Jones on 18/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class LogRockClimbViewModel{
    
    let rockClimbGrades = Grades.rockClimbGrades
    
//    let adjectivalGrades = Grades.adjectivalGrades.description
//    let technicalGrades = Grades.technicalGrades.description
    
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
}
