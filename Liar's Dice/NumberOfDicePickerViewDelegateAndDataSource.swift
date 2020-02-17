//
//  NumberOfRowsPickerViewDelegateAndDataSource.swift
//  Liar's Dice
//
//  Created by A. Miculita on 17/02/2020.
//  Copyright © 2020 CogMod. All rights reserved.
//

import UIKit

class NumberOfDicePickerViewDelegateAndDataSource: NSObject, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    public var numberOfDicePickerData = ["1", "2", "3", "4", "5", "6"]
    
    // the number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // the number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print("hi")
        return numberOfDicePickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print("hi")
        return numberOfDicePickerData[row]
    }
}
