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
    func thereAreThisManyRows(count: Int) {
        
    }
    
    func addObserver(obs: LogbookScreenProtocolListener) {
        
    }
    
    
    var logbookViewModel: LogbookViewModel? = nil
    var arrayOfRockClimbsFromDb: Array<RockClimbEntry> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.accessibilityIdentifier = "logbookView"
        
        logbookViewModel = LogbookViewModel(SQLiteDatabaseServiceFactory.createDbService(), logbookScreen: self, screenNavigationController: SegueNavigationController(self))
    }
    
    func allRockClimbDataPresented(arrayOfRockClimbs: Array<RockClimbEntry>) {
        arrayOfRockClimbsFromDb = arrayOfRockClimbs
    }
    
    func userWantsToSeeRowAt(index: Int) -> RockClimbEntry {
            return arrayOfRockClimbsFromDb[index]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfRockClimbsFromDb.count
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
    
    //this is the same code as in LogRockClimbViewController - consider moving/re-purposing?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewLoggedRockClimbSegue" {
            if let rockClimbLoggedViewController = segue.destination as? RockClimbLoggedViewController {
                rockClimbLoggedViewController.rockClimbIdFromSegue = (sender as? Int64)!
            }
        }
    }
    
}
