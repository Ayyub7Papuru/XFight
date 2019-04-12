//
//  Game.swift
//  XFight
//
//  Created by SayajinPapuru on 10/01/2019.
//  Copyright © 2019 HanAyyubInc. All rights reserved.
//

import Foundation

class Game {
    var teams = [Team]()
    let teamFactory = TeamFactory()
    
    func start() {
        welcome()
        teamFactory.createTeams()
        teams = teamFactory.teams
        roundStatement()
        winner()
    }
    //Function wich welcomes the players
    func welcome() {
        print("")
        print("Welcome to X Fight, a game wich gonna confront two player to a death combat. Each player create his team, select three characters then fight for honor. Good faith ! ")
        print("")
    }
    
    //Function to check if the input is a String
    func checkString() -> String {
        guard let stringChoice = readLine() else { return String()}
        return stringChoice
    }
    //Funcrtion to check if input is Integer
    func checkInteger() -> Int {
        guard let input = readLine() else { return 0}
        guard let intInput = Int(input) else { return 0}
        return intInput
    }
    //Function for the player to make a choice
    func usersChoiceInRound() -> Int {
        print("")
        print("Choose a character ")
        print("")
        var usersChoice = 0
        repeat {
            usersChoice = checkInteger()
        } while usersChoice != 1 && usersChoice != 2 && usersChoice != 3
        return usersChoice
    }
    //Function wich describe the ongoing of the round
    func roundStatement() {
        /* Si il ya deux equipes, afficher les stats des persos des deux equipes, demander aux joueurs de jouer, afficher les stats apres chaque tour, puis afficher le nom du vainqueur */
        var userChoice = 0
        var characterChosen: Character?
        
        if teams.count >= 2 {
            
            repeat {
                
                for i in 0..<teams.count {
                    
                    print("")
                    print("Team" + " " + teams[i].teamName + " " + "its time to play")
                    print("")
                    
                    teams[i].teamDescription()
                    userChoice = usersChoiceInRound()
                    
                    characterChosen = teams[i].characters[userChoice - 1]
                    guard let currentCharacter = characterChosen else { return }
                    
                    chestAppear(character: currentCharacter)
                    if let magus = currentCharacter as? Magus {
                        print("")
                        print("Who do you want to heal")
                        print("")
                        teams[i].teamDescription()
                        userChoice = usersChoiceInRound()
                        
                        magus.healing(friend: teams[i].characters[userChoice - 1])
                        
                        
                    } else if i == 0 {
                        print("")
                        print("Which ennemy do you want to attack ? pick a number below")
                        print("")
                        
                            teams[i + 1].teamDescription()
                            userChoice = usersChoiceInRound()
                            currentCharacter.attackTheEnnemi(ennemy: teams[i + 1].characters[userChoice - 1])
                            print("")
                            teams[i + 1].teamDescription()
                            
                        if teams[i + 1].isDead() {
                            return
                        }
                        
                        
                    } else {
                        print("")
                        print("Which ennemy do you want to attack ? pick a number below")
                        print("")
                        
                        teams[i - 1].teamDescription()
                        userChoice = usersChoiceInRound()
                        
                        currentCharacter.attackTheEnnemi(ennemy: teams[i - 1].characters[userChoice - 1])
                        if teams[i - 1].isDead() {
                            return
                        }
                    }
                    
                }
            } while true
        }

    }
    
    /* func checkCharacter(characters: [Character]) {
     
     
     for character in characters {
     if character.lifePoint <= 0 {
     characters.remove(character)
     
     }
     }
     
     }
     */
    
    func winner() {
        
        for team in teams {
            if !team.isDead() {
                print(team.teamName + " is the winner")
            }
        }
    }

    func chestAppear(character: Character) {
        let randomChest = Int.random(in: 0...1)
        
        switch randomChest {
        case 0:
            magicChest(LuckyCharacter: character)
        case 1:
            chestFromSky(characToHelp: character)
        default:
            break
        }
    }
    
    //Function wich make a Chest appearing randomly
    func magicChest(LuckyCharacter: Character) {
        let randomChest = Int.random(in: 0..<6)
        
        switch randomChest {
        case 1:
            print("")
            print("Congratulation you found the Sword of Eternity !")
            print("")
            LuckyCharacter.charactersArm = SwordOfEternity()
        case 2:
            print("")
            print("Sorry but nothing for yah")
            print("")
        case 3:
            print("")
            print("A present from the ghost of sparte, the legendary Leviathan")
            print("")
            LuckyCharacter.charactersArm = LegendaryLeviathan()
        case 4:
            print("")
            print("Sorry nothing for you bruh")
            print("")
        case 5:
            print("")
            print("WONDERFULL !! You got the Suprem Scepter Of Time. It allows you to increase your power but you'll pay with your life")
            print("")
            LuckyCharacter.charactersArm = SupremScepterOfTime()
            LuckyCharacter.lifePoint -= 17
            
            if LuckyCharacter.lifePoint <= 0 {
                print("")
                print("You didn't had enough power to control the Suprem Scepter Of Time, sorry but you're dead")
                print("")
            }
            
        default:
            break
        }
    }
    
    //Function wich make a chest heal to appear
    func chestFromSky(characToHelp: Character) {
        let HelpArray = [Bandage(), InfinityStone(), ManaPotion(), PeaceKeeper(), FloralRemedy()] as [Any]
        
        let randomHelp = Int.random(in: 0..<HelpArray.count)
        
        switch randomHelp {
        case 0:
            print("")
            print("\(characToHelp.charactersName) found a meteorite which has fallen from the sky, he open and found a bandage")
            print("")
            characToHelp.lifePoint += 7
            print("")
            print("The lifePoint of \(characToHelp.charactersName) has increased")
            print("")
        case 1:
            print("")
            print("\(characToHelp.charactersName) found a meteorite which has fallen from the sky, he open and found the Infinity Stone, aside with his weapon the power will increase ")
            print("")
            characToHelp.charactersArm.power += 7
            print("")
            print("The power of \(characToHelp.charactersArm.name) has increased")
            print("")
        case 2:
            if characToHelp is Magus {
                print("")
                print("\(characToHelp.charactersName) found a meteorite which has fallen from the sky, he open and found a Mana Potion, the power of his scepter increase ")
                print("")
                characToHelp.charactersArm.power += 21
            }
        case 3:
            print("")
            print("\(characToHelp.charactersName) found a meteorite which has fallen from the sky, he open and found the PeaceKeeper and be equiped with it instead of \(characToHelp.charactersArm)")
            print("")
            characToHelp.charactersArm = PeaceKeeper()
        case 4:
            print("")
            print("\(characToHelp.charactersName) found a meteorite which has fallen from the sky, he open and found a floral medicine")
            print("")
            characToHelp.lifePoint += 11
        default:
            break
            
        }
    }
}


