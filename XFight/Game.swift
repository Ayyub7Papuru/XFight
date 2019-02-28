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
        //}teams = teamFactory.teams
        teamFactory.createTeams()
        teams = teamFactory.teams
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
    func usersChoiceInRound() -> Int {
        var usersChoice = 0
        repeat {
            usersChoice = checkInteger()
        } while usersChoice != 1 && usersChoice != 2 && usersChoice != 3
        return usersChoice
    }
    
    func roundStatement() {
        /* Si il ya deux equipes, afficher les stats des persos des deux equipes, demander aux joueurs de jouer, afficher les stats apres chaque tour, puis afficher le nom du vainqueur */
        var userChoiceAlly = 0
        var userChoiceEnnemy = 0
        var userChoiceHeal = 0
        if teams.count >= 2 {
            
            repeat {
                
                for i in 0..<2 {
                    print("")
                    print("Team" + teams[i].teamName + "its time to play")
                    // Afficher les stats de départ des persos de chaque team
                    // Permettre a la premiere équipe d'attaquer, en choisissant le perso de l'equipe adverse, puis afficher les stats
                    // Faire apparaitre un coffre
                    // Declarer le vainqueur
                    teams[i].teamDescription()
                    userChoiceAlly = usersChoiceInRound()
                    let characterChosen = teams[i].characters[userChoiceAlly]
                    
                    if let magus = characterChosen as? Magus {
                        userChoiceHeal = usersChoiceInRound()
                        magus.healing(friend: teams[i].characters[userChoiceHeal])
                        
                    } else {
                        print("Which ennemy do you want to attack ?")
                        userChoiceEnnemy = usersChoiceInRound()
                        characterChosen.attackTheEnnemi(ennemy: teams[i].characters[userChoiceEnnemy])
                        teams[i].teamDescription()
                        
                        // garder le repeat ou séparer afin de préciser le num des team pour les variables userchoiceally et ennemy pour userschoiceround  ??
                        
                        if teams[i].characters[i].lifePoint <= 0 {
                            print("You won the game" + teams[i].teamName + "congratulations")
                        }
                        
                        
                    }
                }
            } while teams.count <= 0
        }
    }
    
    func magicChest(characters: Character) {
        let randomChest = Int.random(in: 0..<6)
        
        switch randomChest {
        case 1:
            print("Congratulation you found the Sword of Eternity !")
            characters.charactersArm = SwordOfEternity()
        case 2:
            print("Sorry but nothing for yah")
            
        case 3:
            print("A present from the ghost of sparte, the legendary Leviathan")
            characters.charactersArm = LegendaryLeviathan()
        case 4:
            print("Sorry nothing for you bruh")
        case 5:
            print("WONDERFULL !! You got the Suprem Scepter Of Time. It allows you to increase your power but you'll pay with your life")
            characters.charactersArm = SupremScepterOfTime()
            characters.lifePoint -= 17
            
            if characters.lifePoint <= 0 {
                print("You didn't had enough power to control the Suprem Scepter Of Time, sorry but you're dead")
            }
            
        default:
            break
        }
    }
    
    func helpFromTheSky(character: Character) {
        
        let HelpArray = [Bandage(), InfinityStone(), ManaPotion(), PeaceKeeper(), FloralRemedy()] as [Any]
        
        let randomHelp = Int.random(in: 0..<HelpArray.count)
        
        switch randomHelp {
        case 0:
            print("\(character.charactersName) found a meteorite which has fallen from the sky, he open and found a bandage")
            character.lifePoint += 7
            print("The lifePoint of \(character.lifePoint) has increased")
        case 1:
            print("\(character.charactersName) found a meteorite which has fallen from the sky, he open and found the Infinity Stone, aside with his weapon the power will increase ")
            character.charactersArm.power += 7
            print("The power of \(character.charactersArm) has increased")
        case 2:
            if character is Magus {
                print("\(character.charactersName) found a meteorite which has fallen from the sky, he open and found a Mana Potion, the power of his scepter increase ")
                character.charactersArm.power += 21
            }
        case 3:
            print("\(character.charactersName) found a meteorite which has fallen from the sky, he open and found the PeaceKeeper and be equiped with it instead of \(character.charactersArm)")
            character.charactersArm = PeaceKeeper()
        case 4:
            print("\(character.charactersName) found a meteorite which has fallen from the sky, he open and found a floral medicine")
            character.lifePoint += 11
        default:
            break
            
        }
    }
}



