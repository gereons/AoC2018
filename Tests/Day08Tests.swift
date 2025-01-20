import Testing
@testable import AdventOfCode

@Suite struct Day08Tests {
    @Test func testDay08_part1() throws {
        let day = Day08(input: "2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2")
        #expect(day.part1() == 138)
    }

    @Test func testDay08_part2() throws {
        let day = Day08(input: "2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2")
        #expect(day.part2() == 66)
    }

    @Test func testDay08_part1_solution() {
        let day = Day08(input: Day08.input)
        #expect(day.part1() == 35852)
    }

    @Test func testDay08_part2_solution() {
        let day = Day08(input: Day08.input)
        #expect(day.part2() == 33422)
    }
}
