import Testing
@testable import AdventOfCode

@Suite struct Day13Tests {
    @Test func testDay13_part1() throws {
        let track = #"""
            /->-\
            |   |  /----\
            | /-+--+-\  |
            | | |  | v  |
            \-+-/  \-+--/
              \------/
            """#
        let day = Day13(input: track)
        #expect(day.part1() == "7,3")
    }

    @Test func testDay13_part2() throws {
        let track = #"""
            />-<\
            |   |
            | /<+-\
            | | | v
            \>+</ |
              |   ^
              \<->/
            """#
        let day = Day13(input: track)
        #expect(day.part2() == "6,4")
    }

    @Test func testDay13_part1_solution() {
        let day = Day13(input: Day13.input)
        #expect(day.part1() == "26,92")
    }

    @Test func testDay13_part2_solution() {
        let day = Day13(input: Day13.input)
        #expect(day.part2() == "86,18")
    }
}
