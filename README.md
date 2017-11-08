# SwiftStream

A example of a data structure named Stream.

# About Stream

Stream is a data structure which can contain elements.
However unlike Array, this produces elements after the first element 


# Usage Example

Stream can represent a infinitte sequence:

```infinite_integers.swift
func integers() -> Stream<Int> {
        func helper(_ n: Int) -> Stream<Int> {
                    return Stream.cons(n, { (_) in
                                return helper(n+1)
                                        })
                        }
                            return helper(0)
}
```


# LICENSE

This sample is licensed under the terms of the MIT open source licens.
