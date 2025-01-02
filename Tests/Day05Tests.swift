import XCTest
@testable import AdventOfCode

final class Day05Tests: XCTestCase {
    func testDay05_1() throws {
        XCTAssertEqual(Day05(input: "aA").part1(), 0)
        XCTAssertEqual(Day05(input: "abBA").part1(), 0)
        XCTAssertEqual(Day05(input: "abAB").part1(), 4)
        XCTAssertEqual(Day05(input: "aabAAB").part1(), 6)
        XCTAssertEqual(Day05(input: "dabAcCaCBAcCcaDA").part1(), 10)
    }

    func testDay05_2() throws {
        XCTAssertEqual(Day05(input: "dabAcCaCBAcCcaDA").part2(), 4)
    }
}
