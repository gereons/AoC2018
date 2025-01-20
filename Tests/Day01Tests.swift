
import Testing
@testable import AdventOfCode

@Suite struct Day01Tests {
    @Test func testDay01_part1() throws {
        let day = Day01(input: """
                        +1
                        -2
                        +3
                        +1
                        """)
        #expect(day.part1() == 3)
    }

    @Test func testDay01_part2() throws {
        let day = Day01(input: """
            +3
            +3
            +4
            -2
            -4
            """)
        #expect(day.part2() == 10)
    }

    @Test func testDay01_part1_solution() {
        let day = Day01(input: Day01.input)
        #expect(day.part1() == 442)
    }

    @Test func testDay01_part2_solution() {
        let day = Day01(input: Day01.input)
        #expect(day.part2() == 59908)
    }
}
