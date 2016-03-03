//
//  Enemy.swift
//  simpleRPGwithOOP
//
//  Created by Jeffrey Cabrera
//  Copyright © 2016 jcab. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        return ["Broken Bottle", "Used Diapers"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
    
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
    
}