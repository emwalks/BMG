//
//  CustomDatePickerToolbar.swift
//  BMG
//
//  Created by Andrew Wilson-Jones on 18/10/2019.
//  Copyright © 2019 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

class CustomDatePickerToolbar: UIToolbar{
    
    func formatToolbar(doneSelector: Selector, cancelSelector: Selector){
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self.superview, action: doneSelector);
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self.superview, action: cancelSelector);
        self.barStyle = .default
        self.setItems([doneButton,spaceButton,cancelButton], animated: false)
        self.sizeToFit()
    }
}
