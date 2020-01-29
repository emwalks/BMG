//
//  ViewController.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 11/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import UIKit

class LogRockClimbViewController: UIViewController, UITextFieldDelegate {
    
    var logRockClimbViewModel: LogRockClimbViewModel? = nil
    
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
        logRockClimbViewModel?.logClimbData(routeName: routeTextField.text ?? "No route name given", grade: gradeTextField.text ?? "No grade selected", venueName: venueTextField.text ?? "No venue given", date: dateTextField.text ?? "No date selected", partners: partnersTextField.text ?? "No partner given", climbingStyle: styleTableView.climbingStyles[styleTableView.climbingStyleSelectedIndex])
        
        routeTextField.text = ""
        gradeTextField.text = ""
        dateTextField.text = ""
        venueTextField.text = ""
        dateTextField.text = ""
    }
    
    // MARK: Formatting the view
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        logRockClimbViewModel = LogRockClimbViewModel(SQLiteDatabaseServiceFactory.createDbService(), screenNavigationController: SegueNavigationController(self))
        
        createGradePicker()
        createDatePicker()
        styleTableView.setup()
        addKeyboardDismissRecogniser()
        setDoneOnKeyboard()
        
        submitButton.layer.cornerRadius = 5
        routeTextField.backgroundColor = ColorCompatibility.systemGray4
        gradeTextField.backgroundColor = ColorCompatibility.systemGray4
        venueTextField.backgroundColor = ColorCompatibility.systemGray4
        dateTextField.backgroundColor = ColorCompatibility.systemGray4
        partnersTextField.backgroundColor = ColorCompatibility.systemGray4
        styleTableView.backgroundColor = ColorCompatibility.systemGray4
        
        if #available(iOS 13, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .always
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }        
        
        view.accessibilityIdentifier = "logRockClimbView"
        routeTextField.accessibilityIdentifier = "routeTextField"
        gradeTextField.accessibilityIdentifier = "gradeTextField"
        venueTextField.accessibilityIdentifier = "venueTextField"
        dateTextField.accessibilityIdentifier = "dateTextField"
        partnersTextField.accessibilityIdentifier = "partnersTextField"
        styleTableView.accessibilityIdentifier = "climbingStyleTableView"
        
        routeTextField.tag = 1
        gradeTextField.tag = 2
        venueTextField.tag = 3
        dateTextField.tag = 4
        partnersTextField.tag = 5
        
        routeTextField.delegate = self
        gradeTextField.delegate = self
        venueTextField.delegate = self
        dateTextField.delegate = self
        partnersTextField.delegate = self
        
        ///adds observers to readjust the view
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
                
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewLoggedRockClimbSegue" {
            if let rockClimbLoggedViewController = segue.destination as? RockClimbLoggedViewController {
                rockClimbLoggedViewController.rockClimbIdFromSegue = (sender as? Int64)!
            }
        }
    }
    
    func createGradePicker(){
        
        // TODO: Make picker uneditable / enforce validation
        
        gradePicker.setup(withData: logRockClimbViewModel!.rockClimbGrades)
        gradePickerToolbar.setup(doneSelector: #selector(doneGradePicker), cancelSelector: #selector(cancelGradePicker))
        gradeTextField.inputAccessoryView = gradePickerToolbar
        gradeTextField.inputView = gradePicker
    }
    
    @objc func doneGradePicker(){
        let numberOfGrades = gradePicker.numberOfComponents
        
        var extractedGrades:[String] = []
        for componentIndex in 0..<numberOfGrades{
            if let rowTitle = gradePicker.delegate?.pickerView?(gradePicker, titleForRow: gradePicker.selectedRow(inComponent: componentIndex), forComponent: componentIndex)
            {
                extractedGrades.append(rowTitle)
            }
        }
        
        logRockClimbViewModel!.selectGrade(adjectivalGrade: extractedGrades[0], technicalGrade: extractedGrades[1])
        
        gradeTextField.text = logRockClimbViewModel!.gradeText()
        self.view.endEditing(true)
    }
    
    @objc func cancelGradePicker(){
        
        self.view.endEditing(true)
    }
    
    
    func createDatePicker(){
        
        datePicker.formatDatePicker()
        datePickerToolbar.setup(doneSelector: #selector(doneDatePicker), cancelSelector: #selector(cancelDatePicker))
        dateTextField.inputAccessoryView = datePickerToolbar
        dateTextField.inputView = datePicker
    }
    
    @objc func doneDatePicker(){
        let selectedDate =   datePicker.date
        
        dateTextField.text = logRockClimbViewModel!.dateFormatter(date: selectedDate)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1

        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }

        return true
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!

    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }

        scrollView.scrollIndicatorInsets = scrollView.contentInset

    }
    
    func setDoneOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        self.routeTextField.inputAccessoryView = keyboardToolbar
        self.venueTextField.inputAccessoryView = keyboardToolbar
        self.partnersTextField.inputAccessoryView = keyboardToolbar
    }
    
    func addKeyboardDismissRecogniser(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        // Fixes bug where you can't tap on tableview
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.endEditing(true)
        self.view.removeGestureRecognizer(tap)
    }
}

