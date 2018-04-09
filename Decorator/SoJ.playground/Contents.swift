//: Playground - noun: a place where people can play

import UIKit

extension UIColor {

    func decorate (otherColor: UIColor) -> UIColor {
        var currentRed: CGFloat = 0.0
        var currentGreen: CGFloat = 0.0
        var currentBlue: CGFloat = 0.0
        var currentAlpha: CGFloat = 1.0
        
        var otherColorRed: CGFloat = 0.0
        var otherColorGreen: CGFloat = 0.0
        var otherColorBlue: CGFloat = 0.0
        var otherColorAlpha: CGFloat = 1.0
        
        otherColor.getRed(&otherColorRed, green: &otherColorGreen, blue: &otherColorBlue, alpha: &otherColorAlpha)
        
        self.getRed(&currentRed, green: &currentGreen, blue: &currentBlue, alpha: &currentAlpha)
        
        let mixRed = currentRed + otherColorRed
        let mixGreen = currentGreen + otherColorGreen
        let mixBlue = currentBlue + otherColorBlue
        //let mixAlpha = (currentAlpha + otherColorAlpha) / 2
        
        return UIColor(red: mixRed, green: mixGreen, blue: mixBlue, alpha: 1.0)
    }

}

let firstColor = UIColor.red
let secondColor = UIColor.green

firstColor.decorate(otherColor: secondColor)
secondColor.decorate(otherColor: firstColor)
