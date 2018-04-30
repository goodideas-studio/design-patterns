//: Playground - noun: a place where people can play

import UIKit


// 創建一個 Responder Protocol，以便所有符合類型必須定義列中的下一步方法（如果有的話），以及如果可能的話將運行 selector或轉發他的方法。
protocol Responder {
    var next: Responder? { get set }
    func run(selector: Selector)
}

// 接下來我們要實現 run a selector 或轉發，這需要從 NSObject 繼承，因為他給我 responds(to:) 方法，讓我們可以在運行時查詢當前對象是否可以運行 selector，如果我們調用它，否則我們將調用 next?.run() 將它傳遞給鏈。

class Control: NSObject, Responder {
    var next: Responder?
    
    init(next: Responder? = nil) {
        self.next = next
    }
    
    func run(selector: Selector) {
        if responds(to: selector) {
            perform(selector)
        } else {
            print("Forwarding to next responder")
            next?.run(selector: selector)
        }
    }
}

// 最後，我們需要一個實際上會響應我們要發送的選擇器的類。 這將從上面定義的Control類繼承，以便它獲得所有默認功能，然後在頂部添加一個方法：

class MessagingControl: Control {
    @objc func printMessage() {
        print("Running!")
    }
}

class BeerControl:Control {
    @objc func giveBeer() {
        print("給開司一罐啤酒。")
    }
}

let beer = BeerControl()


let root = MessagingControl(next:beer)
let first = Control(next: root)
let second = Control(next: first)
let third = Control(next: second)

let action = #selector(BeerControl.giveBeer)
third.run(selector: action)





