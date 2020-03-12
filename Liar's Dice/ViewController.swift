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
    @IBOutlet weak var menuButton: UIButton!
    
    // Start from index 1
    // Note that index 0 is just a filler so we don't have errors
    var diceFilenames = ["dice-six-faces-one-star-filled","dice-six-faces-one-star-filled", "dice-six-faces-two-filled", "dice-six-faces-three-filled", "dice-six-faces-four-filled", "dice-six-faces-five-filled", "dice-six-faces-six-filled"]
    
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
        menuButton.layer.cornerRadius = 5
        
        playerRolledDiceBorder.layer.borderWidth = 4
        playerRolledDiceBorder.layer.borderColor = #colorLiteral(red: 0.3977311644, green: 0.2538460667, blue: 0.07798650282, alpha: 1)
        playerRolledDiceBorder.layer.backgroundColor = #colorLiteral(red: 0.6, green: 0.3843137255, blue: 0.1176470588, alpha: 1)
        playerRolledDiceBorder.layer.cornerRadius = 5
        
        opponentRolledDiceBorder.layer.borderWidth = 4
        opponentRolledDiceBorder.layer.borderColor = #colorLiteral(red: 0.3977311644, green: 0.2538460667, blue: 0.07798650282, alpha: 1)
        opponentRolledDiceBorder.layer.backgroundColor = #colorLiteral(red: 0.6, green: 0.3843137255, blue: 0.1176470588, alpha: 1)
        opponentRolledDiceBorder.layer.cornerRadius = 5
                
        // Connect data:
        self.numberOfDicePicker.delegate = numberOfDicePickerAdapter
        self.numberOfDicePicker.dataSource = numberOfDicePickerAdapter
        self.numberOfDicePicker.setValue(UIColor.white, forKeyPath: "textColor")
//        self.numberOfDicePicker.isHidden = true
        
        self.typeOfDicePicker.delegate = typeOfDicePickerAdapter
        self.typeOfDicePicker.dataSource = typeOfDicePickerAdapter
        self.typeOfDicePicker.setValue(UIColor.white, forKeyPath: "textColor")
//        self.typeOfDicePicker.isHidden = true
        
        displayDice(for: 0, dice: [1,4,3])
        displayDice(for: 1, dice: [1,2,3])
        displayAvailablePlayerBetDice(dice: [1,3])
        displayAvailablePlayerBetNumbers(numbers: [2,4])
    }
    
    // Player 0 is user
    // Other players are AI opponents
    // Will probably need a switch statement
    // TODO: Add empty dice images
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
    
    // Display the number and die that the opponent has bet
    func displayOpponentBet(number:Int, die:Int) {
        opponentBetNumberOfDiceView.text = String(number)
        opponentBetTypeOfDiceView.image = UIImage(named: diceFilenames[die])
    }
    
    // Update the scroll view showing the bet numbers available for the human player
    func displayAvailablePlayerBetNumbers(numbers: [Int]) {
        numberOfDicePickerAdapter.numberOfDicePickerData = numbers
        self.numberOfDicePicker.isHidden = false
        numberOfDicePicker.reloadAllComponents()
    }
    
    // Update the scroll view showing the bet dice available for the human player
    func displayAvailablePlayerBetDice(dice: [Int]) {
        var imageArray = [UIImage]()
        for die in dice {
            imageArray.append(UIImage(named: diceFilenames[die])!)
        }
        typeOfDicePickerAdapter.imageArray = imageArray
        self.typeOfDicePicker.isHidden = false
        typeOfDicePicker.reloadAllComponents()
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?){
        if motion == .motionShake {
            print("Shake Gesture Detected")
            //show some alert here
        }
    }
}

