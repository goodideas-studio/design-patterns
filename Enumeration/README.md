# Enumeration



## Description

透過實作 Sequence protocol 及 IteratorProtocol protocol 來解決以下程式碼所產生的compiler error。

```swift
var numbers = [1,2,1]
for number in numbers.count - 1 {
  print(numbers[number])
}
```

