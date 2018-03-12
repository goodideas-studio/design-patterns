# Q1 answer
```
let numbers = [1,2,1]

extension   Int: Sequence {

public   func makeIterator() -> CountableClosedRange<Int>.Iterator {

return (0...self).makeIterator()

}

}

for number in numbers.count-1 {

print(numbers[number])

}
```

# Q2 answer
```
struct StringIterator: IteratorProtocol {
let strings: [String]
var index: Int

init(strings: [String]) {
self.strings = strings
index = 0
}

mutating func next() -> String? {

guard index < strings.endIndex else {return   nil}

let string = strings[index]
index += 1
return string
}
}

struct StringSequence: Sequence {

let strings: [String]

func makeIterator() -> StringIterator {
return   StringIterator(strings: strings)
}
}

for string in StringSequence(strings: ["apple", "banana", "orange"]) {
print(string)
}

```

# 總結Sequence 和 Iterator
## 我理解的優點有以下三個
1. 可隱藏資料，設計人員無需關心容器物件的內存分配的實現細節
2. 可設定遍歷的停止條件
3. 可設定輸出的條件
