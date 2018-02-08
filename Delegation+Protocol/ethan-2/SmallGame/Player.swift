//
//  Player.swift
//  SmallGame
//
//  Created by EthanLin on 2018/2/8.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import Foundation



class Player{
    var HP:Int
    var atk:Int
    var playerImageName:String
    var playerAtkImageName: String
    var playerDefImageName: String
    var playerCunImageName: String
    
    init(HP:Int, atk:Int, playerImageName: String, playerAtkImageName:String, playerDefImageName:String, playerCunImageName:String ) {
        self.atk = atk
        self.HP = HP
        self.playerImageName = playerImageName
        self.playerAtkImageName = playerAtkImageName
        self.playerDefImageName = playerDefImageName
        self.playerCunImageName = playerCunImageName
    }
}
