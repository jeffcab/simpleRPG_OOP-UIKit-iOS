//
//  Kimara.swift
//  simpleRPGwithOOP
//
//  Created by Jeffrey Cabrera
//  Copyright © 2016 jcab. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Tough Dragon Scale", "Ingrown Toenail", "Kimara's Venom"]
    }
    
    override var enemytype: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }
}