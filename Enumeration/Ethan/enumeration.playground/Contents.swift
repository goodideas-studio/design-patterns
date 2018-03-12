//: Playground - noun: a place where people can play

import UIKit


var numbers = [1,2,1,2,4,6,8,2,7]

//讓整數型別產生迭代能力
//extension Int: Sequence {
//    public func makeIterator() -> CountableRange<Int>.Iterator {
//        return (0..<self + 1).makeIterator()
//    }
//}

//原本的Int是不具有迭代能力的，為了讓它產生迭代能力因此整數型別遵守Sequence protocol
//那因為CountableCloseRange會產生一個陣列，本來就有迭代效果，所以可以直接調用Iterator
extension Int: Sequence {
    public func makeIterator() -> CountableClosedRange<Int>.Iterator {
        return (0...self).makeIterator()
    }
}




for number in numbers.count - 1 {
    print(numbers[number])
}



//自訂一個結構StringIterator遵守Iterator Protocol來產生迭代系統
struct StringIterator: IteratorProtocol{
    
    let strings: [String]
    var index: Int
    
    init(strings: [String]) {
        self.strings = strings
        self.index = 0
    }
    
    mutating func next() -> String?{
        guard index < strings.count else {return nil}
        let string = strings[index]
        index += 1
        return string
    }
}

struct StringSequence: Sequence{
    
    let strings: [String]
    
    public func makeIterator() -> StringIterator {
        return StringIterator(strings: strings)
    }
}


for string in StringSequence(strings: ["apple", "banana", "orange"]) {
    print(string)
}



//struct Dog{
//    var number:Int
//    init(n:Int) {
//        self.number = n
//    }
//}
//
//
//var doggie = Dog(n: 22){
//    didSet{
//        print("doggy was been set")
//    }
//}
//
//
//doggie.number = 22
//doggie.number
//
////
//class Rabbit{
//    var age:Int{
//        didSet{
//            print("age is changed")
//        }
//    }
//    init(age:Int) {
//        self.age = age
//    }
//}
//
//var rabbit = Rabbit(age: 26){
//    didSet{
//        print("rabbit's age changes")
//    }
//}
//
////rabbit.age = 22
//
//
////
////class Role{
////    var blood:Int{
////        didSet{
////            print("blood is changed")
////        }
////    }
////    init(blood:Int) {
////        self.blood = blood
////    }
////}
////
////var role = Role(blood: 25)
////role.blood = 27
//
//
