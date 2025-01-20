import Testing
@testable import AdventOfCode

@Suite struct Day17Tests {
    @Test func testDay17_part1() throws {
        let input = """
            x=495, y=2..7
            y=7, x=495..501
            x=501, y=3..7
            x=498, y=2..4
            x=506, y=1..2
            x=498, y=10..13
            x=504, y=10..13
            y=13, x=498..504
            """
        let day = Day17(input: input)
        #expect(day.part1() == 57)
    }

    @Test func testDay17_part2() throws {
        let input = """
            x=495, y=2..7
            y=7, x=495..501
            x=501, y=3..7
            x=498, y=2..4
            x=506, y=1..2
            x=498, y=10..13
            x=504, y=10..13
            y=13, x=498..504
            """
        let day = Day17(input: input)
        #expect(day.part2() == 29)
    }

    @Test func testDay17_part1_solution() {
        let day = Day17(input: Day17.input)
        #expect(day.part1() == 36790)
    }

    @Test func testDay17_part2_solution() {
        let day = Day17(input: Day17.input)
        #expect(day.part2() == 30765)
    }
}
