var numbers = [1, 2, 3]
var count = 0

extension Int: Sequence, IteratorProtocol {
  public mutating func next() -> Int? {
    defer {
      count = count > self ? 0 : count + 1
    }

    if count > self {
      return nil
    }

    return numbers[count]
  }
}

for number in numbers.count - 1 {
  print(number)
}

for number in numbers.count - 1 {
  print(number)
}

class StringSequence: Sequence, IteratorProtocol {
  var strings: [String]
  var count = 0

  init(strings: [String]) {
    self.strings = strings
  }

  typealias Element = String

  public func next() -> StringSequence.Element? {
    defer {
      count = count == strings.count ? 0 : count + 1
    }

    if count == strings.count {
      return nil
    }

    return strings[count]
  }
}

for string in StringSequence(strings: ["apple", "banana", "orange"]) {
  print(string)
}
