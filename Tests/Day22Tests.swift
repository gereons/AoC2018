import XCTest
@testable import AdventOfCode

@MainActor
final class Day22Tests: XCTestCase {
    func testDay22_1() throws {
        let day = Day22(input: """
            depth: 510
            target: 10,10
            """)
        XCTAssertEqual(day.part1(), 114)
    }

    func testDay22_2() throws {
        let day = Day22(input: """
            depth: 510
            target: 10,10
            """)
        XCTAssertEqual(day.part2(), 45)
    }
}
