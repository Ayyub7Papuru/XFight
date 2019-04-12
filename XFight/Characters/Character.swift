//
//  Character.swift
//  XFight
//
//  Created by SayajinPapuru on 10/01/2019.
//  Copyright © 2019 HanAyyubInc. All rights reserved.
//

import Foundation


class Character {
    let charactersName: String
    var lifePoint: Int
    let lifepointLimit: Int
    var charactersArm: Weapon
    
    
    init (charactersName: String, lifePoint: Int, charactersArm: Weapon) {
        self.lifePoint = lifePoint
        self.lifepointLimit = lifePoint
        self.charactersName = charactersName
        self.charactersArm = charactersArm
        
    }
    
    func characterDescription(index: Int) {
        
        print("")
        print("\(index + 1) " + "Statistics: Name: \(charactersName)" + " " + "LifePoint: \(lifePoint)" + " " + "Power: \(charactersArm.power)")
        
    }
    
    func attackTheEnnemi(ennemy: Character) {
        if lifePoint > 0 {
            if ennemy.lifePoint > 0 {
                ennemy.lifePoint -= charactersArm.power
                print("")
               print("\(charactersName)  launched an attack on  \(ennemy.charactersName)  and made  \(charactersArm.power)  damages")
                
                if ennemy.lifePoint <= 0 {
                    print("")
                    print("\(ennemy.charactersName) is dead")
                    ennemy.lifePoint = 0
                } else {
                    print("")
                    print("Come on ! Fight !")
                }
            }
            
        }
        
    }
}
