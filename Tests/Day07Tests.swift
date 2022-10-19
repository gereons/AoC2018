import XCTest
@testable import AdventOfCode

final class Day07Tests: XCTestCase {
    func testDay07_1() throws {
        let day = Day07(rawInput: """
            Step C must be finished before step A can begin.
            Step C must be finished before step F can begin.
            Step A must be finished before step B can begin.
            Step A must be finished before step D can begin.
            Step B must be finished before step E can begin.
            Step D must be finished before step E can begin.
            Step F must be finished before step E can begin.
            """)
        XCTAssertEqual(day.part1(), "CABDFE")
    }

    func testDay07_2() throws {
        let day = Day07(rawInput: """
            Step C must be finished before step A can begin.
            Step C must be finished before step F can begin.
            Step A must be finished before step B can begin.
            Step A must be finished before step D can begin.
            Step B must be finished before step E can begin.
            Step D must be finished before step E can begin.
            Step F must be finished before step E can begin.
            """, workers: 2, baseDuration: 0)
        XCTAssertEqual(day.part2(), 15)
    }
}
