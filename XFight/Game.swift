//
//  Game.swift
//  XFight
//
//  Created by SayajinPapuru on 10/01/2019.
//  Copyright © 2019 HanAyyubInc. All rights reserved.
//

import Foundation

class Game {
    var names = [String]()
    var teamNames = [Team]()
    var charactersName = [String]()
    
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
    
    func getName() {
        print("Please enter your name")
        if let playerName = readLine() {
        print("Welcome \(playerName)")
        }
    }
    
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
    
    
    func chooseCharacter() {
        var characters = [Character]()
        var choice = 0
        var charactersName = ""
        
     
        repeat{
            
            for i in 1...3 {
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
            let magus = Magus()
            characters.append(magus)
        case 2:
            let warrior = Warrior()
            characters.append(warrior)
        case 3:
            let colossus = Colossus()
            characters.append(colossus)
        case 4:
            let dwarf = Dwarf()
            characters.append(dwarf)
        default:
            break
        }
        
        for i in 1...3 {
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
            let attacker = Magus()
            print(" You choosed \(attacker)")
        case 2:
            let attacker = Warrior()
            print(" You choosed \(attacker)")
        case 3:
            let attacker = Colossus()
            print(" You choosed \(attacker)")
        case 4:
            let attacker = Dwarf()
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
            let ennemy = Magus()
            print(" You choosed \(ennemy)")
            
        case 2:
            let ennemy = Warrior()
            print(" You choosed \(ennemy)")
        case 3:
            let ennemy = Colossus()
            print(" You choosed \(ennemy)")
        case 4:
            let ennemy = Dwarf()
            print(" You choosed \(ennemy)")
        default:
            break
            
        }

    }
    
    
    func magicChest(characters: Character) {
        var randomChest = Int.random(in: 0..<6)
    
        repeat{
            
        print("Lucky you !!, choose a number between 1 and 4 and open the magic Chest")
        randomChest = checkInteger()
        
        } while randomChest != 1 && randomChest != 2 && randomChest != 3 && randomChest != 4
        
        switch randomChest {
        case 1:
            print("Congratulation you found the Sword of Eternity !")
            characters.charactersArm = SwordOfEternity()
        case 2:
            print(" You recieved a source of pure water")
            characters.lifePoint += 30
        case 3:
            print("A present from the ghost of sparte, the legendary Leviathan")
            characters.charactersArm = LegendaryLeviathan()
        case 4:
           print("Sorry nothing for you bruh")
        case 5:
            print("WONDERFULL !! You got the Suprem Scepter Of Time. It allows you to increase your power but you'll pay with your life")
            characters.charactersArm = SupermScepterOfTime()
            characters.lifePoint -= 17
            
            if characters.lifePoint <= 0 {
                print("You didn't had enough power to control the Suprem Scepter Of Time, sorry but you're dead")
                
            }
        case 6:
            let ennemy = Colossus()
            print("You found a Supra Laser killer of Giants")
            if ennemy.lifePoint > 0 {
                ennemy.lifePoint -= 100
            }
            if ennemy.lifePoint <= 0 {
                print("The Supra Laser is so effective !!! the Colossus is dead")
            }
            
        default:
            break
            
        }
        
    }
    
    func welcome() {
        print("Welcome to XFight, a game which confronts two players to the death. Each player have to create a team and choose 3 characters then fight for your life")
        
    }
}
