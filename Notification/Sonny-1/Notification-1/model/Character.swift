//
//  Character.swift
//  Notification-1
//
//  Created by Sonny on 2018/2/12.
//  Copyright © 2018年 SonnyCompany. All rights reserved.
//

import Foundation

protocol Character {
    var name:String{get}
    var hp:Int{get set}
    var originalhp:Int{get}
    var atk:Int{get}
    var imageName:String{get}
    
}

class Batman:Character {
    var name: String = "Batman"
    
    var hp: Int = 2000
    
    var originalhp: Int = 2000
    
    var atk: Int = 250
    
    var imageName: String = "batman.png"
    
}//endof batman

class Ironman: Character {
    var name: String = "Ironman"
    
    var hp: Int = 2000
    
    var originalhp: Int = 2000
    
    var atk: Int = 250
    
    var imageName: String = "ironman.png"
    
}//endof ironman

class Hulk: Character {
    var name: String = "Hulk"
    
    var hp: Int = 2000
    
    var originalhp: Int = 2000
    
    var atk: Int = 250
    
    var imageName: String = "hulk.png"
    
}//endof Hulk

class Deadpool : Character {
    var name: String = "Deadpool"
    
    var hp: Int = 2000
    
    var originalhp: Int = 2000
    
    var atk: Int = 250
    
    var imageName: String = "deadpool.png"
    
    
}//endof Deadpool

class Joker: Character {
    var name: String = "joker"
    
    var hp: Int = 2000
    
    var originalhp: Int = 2000
    
    var atk: Int = 250
    
    var imageName: String = "joker.png"
    
}//endof joker

class Spiderman: Character {
    var name: String = "Spiderman"
    
    var hp: Int = 2000
    
    var originalhp: Int = 2000
    
    var atk: Int = 250
    
    var imageName: String = "spiderman.png"
    
    
}//endof Spiderman








