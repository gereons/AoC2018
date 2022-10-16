import XCTest
@testable import AdventOfCode

final class Day06Tests: XCTestCase {
    func testDay06_1() throws {
        let day = Day06(rawInput: """
            1, 1
            1, 6
            8, 3
            3, 4
            5, 5
            8, 9
            """)
        XCTAssertEqual(day.part1(), 17)
    }

    func testDay06_2() throws {
        let day = Day06(rawInput: """
            1, 1
            1, 6
            8, 3
            3, 4
            5, 5
            8, 9
            """, distanceLimit: 32)
        XCTAssertEqual(day.part2(), 16)
    }
}
