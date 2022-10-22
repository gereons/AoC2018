import XCTest
@testable import AdventOfCode
import AoCTools

final class Day11Tests: XCTestCase {
    func testDay11_1() throws {
        XCTAssertEqual(Day11(rawInput: "8").powerLevel(for: 3, y: 5), 4)
        XCTAssertEqual(Day11(rawInput: "57").powerLevel(for: 122, y: 79), -5)
        XCTAssertEqual(Day11(rawInput: "39").powerLevel(for: 217, y: 196), 0)
        XCTAssertEqual(Day11(rawInput: "71").powerLevel(for: 101,y: 153), 4)

        XCTAssertEqual(Day11(rawInput: "18").part1(), "33,45")
        XCTAssertEqual(Day11(rawInput: "42").part1(), "21,61")
    }

    func testDay11_2() throws {
        XCTAssertEqual(Day11(rawInput: "18").part2(), "90,269,16")
        XCTAssertEqual(Day11(rawInput: "42").part2(), "232,251,12")
    }
}
