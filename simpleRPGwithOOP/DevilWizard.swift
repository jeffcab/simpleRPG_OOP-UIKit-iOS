//
//  DevilWizard.swift
//  simpleRPGwithOOP
//
//  Created by Jeffrey Cabrera
//  Copyright © 2016 jcab. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    
    override var loot: [String] {
        return ["Rubber Duckie", "Fake Amulet", "Ken Doll", "Salted Peanuts"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
    
}