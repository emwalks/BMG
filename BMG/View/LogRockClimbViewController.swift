//
//  ViewController.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 11/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import UIKit

class LogRockClimbViewController: UIViewController, UITableViewDelegate {
    
    // MARK: Fields / Variables
    
    let logRockClimbViewModel = LogRockClimbViewModel()
    
    // Model init'ed here too - probably need a check to see if we're logging a new climb or whether we're passing in a model already with data ready to present
    
    // MARK: IBOutlets and custom views
    
    private let datePicker = CustomDatePicker()
    private let toolbar = CustomDatePickerToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    @IBOutlet weak var routeTextField: UITextField!
    @IBOutlet weak var gradeTextField: UITextField!
    @IBOutlet weak var venueTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var partnersTextField: UITextField!
    @IBOutlet weak var styleTableView: LogRockClimbTableView!
    @IBOutlet weak var submitButton: UIButton!
    
    // MARK: Formatting the view
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 5
        createDatePicker()
        styleTableView.formatTableView()
    }
    
    // MARK: DatePicker
    
    func createDatePicker(){
        
        datePicker.formatDatePicker()
        toolbar.formatToolbar(doneSelector: #selector(doneDatePicker), cancelSelector: #selector(cancelDatePicker))
        dateTextField.inputAccessoryView = toolbar
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
}

