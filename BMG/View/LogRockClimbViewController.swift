//
//  ViewController.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 11/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import UIKit

class LogRockClimbViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Fields / Variables
    
    let logRockClimbViewModel = LogRockClimbViewModel()
    
    // Model init'ed here too - probably need a check to see if we're logging a new climb or whether we're passing in a model already with data ready to present
    
    var climbingStyleSelectedIndex = 0
    let climbingStyles = ["Led","Alternate","Second"]
    let datePicker = UIDatePicker()
    
    // MARK: IBOutlets
    
    @IBOutlet weak var routeTextField: UITextField!
    @IBOutlet weak var gradeTextField: UITextField!
    @IBOutlet weak var venueTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var partnersTextField: UITextField!
    @IBOutlet weak var styleTableView: UITableView!
    @IBOutlet weak var submitButton: UIButton!
    
    // MARK: Formatting the view
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        formatView()
        createDatePicker()
        styleTableView.dataSource = self
        styleTableView.delegate = self
    }
    
    func formatView(){
        
        submitButton.layer.cornerRadius = 5
        styleTableView.layer.cornerRadius = 5
        styleTableView.separatorInset.left = 20
        styleTableView.separatorInset.right = 20
    }
    
    // MARK: DatePicker
    
    // We could shift date picker and tableview into their own classes / files in order to slim down the VC (Solid principles)
    // E.g.
    // let datePicker = CustomDatePicker()
    // let toolbar = CustomDatePickerToolbar()
    // dateTextField.inputAccessoryView = toolbar
    // dateTextField.inputView = datePicker
    
    func createDatePicker(){
        
        datePicker.datePickerMode = .date
        datePicker.locale = .current
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneDatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelDatePicker));
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        toolbar.barStyle = .default
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        toolbar.sizeToFit()
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
    
    // MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let climbingStyleCell = tableView.dequeueReusableCell(withIdentifier: "ClimbingStyle")
        climbingStyleCell?.textLabel?.text = climbingStyles[indexPath.row]
        
        return climbingStyleCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        climbingStyleSelectedIndex = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}

