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
    @objc func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let selectedDateString = dateFormatter.string(from: date)
        return selectedDateString 
    }
    
    ///Submit button
    
    var idGivenToRockClimb:Int64 = -1
    
    func logClimbData(routeName: String) {
        
        idGivenToRockClimb = databaseService.addRockClimbToDb(routeName: routeName)
        
        screenNavigationController.displayLoggedRockClimbDataScreen(idGivenToRockClimb)
        
    }
    
    
}
