import Testing
@testable import AdventOfCode

@Suite struct Day22Tests {
    @Test func testDay22_part1() throws {
        let day = Day22(input: """
            depth: 510
            target: 10,10
            """)
        #expect(day.part1() == 114)
    }

    @Test func testDay22_part2() throws {
        let day = Day22(input: """
            depth: 510
            target: 10,10
            """)
        #expect(day.part2() == 45)
    }

    @Test func testDay22_part1_solution() {
        let day = Day22(input: Day22.input)
        #expect(day.part1() == 7743)
    }

    @Test func testDay22_part2_solution() {
        let day = Day22(input: Day22.input)
        #expect(day.part2() == 1029)
    }
}
