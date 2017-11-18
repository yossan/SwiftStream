import XCTest
@testable import SwiftStream

class SwiftStreamTests: XCTestCase {

    static var allTests = [
        ("testHead", testHead),
        ("testTaile", testTail),
        ("testIsEmpty", testIsEmpty),
        ("testConcat", testConcat),
        ("testReverse", testReverse),
        ("testReduce", testReduce),
        ("testMap", testMap)
    ]

    func testHead() {
        let stream = Stream.cons(1, { .cons(2, { .cons(3, { .cons(4, { .empty }) }) }) })
        XCTAssertEqual(head(stream), 1)
    }

    func testTail() {
    }

    func testIsEmpty() {
    }

    func testConcat() {
        let one = Stream.cons(1, {.empty})
    }

    func testReverse() {
        let stream = Stream.cons(1, {.cons(2, {.cons(3, {.cons(4, {.empty})})})})
        let reversedStream = reverse(stream)
        XCTAssertEqual(array(reversedStream), [4,3,2,1])
    }

    func testReduce() {
        let sum = { (aStream: SwiftStream.Stream<Int>) -> (Int) in
            return reduce(aStream)(0)({ (accumulator, value) in 
                var result = accumulator
                result += value
                return result
            })
        }

        let stream = Stream.cons(1, {.cons(2, {.cons(3, {.cons(4, {.empty})})})})
        XCTAssertEqual(sum(stream), 1+2+3+4)

    }

    func testMap() {
        
        let sum = { (aStream: SwiftStream.Stream<Int>) -> (Int) in
            return reduce(aStream)(0)({ (accumulator, value) in 
                var result = accumulator
                result += value
                return result
            })
        }
        let alwaysOne = { (_: Int) in return 1 }
        let stream = Stream.cons(1, {.cons(2, {.cons(3, {.cons(4, {.empty})})})})
        let length = sum(map(stream, alwaysOne))
        XCTAssertEqual(length, 4)
    }

    func array<T>(_ aStream: SwiftStream.Stream<T>) -> [T] {
        return reduce(aStream)([])({ (accumulator: [T], value) in
            var result = accumulator
            result.append(value)
            return result
        })
    }
}
