import XCTest
@testable import AdventOfCode

final class Day18Tests: XCTestCase {
    func testDay18_1() throws {
        let input = """
            .#.#...|#.
            .....#|##|
            .|..|...#.
            ..|#.....#
            #.#|||#|#|
            ...#.||...
            .|....|...
            ||...#|.#|
            |.||||..|.
            ...#.|..|.
            """
        let day = Day18(input: input)
        XCTAssertEqual(day.part1(), 1147)
    }
}
