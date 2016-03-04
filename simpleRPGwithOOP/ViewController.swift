//
//  ViewController.swift
//  simpleRPGwithOOP
//
//  Created by Jeffrey Cabrera
//  Copyright © 2016 jcab. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var mainNinja = UIImageView()
   
    @IBOutlet weak var lblStatus: UILabel!
   
    @IBOutlet weak var lblPlayerHp: UILabel!
    
    @IBOutlet weak var lblEnemyHp: UILabel!
    
    @IBOutlet weak var imgEnemy: UIImageView!
    
    @IBOutlet weak var btnChest: UIButton!
    
    @IBOutlet weak var btnAttack: UIButton!
    
    
    var player: Player!
    var enemy: Enemy!
    var chestMsg: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "Ngepoy", hp: 110, attackPwr: 20)
        lblPlayerHp.text = "\(player.hp) HP"
        //lblStatus.text = "\(enemy.enemytype) has Appeared"
        
        //232 439
        mainNinja = UIImageView(frame: CGRectMake(self.view.frame.width/10, self.view.frame.height/2.2, 82, 139))
        mainNinja.image = UIImage(named: "ninja")
        self.view.addSubview(mainNinja)
        
        genRandomEnemy()

    }
    
    func genRandomEnemy(){
        //random range of 2 total options
        //let rand = arc4random_uniform(UInt32(2))
        
        let rand = Int(arc4random() % 2)
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        } else {
            enemy = DevilWizard(startingHp: 60, attackPwr: 15)
        }
        lblStatus.text = "\(enemy.enemytype) has Appeared!"
        lblEnemyHp.text = "\(enemy.hp) HP"
        imgEnemy.hidden = false
    }

    @IBAction func onBtnChestTapped(sender: AnyObject) {
        btnChest.hidden = true
        lblStatus.text = chestMsg
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "genRandomEnemy", userInfo: nil, repeats: false)
        btnAttack.hidden = false
        //genRandomEnemy()
    }

    @IBAction func onBtnAttackTapped(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            lblStatus.text = "Attacked \(enemy.enemytype) for \(player.attackPwr) HP"
            lblEnemyHp.text = "\(enemy.hp) HP"
        } else  {
            lblStatus.text = "Failed Attack"
        }
        
        if let loot = enemy!.dropLoot() {
            player.addItemtoInventory(loot)
            chestMsg = "\(player.name) found \(loot)"
            btnChest.hidden = false
        }
        
        if !enemy!.isAlive {
            lblEnemyHp.text = ""
            lblStatus.text = "Killed \(enemy.enemytype)"
            btnAttack.hidden = true
            imgEnemy.hidden = true
            
        }

    }


}

							