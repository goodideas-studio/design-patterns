//: Playground - noun: a place where people can play

import UIKit

extension UIColor{

    func decorate(color1:UIColor) -> UIColor{
        var red1:CGFloat = 0
        var blue1:CGFloat = 0
        var green1:CGFloat = 0
        var alpha1:CGFloat = 0
        var red2:CGFloat = 0
        var blue2:CGFloat = 0
        var green2:CGFloat = 0
        var alpha2:CGFloat = 0
        color1.getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)
        self.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
        return UIColor(red: red1 + red2, green: green1 + green2, blue: blue1 + blue2, alpha: alpha1 + alpha2)
    }
    
}

//class EthanColor{
//
//    func decorate(color1:UIColor, color2:UIColor) -> UIColor{
//        var red1:CGFloat = 0
//        var blue1:CGFloat = 0
//        var green1:CGFloat = 0
//        var alpha1:CGFloat = 0
//        var red2:CGFloat = 0
//        var blue2:CGFloat = 0
//        var green2:CGFloat = 0
//        var alpha2:CGFloat = 0
//        color1.getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)
//        color2.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
//        return UIColor(red: red1 + red2, green: green1 + green2, blue: blue1 + blue2, alpha: alpha1 + alpha2)
//    }
//}
//
//let ethanColor = EthanColor()
//
//let purple = ethanColor.decorate(color1: .red, color2: .blue)
let purple = UIColor.blue.decorate(color1: .red).decorate(color1: .green)
