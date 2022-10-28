import XCTest
@testable import AdventOfCode

final class Day15Tests: XCTestCase {
    func testDay15_1() throws {
        let input = """
#########
#G..G..G#
#.......#
#.......#
#G..E..G#
#.......#
#.......#
#G..G..G#
#########
"""
        let day = Day15(rawInput: input)
        XCTAssertEqual(day.part1(), 0)
    }

//    func testDay15_2() throws {
//        let day = Day15(rawInput: "bar")
//        XCTAssertEqual(day.part2(), 0)
//    }
}
