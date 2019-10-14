//
//  ViewController.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 11/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import UIKit

class LogRockClimbViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var routeTextField: UITextField!
    @IBOutlet weak var gradeTextField: UITextField!
    @IBOutlet weak var venueTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var partnersTextField: UITextField!
    @IBOutlet weak var styleTableView: UITableView!
    @IBOutlet weak var submitButton: UIButton!
    
    // MARK: View formatting
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatView()
    }
    
    func formatView(){
        submitButton.layer.cornerRadius = 5
        styleTableView.layer.cornerRadius = 5
        styleTableView.separatorInset.left = 20
        styleTableView.separatorInset.right = 20
    }
    
    // MARK: TableView


}

