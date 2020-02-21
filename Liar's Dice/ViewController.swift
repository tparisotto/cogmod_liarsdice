//
//  ViewController.swift
//  Liar's Dice
//
//  Created by Tommaso Parisotto on 14/02/2020.
//  Copyright © 2020 CogMod. All rights reserved.
//

import UIKit

// color scheme
// green       006600
// light brown 99621E
// dark brown  2F1000

class ViewController: UIViewController {
    
    @IBOutlet weak var typeOfDicePicker: UIPickerView!
    @IBOutlet weak var numberOfDicePicker: UIPickerView!
    @IBOutlet weak var betButton: UIButton!
    @IBOutlet weak var callBluffButton: UIButton!
    @IBOutlet weak var playerCupView: UIImageView!
    @IBOutlet weak var opponentCupView: UIImageView!
    @IBOutlet weak var opponentBetTypeOfDiceView: UIImageView!
    @IBOutlet weak var opponentBetNumberOfDiceView: UILabel!
    
    let typeOfDicePickerAdapter = TypeOfDicePickerViewDelegateAndDataSource()
    let numberOfDicePickerAdapter = NumberOfDicePickerViewDelegateAndDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Aesthetic stuff
        betButton.layer.cornerRadius = 5
        callBluffButton.layer.cornerRadius = 5
        
        // Connect data:
        self.typeOfDicePicker.delegate = typeOfDicePickerAdapter
        self.typeOfDicePicker.dataSource = typeOfDicePickerAdapter
        self.typeOfDicePicker.setValue(UIColor.white, forKeyPath: "textColor")
        
        self.numberOfDicePicker.delegate = numberOfDicePickerAdapter
        self.numberOfDicePicker.dataSource = numberOfDicePickerAdapter
        self.numberOfDicePicker.setValue(UIColor.white, forKeyPath: "textColor")
        
        self.opponentBetNumberOfDiceView.text = "3"
        self.opponentBetTypeOfDiceView.image = UIImage(named: "dice-six-faces-six")!
    }

}

