//
//  ViewController.swift
//  Liar's Dice
//
//  Created by Tommaso Parisotto on 14/02/2020.
//  Copyright © 2020 CogMod. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var typeOfDicePicker: UIPickerView!
    @IBOutlet weak var numberOfDicePicker: UIPickerView!
    @IBOutlet weak var betButton: UIButton!
    
    var numberOfDicePickerData: [String] = [String]()
    var typeOfDicePickerData: [String] = [String]()
    
    // the number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == numberOfDicePicker {
            // number of columns
            // could probably be 2 but I'm not sure I can mix text and images
            return 1
        } else if pickerView == typeOfDicePicker {
            return 1
        }
        return 0
    }
    
    // the number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == numberOfDicePicker {
            return numberOfDicePickerData.count
        } else if pickerView == typeOfDicePicker{
            return typeOfDicePickerData.count
        }
        return 0
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == numberOfDicePicker {
            return numberOfDicePickerData[row]
        } else if pickerView == typeOfDicePicker {
            return typeOfDicePickerData[row]
        }
        return "?"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        betButton.layer.cornerRadius = 5
        
        // Connect data:
        self.typeOfDicePicker.delegate = self
        self.typeOfDicePicker.dataSource = self
        
        self.typeOfDicePicker.setValue(UIColor.white, forKeyPath: "textColor")
        typeOfDicePickerData = ["1", "2", "3", "4", "5", "6"]
        
        // Connect data:
        self.numberOfDicePicker.delegate = self
        self.numberOfDicePicker.dataSource = self
        
        self.numberOfDicePicker.setValue(UIColor.white, forKeyPath: "textColor")
        numberOfDicePickerData = ["1", "2", "3", "4", "5", "6"]
        
    }


}

