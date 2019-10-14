//
//  ViewController.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 11/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import UIKit

class LogRockClimbViewController: UIViewController {
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var routeTextField: UITextField!
    
    @IBOutlet weak var styleTableView: UITableView!
    
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


}

