import Testing
@testable import AdventOfCode

@Suite struct Day15Tests {
    @Test func testDay15_part1() throws {
        let input = """
#######
#G..#E#
#E#E.E#
#G.##.#
#...#E#
#...E.#
#######
"""
        var day = Day15(input: input)
        #expect(day.part1() == 36334)

        let input2 = """
#######
#E..EG#
#.#G.E#
#E.##E#
#G..#.#
#..E#.#
#######
"""
        day = Day15(input: input2)
        #expect(day.part1() == 39514)

        let input3 = """
#######
#.E...#
#.#..G#
#.###.#
#E#G#G#
#...#G#
#######
"""
        day = Day15(input: input3)
        #expect(day.part1() == 28944)

        let input4 = """
#######
#E.G#.#
#.#G..#
#G.#.G#
#G..#.#
#...E.#
#######
"""
        day = Day15(input: input4)
        #expect(day.part1() == 27755)

        let input5 = """
#########
#G......#
#.E.#...#
#..##..G#
#...##..#
#...#...#
#.G...G.#
#.....G.#
#########
"""
        day = Day15(input: input5)
        #expect(day.part1() == 18740)
    }

    @Test func testDay15_part2() throws {
        var day = Day15(input: """
#######
#.G...#
#...EG#
#.#.#G#
#..G#E#
#.....#
#######
""")
        #expect(day.part2() == 4988)

        day = Day15(input: """
#######
#E.G#.#
#.#G..#
#G.#.G#
#G..#.#
#...E.#
#######
""")
        #expect(day.part2() == 3478)

        day = Day15(input: """
#######
#.E...#
#.#..G#
#.###.#
#E#G#G#
#...#G#
#######
""")
        #expect(day.part2() == 6474)

        day = Day15(input: """
#########
#G......#
#.E.#...#
#..##..G#
#...##..#
#...#...#
#.G...G.#
#.....G.#
#########
""")
        #expect(day.part2() == 1140)
    }

    @Test func testDay15_part1_solution() {
        let day = Day15(input: Day15.input)
        #expect(day.part1() == 257954)
    }

    @Test func testDay15_part2_solution() {
        let day = Day15(input: Day15.input)
        #expect(day.part2() == 51041)
    }
}
