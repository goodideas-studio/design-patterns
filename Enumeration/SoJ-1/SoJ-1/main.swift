//
//  main.swift
//  SoJ-1
//
//  Created by 高菘駿 on 2018/3/12.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import Foundation
/*
=======================================
Q：為什麼要用 CountableClosedRange<Int>?
=======================================
A：CountableClosedRange<Int> 是一個 struct，而本身就有Iterator的屬性和 makeIterator()的方法
 
題外話:
func ... 回傳的是一個 CountableClosedRange<Int> 類別，所以如果要搭配 ... 的方法就要是 CountableClosedRange 的類別

func ... 定義
public func ...<Bound>(minimum: Bound, maximum: Bound) -> CountableClosedRange<Bound> where Bound : Comparable, Bound : _Strideable, Bound.Stride : SignedInteger

所以若改成 CountableRange 就只能用 ..< 的方法
因為題目已經先減1，所以這裡應該要用 CountableClosedRange ，而不適用 CountableRange !!
*/

extension Int: Sequence {
    public func makeIterator() -> CountableClosedRange<Int>.Iterator {
        return (0...self).makeIterator()
    }
}


var numbers = [1,2,1]
for number in numbers.count - 1 {
    print(numbers[number])
}
