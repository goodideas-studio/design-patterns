# Enumeration

## Description

Enumeration pattern 允許開發者以 for-in 的方式依序走訪 element，而不管其資料結構為何 ( array、set、dictionary，還是自定義的data type )。

其目的在於隱藏 object type的實作內容，僅提供外界一個可存取物件內部 property 的 interface ( makeIterator() )，程式只要透過該 Iterator interface，即可走訪該 object type 的各個 element。



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

