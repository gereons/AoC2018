import XCTest
@testable import AdventOfCode

final class Day03Tests: XCTestCase {
    func testDay03_1() throws {
        let day = Day03(input: """
#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2
""")
        XCTAssertEqual(day.part1(), 4)
    }

    func testDay03_2() throws {
        let day = Day03(input: """
#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2
""")
        XCTAssertEqual(day.part2(), 3)
    }
}
