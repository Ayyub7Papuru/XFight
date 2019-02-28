//
//  Magus.swift
//  XFight
//
//  Created by SayajinPapuru on 10/01/2019.
//  Copyright © 2019 HanAyyubInc. All rights reserved.
//

import Foundation

class Magus: Character {
    
    init(name: String) {
        super.init(charactersName: name, lifePoint: 70, charactersArm: Scepter())
    }
    
    func healing(friend: Character) {
        if lifePoint >= 0 {
            friend.lifePoint += 40
            print("\(charactersName) has healed \(friend), he is now op to keep fighting")
        } else {
            print("Sorry but your magus is OUT ")
        }
    }
} 

