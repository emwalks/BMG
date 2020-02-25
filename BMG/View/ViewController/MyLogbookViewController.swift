//
//  LogbookViewController.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 14/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

class MyLogbookViewController: UITableViewController, LogbookScreenProtocol {
    
    var logbookViewModel: LogbookViewModel? = nil
    var arrayOfRockClimbsFromVM: Array<RockClimbEntry> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.accessibilityIdentifier = "logbookScreen"
        
        if let logbookViewModel = logbookViewModel {
           arrayOfRockClimbsFromVM = logbookViewModel.retrieveAllRockClimbData()
        }
        
    }
    
 
    func userWantsToSeeRowAt(index: Int) -> RockClimbEntry {
            return arrayOfRockClimbsFromVM[index]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfRockClimbsFromVM.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rockClimbLogbookCell = tableView.dequeueReusableCell(withIdentifier: "RockClimbCell", for: indexPath)
        
        let rockClimbEntry = userWantsToSeeRowAt(index: indexPath.row)
        
        rockClimbLogbookCell.textLabel?.text = "Route: \(rockClimbEntry.routeName)"
        rockClimbLogbookCell.detailTextLabel?.text = """
        Grade: \(rockClimbEntry.grade)
        Style: \(rockClimbEntry.climbingStyle)
        """
        
        rockClimbLogbookCell.backgroundColor = ColorCompatibility.systemGray4
        rockClimbLogbookCell.textLabel?.accessibilityIdentifier = "cellTitleText"
        rockClimbLogbookCell.detailTextLabel?.accessibilityIdentifier = "cellDetailText"
        rockClimbLogbookCell.accessoryView?.accessibilityIdentifier = "disclosureAccessory"
        
        return rockClimbLogbookCell
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let rockClimbEntry = userWantsToSeeRowAt(index: indexPath.row)
        
        let idOfSelectedClimb = rockClimbEntry.climbId
        logbookViewModel?.idOfRockClimbSelected = idOfSelectedClimb
        logbookViewModel?.showRockClimbDetails()

    }
        
}
