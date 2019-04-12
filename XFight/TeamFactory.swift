//
//  TeamFactory.swift
//  XFight
//
//  Created by SayajinPapuru on 29/01/2019.
//  Copyright © 2019 HanAyyubInc. All rights reserved.
//

import Foundation

class TeamFactory {
    
    var teams = [Team]()
    var uniqueTeamNames = [String]()
    var uniqueCharactersNames = [String]()
    let numberOfCharacter = 3
    let numberOfTeam = 2
    
    func checkString() -> String {
        guard let stringChoice = readLine() else { return String()}
        return stringChoice
    }
    
    func checkInteger() -> Int {
        guard let input = readLine() else { return 0}
        guard let intInput = Int(input) else { return 0}
        return intInput
    }
    func uniqueCharacterName() -> String {
        var uniqueCharacterName = ""
        repeat {
            
            
            print("")
            print("Name your Character")
            uniqueCharacterName = checkString()
            if uniqueCharactersNames.contains(uniqueCharacterName) {
                uniqueCharacterName = ""
                print("")
                print("Please choose anaother name")
            } else {
                uniqueCharactersNames.append(uniqueCharacterName)
                print("")
                print("Your character's name is" + " " + uniqueCharacterName + " " + "now")
            }
            
            
        } while uniqueCharacterName == ""
        return uniqueCharacterName
    }
    
    func uniqueTeamName() -> String {
        repeat {
            print("")
            print("Please name your team")
            let uniqueTeamName = checkString()
            if uniqueTeamNames.contains(uniqueTeamName) {
                print("")
                print("Please choose anaother name")
            } else {
                uniqueTeamNames.append(uniqueTeamName)
                print("")
                print("Your team's name is" + " " + uniqueTeamName + " " + "now")
            }
            
            return uniqueTeamName
            
        } while uniqueTeamNames.contains(uniqueTeamName())
        
    }
    func createCharacter() -> Character? {
        var choice = 0
        print("")
        print("Choose your character within the fighters by entering number 1 to 4"
            + "\n1. Magus"
            + "\n2. Warrior"
            + "\n3. Colossus"
            + "\n4. Dwarf")
        
        repeat{
            
            choice = checkInteger()
            
            
        } while choice != 1 && choice != 2 && choice != 3 && choice != 4
        
        switch choice {
        case 1:
            let magus = Magus(name: uniqueCharacterName())
            return magus
        case 2:
            let warrior = Warrior(name: uniqueCharacterName())
            return warrior
        case 3:
            let colossus = Colossus(name: uniqueCharacterName())
            return colossus
        case 4:
            let dwarf = Dwarf(name: uniqueCharacterName())
            return dwarf
        default:
            break
        }
        
        return nil
    }
    
    
    func createCharacters() -> [Character] {
        var characters = [Character]()
        //Creer autant de perso que necessaire a l'aide de la fonction create charac puis enregistrer dans le tableau characters puis renvoyer le tableau
        for _ in 0..<numberOfCharacter {
            if let character = createCharacter() {
                characters.append(character)
            } 
        }
        
        
        return characters
        
    }
    
    func createTeam() -> Team {
        
        let team = Team(teamName: uniqueTeamName())
        team.characters = createCharacters()
        
        return team
        
    }
    
    func createTeams() {
        //Appel la foncion createTeam pour creer autant d'equipe qu'on veut puis les enregistrer dans la variable teams
        
        for _ in 0..<2 {
            let team  = createTeam()
            teams.append(team)
            
        }
        
        
        
    }
    
    
    //  print(" You recieved a source of pure water")
    //characters.lifePoint += 30 //Remplacer par arme
}

