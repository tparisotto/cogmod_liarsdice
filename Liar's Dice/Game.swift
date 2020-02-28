//
//  Game.swift
//  Liar's Dice
//
//  Created by Tommaso Parisotto on 21/02/2020.
//  Copyright © 2020 CogMod. All rights reserved.
//

import Foundation

class Game
{
    var turnsPlayed: Int
    let player = Player()
    let opponent = Player()
    let players: [Player]
    var diceInGame: Int
    var currentBidRoll: Int
    var currentBidNumber: Int
    
    init()
    {
        turnsPlayed = 0
        player.rollHand()
        opponent.rollHand()
        diceInGame = player.getNumberOfDice() + opponent.getNumberOfDice()
        currentBidRoll = 0
        currentBidNumber = 0
        players = [player, opponent]
    }
    
    func bid(bidRoll: Int, bidNumber: Int) -> Int
    {
        if (bidNumber < currentBidNumber)
        {
            print("[Error] Can't bid less than previous turns.")
            return -1
        }
        else if (bidNumber == currentBidNumber)
        {
            if (bidRoll < currentBidRoll)
            {
                print("[Error] Can't bid a roll lower than previous turns.")
                return -1
            }
            else
            {
                currentBidNumber = bidNumber
                currentBidRoll = bidRoll
                turnsPlayed += 1
                return 1
            }
        }
        else
        {
            currentBidNumber = bidNumber
            currentBidRoll = bidRoll
            turnsPlayed += 1
            return 1
        }
    }
    
    func playerCallsLiar()
    {
        var sumRolls = 0
        let target = opponent
        let caller = player
        
        for pl in players
        {
            sumRolls += pl.getRollNumber(roll: currentBidRoll)
        }
        // player calls a wrong bluff
        if sumRolls > currentBidNumber
        {
            target.loseDice()
        }
        else
        // opponent was bluffing
        {
            caller.loseDice()
        }
    }
    
    func opponentCallsLiar()
    {
        var sumRolls = 0
        let target = player
        let caller = opponent
        
        for pl in players
        {
            sumRolls += pl.getRollNumber(roll: currentBidRoll)
        }
        // player calls a wrong bluff
        if sumRolls > currentBidNumber
        {
            target.loseDice()
        }
        else
        // opponent was bluffing
        {
            caller.loseDice()
        }
    }
    
    func isOver() -> Bool {
        if player.getNumberOfDice() == 0 {return true}
        if opponent.getNumberOfDice() == 0 {return true}
        return false
    }
    
    func roll()
    {
        for pl in players {pl.rollHand()}
    }
}
