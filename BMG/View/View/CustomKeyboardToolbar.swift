//
//  CustomKeyboardToolbar.swift
//  BMG
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 29/01/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

import UIKit

class CustomKeyboardToolbar: UIToolbar {
    
    func setup(doneSelector: Selector, cancelSelector: Selector){
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self.superview, action: doneSelector);
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self.superview, action: cancelSelector);
        self.barStyle = .default
        self.setItems([cancelButton,spaceButton,doneButton], animated: false)
        self.sizeToFit()
    }
}
