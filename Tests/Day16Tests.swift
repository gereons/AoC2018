import Testing
@testable import AdventOfCode

@Suite struct Day16Tests {
    @Test func testDay16_part1() throws {
        let day = Day16(input: """
Before: [3, 2, 1, 1]
9 2 1 2
After:  [3, 2, 2, 1]

""")
        #expect(day.part1() == 1)
    }

    @Test func testDay16_part1_solution() {
        let day = Day16(input: Day16.input)
        #expect(day.part1() == 547)
    }

    @Test func testDay16_part2_solution() {
        let day = Day16(input: Day16.input)
        #expect(day.part2() == 582)
    }
}
