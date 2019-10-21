//
//  CustomDatePicker.swift
//  BMG
//
//  Created by Andrew Wilson-Jones on 18/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

class CustomDatePicker: UIDatePicker{
    
    func formatDatePicker(){
        
        self.datePickerMode = .date
        self.locale = .current
    }
}
