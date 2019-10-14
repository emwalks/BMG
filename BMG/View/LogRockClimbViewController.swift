//
//  ViewController.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 11/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import UIKit

class LogRockClimbViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let climbingStyles = ["Led","Alternate","Seconded"]
    
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
        styleTableView.dataSource = self
        styleTableView.delegate = self
    }
    
    func formatView(){
        submitButton.layer.cornerRadius = 5
        styleTableView.layer.cornerRadius = 5
        styleTableView.separatorInset.left = 20
        styleTableView.separatorInset.right = 20
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
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}

