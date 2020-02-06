//
//  LogbookScreenProtocol.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 17/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

protocol LogbookScreenProtocol {
    //del me
    func allRockClimbDataPresented(arrayOfRockClimbs: Array<RockClimbEntry>)
    
    func thereAreThisManyRows(count : Int)
    
    func addObserver(obs : LogbookScreenProtocolListener)
    
}

protocol LogbookScreenProtocolListener {
    func userWantsToSeeRowAt(index: Int) -> RockClimbEntry
    func userSelectedRowAt(index : Int)
}
