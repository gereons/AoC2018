import XCTest
@testable import AdventOfCode

@MainActor
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
        let day = Day12(input: input)
        XCTAssertEqual(day.part1(), 325)
    }
}
