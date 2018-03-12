# Enumeration

## Description

Enumeration pattern 允許開發者以 for-in 的方式依序遍歷，而不管其資料結構為和。因此無論是使用 array、set、dictionary，還是自定義的data type，Enumeration允許遍歷它們。

## Question 1

透過實作 Sequence protocol 及 IteratorProtocol protocol 來解決以下程式碼所產生的compiler error。

```swift
var numbers = [1,2,1]
for number in numbers.count - 1 {
  print(numbers[number])
}
```



## Question 2

利用 Sequence protocol 及 IteratorProtocol protocol 來完成 StringSequence() ，並可印出最終結果 “apple", "banana", "orange 

```swift
for string in StringSequence(strings: ["apple", "banana", "orange"]) {
  print(string)
}
```

