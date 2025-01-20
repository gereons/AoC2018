import Testing
@testable import AdventOfCode

@Suite struct Day06Tests {
    @Test func testDay06_part1() throws {
        let day = Day06(input: """
            1, 1
            1, 6
            8, 3
            3, 4
            5, 5
            8, 9
            """)
        #expect(day.part1() == 17)
    }

    @Test func testDay06_part2() throws {
        let day = Day06(input: """
            1, 1
            1, 6
            8, 3
            3, 4
            5, 5
            8, 9
            """, distanceLimit: 32)
        #expect(day.part2() == 16)
    }

    @Test func testDay06_part1_solution() {
        let day = Day06(input: Day06.input)
        #expect(day.part1() == 5532)
    }

    @Test func testDay06_part2_solution() {
        let day = Day06(input: Day06.input)
        #expect(day.part2() == 36216)
    }
}
