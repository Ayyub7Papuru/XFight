//
//  Colossus.swift
//  XFight
//
//  Created by SayajinPapuru on 10/01/2019.
//  Copyright © 2019 HanAyyubInc. All rights reserved.
//

import Foundation

class Colossus: Character {
    
    init(name: String) {
        super.init(charactersName: name, lifePoint: 150, charactersArm: Mace())
    }
}
