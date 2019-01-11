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
    
    
    func checkString() -> String {
        guard let stringChoice = readLine() else { return String()}
        return stringChoice
    }
    
    func checkInteger() -> Int {
        guard let input = readLine() else { return 0}
        guard let intInput = Int(input) else { return 0}
        return intInput
    }
    
    var names = [String]()
    
    func getName() {
        print("Hello and welcome to X Fight, its a game which confronts two players to the death")
        
        print("Please enter your name")
        if let playerName = readLine() {
            print("Welcome \(playerName)")
        }
    }
    var teamNames = [Team]()
    
    func createTeam() -> Team {
        
        var teamName = " "
        
        print("Please name your team")
        
        teamName = checkString()
        
        if teamName.contains(teamName) {
            print("Choose another name")
        } else {
            teamName.append(teamName)
        }
        
        let myTeam = Team(teamName: teamName)
        return myTeam
        
        
    }
    
    var charctersName = [String]()
    
    func chooseCharacter() {
        var charactersName = " "
        var characters = [Character]()
        
        print("Please choose 3 characters within the fighters"
            + "\n1. Magus"
            + "\n2. Warrior"
            + "\n3. Coloosus"
            + "\n4. Dwarf")
        let choice = checkInteger()
        
        switch choice {

        case 1:
            print("You have choosed the Magus")
        case 2:
            print("The Warrior never surrender")
        case 3:
            print("The Colossus, a giant of clay")
        case 4:
            print("Well..good luck")
            
        default:
            break
            
        }
        
        print("Name your character")
        charactersName = checkString()
        
        if charactersName.contains(charactersName) {
            print("Name already taken")
        } else {
            charactersName.append(charactersName)
        }
    
    return
    }
}
