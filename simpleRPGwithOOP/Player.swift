//
//  Player.swift
//  simpleRPGwithOOP
//
//  Created by Jeffrey Cabrera
//  Copyright © 2016 jcab. All rights reserved.
//

import Foundation

//inherit Parent
class Player: Character {
    
    private var _name = "Player"
    
    var name: String {
        get{
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String] {
        return _inventory
    }
    
    func addItemtoInventory(item: String){
        _inventory.append(item)
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        
        self.init(startingHp: hp, attackPwr: attackPwr)
        
        _name = name
    }
}