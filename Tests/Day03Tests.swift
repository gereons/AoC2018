import Testing
@testable import AdventOfCode

@Suite struct Day03Tests {
    @Test func testDay03_part1() throws {
        let day = Day03(input: """
#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2
""")
        #expect(day.part1() == 4)
    }

    @Test func testDay03_part2() throws {
        let day = Day03(input: """
#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2
""")
        #expect(day.part2() == 3)
    }

    @Test func testDay03_part1_solution() {
        let day = Day03(input: Day03.input)
        #expect(day.part1() == 107820)
    }

    @Test func testDay03_part2_solution() {
        let day = Day03(input: Day03.input)
        #expect(day.part2() == 661)
    }
}
