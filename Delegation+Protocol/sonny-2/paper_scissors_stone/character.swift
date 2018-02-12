//
//  character.swift
//  
//
//  Created by Sonny on 2018/2/9.
//

import UIKit

protocol Character {
    var name:String{get}
    var imageName:String{get}
    var hp:Int {get}
    var defaulthp:Int{get}
    var hitvlaue: Int {get}
  
    }//endofthe init
    


class Joker: Character {
    var imageName:String = "joker.png"
    
    var name: String = "joker"
    
    var hp: Int = 1000
    var defaulthp: Int = 1000
    
    var hitvlaue: Int = 300
    
    func hitten() {
        print("Hitten by Joker")
    }
    
}//endofthe joker

class Batman: Character {
    var imageName:String = "batman.png"
    
    var name: String = "batman"
    
    var hp: Int = 1000
    var defaulthp: Int = 1000
    
    var hitvlaue: Int = 250
    
    func hitten() {
        print("Hitten by batman")
    }
    
}//endofthe batman

class Ironman: Character {
    var imageName: String = "ironman.png"
  
    var name: String = "ironman"
    
    var hp: Int = 2500
    var defaulthp: Int = 2500
    
    var hitvlaue: Int = 200
    
    func hitten() {
        print("Hitten by superman")
    }
}//endofthe Ironman





