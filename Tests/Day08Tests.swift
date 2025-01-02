import XCTest
@testable import AdventOfCode

final class Day08Tests: XCTestCase {
    func testDay08_1() throws {
        let day = Day08(input: "2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2")
        XCTAssertEqual(day.part1(), 138)
    }

    func testDay08_2() throws {
        let day = Day08(input: "2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2")
        XCTAssertEqual(day.part2(), 66)
    }
}
