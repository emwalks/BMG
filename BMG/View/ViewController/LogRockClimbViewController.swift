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
    
    let logRockClimbViewModel = LogRockClimbViewModel()
    
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
        
        // TODO: Put actual grade data in picker, fetched from the viewmodel (and in turn, the model)
        // TODO: Make picker uneditable / enforce validation
        
        
        gradePicker.setup(withData: Grades.rockClimbGrades)
        gradePickerToolbar.setup(doneSelector: #selector(doneGradePicker), cancelSelector: #selector(cancelGradePicker))
        gradeTextField.inputAccessoryView = gradePickerToolbar
        gradeTextField.inputView = gradePicker
    }
    
    @objc func doneGradePicker(){
        
        // Extract grades
        var extractedGrades:[String] = []
        for componentIndex in 0..<gradePicker.numberOfComponents{
            if let rowTitle = gradePicker.delegate?.pickerView?(gradePicker, titleForRow: gradePicker.selectedRow(inComponent: componentIndex), forComponent: componentIndex){
                extractedGrades.append(rowTitle)
            }
        }
        // Concat grades
        var concatenatedGrades = ""
        for strIndex in 0..<extractedGrades.count{
            if(strIndex == extractedGrades.count-1){
                concatenatedGrades += (extractedGrades[strIndex])
            }else{
                concatenatedGrades += (extractedGrades[strIndex]) + " "
            }
        }
        gradeTextField.text = concatenatedGrades
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
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateTextField.text = dateFormatter.string(from: datePicker.date)
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
