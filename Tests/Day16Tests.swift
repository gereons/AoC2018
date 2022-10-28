import XCTest
@testable import AdventOfCode

final class Day16Tests: XCTestCase {
    func testDay16_1() throws {
        let day = Day16(rawInput: """
Before: [3, 2, 1, 1]
9 2 1 2
After:  [3, 2, 2, 1]

""")
        XCTAssertEqual(day.part1(), 1)
    }
}
