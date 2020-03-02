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
    @IBOutlet weak var playerRolledDiceStack: UIStackView!
    @IBOutlet weak var playerRolledDiceBorder: UIView!
    @IBOutlet weak var opponentRolledDiceStack: UIStackView!
    @IBOutlet weak var opponentRolledDiceBorder: UIView!
    
    var diceFilenames = ["dice-six-faces-one", "dice-six-faces-two", "dice-six-faces-three", "dice-six-faces-four", "dice-six-faces-five", "dice-six-faces-six"]
    
    let typeOfDicePickerAdapter = TypeOfDicePickerViewDelegateAndDataSource()
    let numberOfDicePickerAdapter = NumberOfDicePickerViewDelegateAndDataSource()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
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
        playerRolledDiceBorder.layer.borderWidth = 4
        playerRolledDiceBorder.layer.borderColor = #colorLiteral(red: 0.3977311644, green: 0.2538460667, blue: 0.07798650282, alpha: 1)
        playerRolledDiceBorder.layer.backgroundColor = #colorLiteral(red: 0.6, green: 0.3843137255, blue: 0.1176470588, alpha: 1)
        playerRolledDiceBorder.layer.cornerRadius = 5
        opponentRolledDiceBorder.layer.borderWidth = 4
        opponentRolledDiceBorder.layer.borderColor = #colorLiteral(red: 0.3977311644, green: 0.2538460667, blue: 0.07798650282, alpha: 1)
        opponentRolledDiceBorder.layer.backgroundColor = #colorLiteral(red: 0.6, green: 0.3843137255, blue: 0.1176470588, alpha: 1)
        opponentRolledDiceBorder.layer.cornerRadius = 5
        displayDice(for: 0, dice: [0,1,2,3])
        displayDice(for: 1, dice: [1,2,3])
    }
    
    func displayDice(for player: Int, dice:[Int]) {
            for die in dice {
                let image = UIImageView(image: UIImage(named: diceFilenames[die]))
                image.frame.size = CGSize(width: 10, height: 10)
                image.contentMode = .scaleAspectFit

                if player == 0 {
                    playerRolledDiceStack.addArrangedSubview(image)
                }
                else if player == 1 {
                    opponentRolledDiceStack.addArrangedSubview(image)
                }
            }
    }
}

