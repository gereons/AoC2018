import XCTest
@testable import AdventOfCode

final class Day13Tests: XCTestCase {
    func testDay13_1() throws {
        let track = #"""
            /->-\
            |   |  /----\
            | /-+--+-\  |
            | | |  | v  |
            \-+-/  \-+--/
              \------/
            """#
        let day = Day13(rawInput: track)
        XCTAssertEqual(day.part1(), "7,3")
    }

    func testDay13_2() throws {
        let track = #"""
            />-<\
            |   |
            | /<+-\
            | | | v
            \>+</ |
              |   ^
              \<->/
            """#
        let day = Day13(rawInput: track)
        XCTAssertEqual(day.part2(), "6,4")
    }
}
