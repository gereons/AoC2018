import XCTest
@testable import AdventOfCode

final class Day12Tests: XCTestCase {
    func testDay12_1() throws {
        let input = """
            initial state: #..#.#..##......###...###

            ...## => #
            ..#.. => #
            .#... => #
            .#.#. => #
            .#.## => #
            .##.. => #
            .#### => #
            #.#.# => #
            #.### => #
            ##.#. => #
            ##.## => #
            ###.. => #
            ###.# => #
            ####. => #
            """
        let day = Day12(rawInput: input)
        XCTAssertEqual(day.part1(), 325)
    }
}
