//
//  Main.swift
//  Liar's Dice
//
//  Created by Tommaso Parisotto on 28/02/2020.
//  Copyright © 2020 CogMod. All rights reserved.
//

import Foundation

class Main
{
    enum State {
        case start
        case playerTurn
        case opponentTurn
        case liar
        case finished
        case error
    }
    enum CurrentPlayer : CaseIterable {
        case player
        case opponent
    }
    
    var gamestate : State
    var game : Game
    var currentPlayer : CurrentPlayer

    
    init()
    {
        gamestate = .start
        game = Game()
        currentPlayer = CurrentPlayer.allCases.randomElement()!
    }
    
    func play()
    {
        while self.gamestate != .finished
        {
            switch gamestate {
            
                
            case .start:
                print("[INFO] The round is started.")
                print("[INFO] Rolling the dice.")
                game.roll()
                switch currentPlayer {
                case .player:
                    gamestate = .playerTurn
                    print("[INFO] Player starts.")
                case .opponent:
                    gamestate = .opponentTurn
                    print("[INFO] Opponent starts.")
                }
                

            case .playerTurn:
                print("[INFO] Bidding phase.")
                
                // TODO: update with link to GUI
                var bidAccepted = false
                var answerAccepted = false
                
                while (!answerAccepted)
                {
                    print("Do you want to call the opponent a liar?")
                    if let answer = readLine()
                    {
                        let answer_lc = answer.lowercased()
                        if answer_lc == "yes"
                        {
                            gamestate = .liar
                        }
                        else if answer_lc == "no"
                        {
                            answerAccepted = true
                        }
                    }
                    print("[ERROR] Invalid answer.")
                }
                while (!bidAccepted)
                {
                    print("Insert Roll bid:")
                    if let bidRoll = Int(readLine(strippingNewline: true)!)
                    {
                        print("Insert Number of dice bid:")
                        if let bidNum = Int(readLine(strippingNewline: true)!)
                        {
                            if game.bid(bidRoll: bidRoll, bidNumber: bidNum) < 0
                            {
                                continue
                            }
                            else
                            {
                                print(String(format:"[INFO] Player bids Roll:%i, %i", bidRoll, bidNum))
                                bidAccepted = true
                            }
                        }
                        else
                        {
                            print("[ERROR] Invalid bid.")
                        }
                    }
                    else
                    {
                        print("[ERROR] Invalid bid.")
                    }
                }
                currentPlayer = .opponent
                gamestate = .opponentTurn
                
                
                
            case .liar:
                switch currentPlayer {
                case .player:
                    print("[INFO] Player calls opponent a Liar.")
                    game.playerCallsLiar()
                case .opponent:
                    print("[INFO] Opponent calls player a Liar.")
                    game.opponentCallsLiar()
                }
                if game.isOver() { gamestate = .finished }
                else { gamestate = .start }
                    
                
                
            case .opponentTurn:
                // TODO: implement model
                let bidRoll = Int.random(in: 1...6)
                let bidNum = game.currentBidNumber+1
                _ = game.bid(bidRoll: bidRoll, bidNumber: bidNum)
                print(String(format:"[INFO] Opponent bids Roll:%i, %i", bidRoll, bidNum))
                gamestate = .playerTurn
                
                
                
                
            case . finished:
                print("[INFO] The game has ended.")
                exit(0)
            case .error:
                print("[ERROR] Exit.")
                exit(0)
            
            }
        }
    }
    
    
    
}
