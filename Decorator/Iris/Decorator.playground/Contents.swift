//: Playground - noun: a place where people can play

import UIKit

extension UIColor {

    func decorator(anotherColor: UIColor) -> UIColor {
        var colorRed: CGFloat = 0.0
        var colorGreen: CGFloat = 0.0
        var colorBlue: CGFloat = 0.0
        var colorAlpha: CGFloat = 1.0
        
        var anotherColorRed: CGFloat = 0.0
        var anotherColorGreen: CGFloat = 0.0
        var anotherColorBlue: CGFloat = 0.0
        var anotherColorAlpha: CGFloat = 1.0
        
        anotherColor.getRed(&anotherColorRed, green: &anotherColorGreen, blue: &anotherColorBlue, alpha: &anotherColorAlpha)
        self.getRed(&colorRed, green: &colorGreen, blue: &colorBlue, alpha: &colorAlpha)
        return UIColor(red: colorRed + anotherColorRed, green: colorGreen + anotherColorGreen, blue: colorBlue + anotherColorBlue, alpha: 1.0)
    }
}


let pallette = UIColor.red.decorator(anotherColor: .blue)
let anotherPallette = UIColor.red.decorator(anotherColor: .blue).decorator(anotherColor: .green)
