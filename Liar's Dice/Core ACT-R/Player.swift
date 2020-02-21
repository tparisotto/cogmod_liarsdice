//
//  Player.swift
//  Liar's Dice
//
//  Created by Tommaso Parisotto on 14/02/2020.
//  Copyright © 2020 CogMod. All rights reserved.
//

import Foundation

class Player
{
    let startingNumberOfDice = 6
    var numberOfDiceInHand: Int
    var hand: [Dice] = []
    
    init()
    {
        self.numberOfDiceInHand = self.startingNumberOfDice
        for _ in 0..<startingNumberOfDice { self.hand.append(Dice()) }
    }
    
    func loseDice()
    {
        if numberOfDiceInHand < 1
        {
            print("Error: attempting to remove dice with 0 dice in hand.")
        }
        else
        {
            self.hand.removeLast()
            self.numberOfDiceInHand -= 1
        }
    }
    
    func addDice()
    {
        self.hand.append(Dice())
        self.numberOfDiceInHand += 1
    }
    
    func rollHand()
    {
        for index in 0..<numberOfDiceInHand { _ = self.hand[index].roll() }
    }
    
    func getNumberOfDice() -> Int
    {
        return self.numberOfDiceInHand
    }
    
    func getRollNumber(roll: Int) -> Int
    {
        var result = 0
        for dice in hand
        {
            if dice.faceValue == roll
            {
                result += 1
            }
        }
        return result
    }
}
