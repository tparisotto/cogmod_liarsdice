//
//  ViewController.swift
//  Liar's Dice
//
//  Created by Tommaso Parisotto on 14/02/2020.
//  Copyright © 2020 CogMod. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var typeOfDicePicker: UIPickerView!
    @IBOutlet weak var numberOfDicePicker: UIPickerView!
    @IBOutlet weak var betButton: UIButton!
    @IBOutlet weak var playerHandView: UIImageView!
    @IBOutlet weak var opponentHandView: UIImageView!
    @IBOutlet weak var opponentBetTypeOfDiceView: UIImageView!
    @IBOutlet weak var opponentBetNumberOfDiceView: UILabel!
    
    let typeOfDicePickerAdapter = TypeOfDicePickerViewDelegateAndDataSource()
    let numberOfDicePickerAdapter = NumberOfDicePickerViewDelegateAndDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Aesthetic stuff
        betButton.layer.cornerRadius = 5
        
        // Normally the delegate and data source would be implemented in this controller but we need 2 of each
        
        print(typeOfDicePickerAdapter.pickerView(numberOfDicePicker, numberOfRowsInComponent: 10))
        // Connect data:
        self.typeOfDicePicker.delegate = typeOfDicePickerAdapter
        self.typeOfDicePicker.dataSource = typeOfDicePickerAdapter
        self.typeOfDicePicker.setValue(UIColor.white, forKeyPath: "textColor")
        
        // Connect data:
        self.numberOfDicePicker.delegate = numberOfDicePickerAdapter
        self.numberOfDicePicker.dataSource = numberOfDicePickerAdapter
        self.numberOfDicePicker.setValue(UIColor.white, forKeyPath: "textColor")
        
        self.opponentBetNumberOfDiceView.text = "3"
        self.opponentBetTypeOfDiceView = UIImageView(image: UIImage(named: "dice-six-faces-six")!)
    }

}

