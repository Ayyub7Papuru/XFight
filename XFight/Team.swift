//
//  Team.swift
//  XFight
//
//  Created by SayajinPapuru on 10/01/2019.
//  Copyright © 2019 HanAyyubInc. All rights reserved.
//

import Foundation

class Team {
    var characters = [Character]()
    let teamName: String
    
    init(teamName: String) {
        self.teamName = teamName
    }
  
    func teamDescription() {
        
        for i in 0..<characters.count {
            
            let character = characters[i]
            if character.lifePoint == 0 {
                print("")
                print("\(i + 1) " + character.charactersName + " Is dead !")
                print("")
            } else {
                 character.characterDescription(index: i)
            }
           
        }
    }
    
    func isDead() -> Bool {
        var isDead = false
        
        for character in characters {
            if character.lifePoint <= 0 {
                isDead = true
            } else {
                return false
            }
        }
        return isDead
    }

}
