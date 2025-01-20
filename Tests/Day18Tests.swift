import Testing
@testable import AdventOfCode

@Suite struct Day18Tests {
    @Test func testDay18_part1() throws {
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
        #expect(day.part1() == 1147)
    }

    @Test func testDay18_part1_solution() {
        let day = Day18(input: Day18.input)
        #expect(day.part1() == 637550)
    }

    @Test func testDay18_part2_solution() {
        let day = Day18(input: Day18.input)
        #expect(day.part2() == 201465)
    }
}
