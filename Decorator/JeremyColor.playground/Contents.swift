//: Playground - noun: a place where people can play

import UIKit

extension UIColor {
    var redValue: CGFloat{ return CIColor(color: self).red }
    var greenValue: CGFloat{ return CIColor(color: self).green }
    var blueValue: CGFloat{ return CIColor(color: self).blue }
    var alphaValue: CGFloat{ return CIColor(color: self).alpha }
    
    func mixColor(anotherColor:UIColor) -> UIColor {
        
        let r = (redValue + anotherColor.redValue)
        let b = (blueValue + anotherColor.blueValue)
        let g = (greenValue + anotherColor.greenValue)
        let a = (alphaValue + anotherColor.alphaValue)
        
        let color = UIColor(red: r, green: g, blue: b, alpha: a)
        
        return color
    }
}

class JeremyColor:UIColor {
   
}

var red = JeremyColor.red
var blue = JeremyColor.blue

red.mixColor(anotherColor: blue)

//print(123)





