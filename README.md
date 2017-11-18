# SwiftStream

A example of a data structure named Stream.
This example introduce Stream and the related currying functions.

# About Stream

Stream is a data structure which can contain elements.
However unlike Array which stores elements in memory, Stream produces elements after the first element.
And the calcuration of the elements in the Stream is asynchronous.
So you can make an infinite data using Stream.

Stream is implemented as follows:

```Stream.swift
enum Stream<T> {
    case empty
    case cons(T, T->Stream<T>)
}
```

# Usage Example

You can make an infinite number of sequences by using Stream.
for examples:

```integers.swift
func integers() -> Stream<Int> {
    func helper(_ n: Int) -> Stream<Int> {
        return Stream.cons(n, { (_) in
            return helper(n+1)
        })
    }
    return helper(0)
}
```

You can converte a stream data to Array as follow:

```stream_to_array.swift
let fives = reduce(take(integers())(4))([])({ (accumulator: [Int], element) in
    var accumulator = accumulator
    accumulator.append(element)
    return accumulator
})

print(fives) //[0, 1, 2, 3, 4]
```


# LICENSE

This sample is licensed under the terms of the MIT open source licens.
