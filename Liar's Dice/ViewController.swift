//
//  ViewController.swift
//  Liar's Dice
//
//  Created by Tommaso Parisotto on 14/02/2020.
//  Copyright © 2020 CogMod. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // the number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // number of columns
        // could probably be 2 but I'm not sure I can mix text and images
        return 1
    }
    
    // the number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    @IBOutlet weak var numberOfDicePicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.numberOfDicePicker.delegate = self
        self.numberOfDicePicker.dataSource = self
        
        pickerData = ["1", "2", "3", "4", "5", "6"]
        
    }


}

