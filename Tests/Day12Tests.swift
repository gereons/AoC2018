import Testing
@testable import AdventOfCode

@Suite struct Day12Tests {
    @Test func testDay12_part1() throws {
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
        #expect(day.part1() == 325)
    }

    @Test func testDay12_part1_solution() {
        let day = Day12(input: Day12.input)
        #expect(day.part1() == 2045)
    }

    @Test func testDay12_part2_solution() {
        let day = Day12(input: Day12.input)
        #expect(day.part2() == 2100000000428)
    }
}
