//
//  Warrior.swift
//  XFight
//
//  Created by SayajinPapuru on 10/01/2019.
//  Copyright © 2019 HanAyyubInc. All rights reserved.
//

import Foundation

class Warrior: Character {
    
    init(name: String) {
        super.init(charactersName: name, lifePoint: 68, charactersArm: InfiniteSword())
    }
}
