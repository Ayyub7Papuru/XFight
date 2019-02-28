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
        
        for character in characters {
            character.characterDescription()
        }
    }
  
}
