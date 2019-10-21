//
//  LogRockClimbTableView.swift
//  BMG
//
//  Created by Andrew Wilson-Jones on 18/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

class ClimbingStylesTableView : UITableView, UITableViewDataSource, UITableViewDelegate{
    
    let climbingStyles = ["Led","Alternate","Second"]
    var climbingStyleSelectedIndex = 0
    
    func setup(){
        
        self.delegate = self
        self.dataSource = self
        self.layer.cornerRadius = 5
        self.separatorInset.left = 20
        self.separatorInset.right = 20
    }
    
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
