
import Testing
@testable import AdventOfCode

@Suite struct Day21Tests {
    @Test func testDay21_part1_solution() {
        let day = Day21(input: Day21.input)
        #expect(day.part1() == 3115806)
    }

    @Test func testDay21_part2_solution() {
        let day = Day21(input: Day21.input)
        #expect(day.part2() == 13959373)
    }
}
