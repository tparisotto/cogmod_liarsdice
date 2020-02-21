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
    
    func bid(player: Player, bidRoll: Int, bidNumber: Int)
    {
        if (bidNumber < currentBidNumber)
        {
            print("[Error] Can't bid less than previous turns.")
        }
        else if (bidNumber == currentBidNumber)
        {
            if (bidRoll < currentBidRoll)
            {
                print("[Error] Can't bid a roll lower than previous turns.")
            }
            else
            {
                currentBidNumber = bidNumber
                currentBidRoll = bidRoll
                turnsPlayed += 1
            }
        }
        else
        {
            currentBidNumber = bidNumber
            currentBidRoll = bidRoll
            turnsPlayed += 1
        }
    }
    
    func callsLiar(target: Player, caller: Player)
    {
        var sumRolls = 0
        for pl in players
        {
            sumRolls += pl.getRollNumber(roll: currentBidRoll)
        }
        // Caller calls a wrong bluff
        if sumRolls > currentBidNumber
        {
            target.loseDice()
        }
        else
        // Target was bluffing
        {
            caller.loseDice()
        }
    }
}
