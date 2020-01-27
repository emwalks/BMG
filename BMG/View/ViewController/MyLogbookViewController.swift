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
    var arrayOfRockClimbsFromDb: Array<RockClimbEntry> = []
    
    func allRockClimbDataPresented(arrayOfRockClimbs: Array<RockClimbEntry>) {
        arrayOfRockClimbsFromDb = arrayOfRockClimbs
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfRockClimbsFromDb.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rockClimbLogbookCell = tableView.dequeueReusableCell(withIdentifier: "RockClimbCell", for: indexPath)
        
        rockClimbLogbookCell.textLabel?.text = "Route: \(arrayOfRockClimbsFromDb[indexPath.row].routeName)"
        rockClimbLogbookCell.detailTextLabel?.text = """
        Grade: \(arrayOfRockClimbsFromDb[indexPath.row].grade)
        Style: \(arrayOfRockClimbsFromDb[indexPath.row].climbingStyle)
        """
        rockClimbLogbookCell.backgroundColor = ColorCompatibility.systemGray4
        rockClimbLogbookCell.textLabel?.accessibilityIdentifier = "cellTitleText"
        rockClimbLogbookCell.detailTextLabel?.accessibilityIdentifier = "cellDetailText"
        
        return rockClimbLogbookCell
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.accessibilityIdentifier = "logbookView"
       
        logbookViewModel = LogbookViewModel(SQLiteDatabaseServiceFactory.createDbService(), logbookScreen: self, screenNavigationController: SegueNavigationController(self))
    }
    
}
