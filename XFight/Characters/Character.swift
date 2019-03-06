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
    var charactersArm: Weapon
    
    
    init (charactersName: String, lifePoint: Int, charactersArm: Weapon) {
        self.lifePoint = lifePoint
        self.charactersName = charactersName
        self.charactersArm = charactersArm
        
    }
    
    func characterDescription() {
        print("")
        for i in 0..<1 {
            if lifePoint > 0 {
                print("\(i + 1) " + "Statistics: Name: \(charactersName)" + " " + "LifePoint: \(lifePoint)" + " " + "Power: \(charactersArm.power)")
                
            } else {
                print("\(charactersName)  Is dead")
            }
        }
    }
    
    func attackTheEnnemi(ennemy: Character) {
        if lifePoint > 0 {
            if ennemy.lifePoint > 0 {
                ennemy.lifePoint -= charactersArm.power
                print("")
               print("\(charactersName)  launched an attack on  \(ennemy)  and made  \(charactersArm.power)  damages")
                
                if ennemy.lifePoint <= 0 {
                    print("")
                    print("\(ennemy) is dead")
                } else {
                    print("")
                    print("")
                    print("Come on ! Fight !")
                }
            }
            
        }
        
    }
}
