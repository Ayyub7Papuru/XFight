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
            friend.lifePoint += charactersArm.power
            print("\(charactersName) has healed \(friend.charactersName), he is now op to keep fighting")
            
            if friend.lifePoint > friend.lifepointLimit {
                friend.lifePoint = friend.lifepointLimit
            }
        } else {
            print("Sorry but your magus is OUT ")
        }
    }
} 

