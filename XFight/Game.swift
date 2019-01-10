//
//  Game.swift
//  XFight
//
//  Created by SayajinPapuru on 10/01/2019.
//  Copyright © 2019 HanAyyubInc. All rights reserved.
//

import Foundation

class Game {
    
    func start() {}
    
    func getName() {
        print("Hello and welcome to X Fight, its a game which confronts two players to the death")
        
        print("Please enter the first player's name")
        if let playerName = readLine() {
            print("Welcome \(playerName)")
        }
    }
    
    
    var charac = ["Magus": 0, "Warrior": 1, "Colossus": 2, "Dwarf": 3]
    func chooseCharacter() {
        
        func checkString() -> String {
            guard let choice = readLine() else { return String()}
            return choice
        }
        
        var numberOfCharacters = 0
        print("Please choose 3 characters"
            + "\n1. Magus: powerfull healer"
            + "\n2. Warrior: He never surrender"
            + "\n3. Colossus: Giant with feet of clay"
            + "\n4. Dwarf: Don't underestimate him")
        
        if let choice = readLine() {
            switch choice {
            case "1":
                print("You have choosed the Magus")
            case "2":
                print("The Colossus have been choosed")
            case "3":
                print("The Warrior is yours now")
            case "4":
                print("Well..good luck")
            default:
                return
            }
        }
        numberOfCharacters += 1
        repeat {
            if let choice = readLine() {
                switch choice {
                case "1":
                    print("You have choosed the Magus")
                case "2":
                    print("The Colossus have been choosed")
                case "3":
                    print("The Warrior is yours now")
                case "4":
                    print("Well..good luck")
                default:
                    return
                }
            }
        }while numberOfCharacters < 3
        
        
    }
    
}
