//
//  GameBoard.swift
//  Game02
//
//  Created by 高菘駿 on 2018/2/12.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import Foundation

protocol showDataDelegate {
    func showHP(leftHP: Int, rightHP: Int)
    func showMP(leftMP: Int, rightMP: Int)
}

class GameBoard {
    
    var delegate: showDataDelegate?
    
    func setCharacter(leftCharacter: Character, rightCharacter: Character) {
        delegate?.showHP(leftHP: leftCharacter.HP, rightHP: rightCharacter.HP)
        delegate?.showMP(leftMP: leftCharacter.MP, rightMP: rightCharacter.MP)
    }
    
}
