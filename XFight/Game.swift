//
//  Game.swift
//  XFight
//
//  Created by SayajinPapuru on 10/01/2019.
//  Copyright © 2019 HanAyyubInc. All rights reserved.
//

import Foundation

class Game {
    
    func start() {
        print("Welcome to XFight, a game which confronts two players to the death. Each player have to create a team and choose 3 characters then fight for your life")
    }
    
    
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
    
    var charactersName = [String]()
    
    func chooseCharacter() {
        var characters = [Character]()
        var choice = 0
        
        repeat{
            
            for i in 1..<4 {
            print("Choose your character number \(i) within the fighters by entering number 1 to 4"
                + "\n1. Magus"
                + "\n2. Warrior"
                + "\n3. Colossus"
                + "\n4. Dwarf")
            
            choice = checkInteger()
            
           }

        } while choice != 1 && choice != 2 && choice != 3 && choice != 4
        
        switch choice {
        case 1:
            let magus = Magus.init()
            characters.append(magus)
        case 2:
            let warrior = Warrior.init()
            characters.append(warrior)
        case 3:
            let colossus = Colossus.init()
            characters.append(colossus)
        case 4:
            let dwarf = Dwarf.init()
            characters.append(dwarf)
        default:
            break
        }
    }

    func nameCharacter() {
        var charactersName = ""
            
            for i in 1..<4 {
        print("Name your character \(i)")
        
        charactersName = checkString()
        
        charactersName.append(charactersName)
        }
    


    }
    
    
    func chooseAttacker() {
        var attacker = 0
        var ennemy = 0
        print("Please choose your fighter"
            + "\n1. Magus"
            + "\n2. Warrior"
            + "\n3. Colossus"
            + "\n4. Dwarf")
        
           attacker = checkInteger()
        
        switch attacker {
        case 1:
            let attacker = Magus.init()
            print(" You choosed \(attacker)")
        case 2:
            let attacker = Warrior.init()
            print(" You choosed \(attacker)")
        case 3:
            let attacker = Colossus.init()
            print(" You choosed \(attacker)")
        case 4:
            let attacker = Dwarf.init()
            print(" You choosed \(attacker)")
        default:
            break
        }
        
        
            print("Please choose the ennemy to attack"
                + "\n1. Magus"
                + "\n2. Warrior"
                + "\n3. Colossus"
                + "\n4. Dwarf")
            
          ennemy = checkInteger()
        
        switch ennemy {
        case 1:
            let ennemy = Magus.init()
            print(" You choosed \(ennemy)")
            
        case 2:
            let ennemy = Warrior.init()
            print(" You choosed \(ennemy)")
        case 3:
            let ennemy = Colossus.init()
            print(" You choosed \(ennemy)")
        case 4:
            let ennemy = Dwarf.init()
            print(" You choosed \(ennemy)")
        default:
            break
            
        }

    }
        
        func attackEnnemi(attacker: Character, ennemy: Character) {
            
            if attacker.lifePoint > 0 {
                if ennemy.lifePoint > 0 {
                    ennemy.lifePoint -= attacker.charactersArm.power
                    
                    print("\(attacker) launched an attack on \(ennemy) and made \(attacker.charactersArm.power) damages")
                    
                    if ennemy.lifePoint <= 0 {
                        print("\(ennemy) is dead")
                    } else {
                        print("Come on ! Fight !")
                    }
                }
                
            }
        }
        
}

