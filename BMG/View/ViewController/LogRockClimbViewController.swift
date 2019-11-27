//
//  ViewController.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 11/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import UIKit

class LogRockClimbViewController: UIViewController {
    
    // MARK: Fields / Variables
    
    let logRockClimbViewModel = LogRockClimbViewModel(SQLiteDatabaseServiceFactory.createDbService())
    
    // TODO: Model initialised here too - probably need a check to see if we're logging a new climb or whether we're passing in a model already with data ready to present
    
    // MARK: IBOutlets and custom views
    private let datePicker = CustomDatePicker()
    private let datePickerToolbar = CustomPickerToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    private let gradePicker = GradePickerView()
    private let gradePickerToolbar = CustomPickerToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    @IBOutlet weak var routeTextField: UITextField!
    @IBOutlet weak var gradeTextField: UITextField!
    @IBOutlet weak var venueTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var partnersTextField: UITextField!
    @IBOutlet weak var styleTableView: ClimbingStylesTableView!
    @IBOutlet weak var submitButton: UIButton!
    
    
    @IBAction func clickedSubmitButton(_ sender: UIButton) {
        logRockClimbViewModel.logClimbData(routeName: routeTextField.text ?? "No route name given")
       
        routeTextField.text = ""
    }
    
    // MARK: Formatting the view
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        createGradePicker()
        createDatePicker()
        styleTableView.setup()
        submitButton.layer.cornerRadius = 5
        addKeyboardDismissRecogniser()
        
        
    }
    
    // MARK: Grade PickerView
    
    func createGradePicker(){
        
        // TODO: Make picker uneditable / enforce validation
        
        gradePicker.setup(withData: logRockClimbViewModel.rockClimbGrades)
        gradePickerToolbar.setup(doneSelector: #selector(doneGradePicker), cancelSelector: #selector(cancelGradePicker))
        gradeTextField.inputAccessoryView = gradePickerToolbar
        gradeTextField.inputView = gradePicker
    }
    
    @objc func doneGradePicker(){
        let numberOfGrades = gradePicker.numberOfComponents
        // Extract grades
        // can you work out the index of the array from the picker?
        var extractedGrades:[String] = []
        for componentIndex in 0..<numberOfGrades{
            if let rowTitle = gradePicker.delegate?.pickerView?(gradePicker, titleForRow: gradePicker.selectedRow(inComponent: componentIndex), forComponent: componentIndex)
            {
                extractedGrades.append(rowTitle)
            }
        }
        
        logRockClimbViewModel.selectGrade(adjectivalGrade: extractedGrades[0], technicalGrade: extractedGrades[1])
        
        gradeTextField.text = logRockClimbViewModel.gradeText()
        self.view.endEditing(true)
    }
    
    @objc func cancelGradePicker(){
        
        self.view.endEditing(true)
    }
    
    // MARK: DatePicker
    
    func createDatePicker(){
        
        datePicker.formatDatePicker()
        datePickerToolbar.setup(doneSelector: #selector(doneDatePicker), cancelSelector: #selector(cancelDatePicker))
        dateTextField.inputAccessoryView = datePickerToolbar
        dateTextField.inputView = datePicker
    }
    
    @objc func doneDatePicker(){
        let selectedDate =   datePicker.date
        
        //VM
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let selectedDateString = dateFormatter.string(from: selectedDate)
        //VM
        
        dateTextField.text = selectedDateString
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        
        self.view.endEditing(true)
    }
    
    func addKeyboardDismissRecogniser(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        // Fixes bug where you can't tap on tableview
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    // Need to understand why we need to expose to objc
    @objc func dismissKeyboard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.endEditing(true)
        self.view.removeGestureRecognizer(tap)
    }
}
