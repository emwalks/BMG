//
//  GradePickerView.swift
//  BMG
//
//  Created by Andrew Wilson-Jones on 21/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

class GradePickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var pickerData:[[String]] = [[]]
    
    func setup(withData data:[[String]]){
        pickerData = data
        self.delegate = self
        self.dataSource = self
        self.reloadAllComponents()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[component][row]
    }
}
