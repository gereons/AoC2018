import Testing
@testable import AdventOfCode

@Suite struct Day07Tests {
    @Test func testDay07_part1() throws {
        let day = Day07(input: """
            Step C must be finished before step A can begin.
            Step C must be finished before step F can begin.
            Step A must be finished before step B can begin.
            Step A must be finished before step D can begin.
            Step B must be finished before step E can begin.
            Step D must be finished before step E can begin.
            Step F must be finished before step E can begin.
            """)
        #expect(day.part1() == "CABDFE")
    }

    @Test func testDay07_part2() throws {
        let day = Day07(input: """
            Step C must be finished before step A can begin.
            Step C must be finished before step F can begin.
            Step A must be finished before step B can begin.
            Step A must be finished before step D can begin.
            Step B must be finished before step E can begin.
            Step D must be finished before step E can begin.
            Step F must be finished before step E can begin.
            """, workers: 2, baseDuration: 0)
        #expect(day.part2() == 15)
    }

    @Test func testDay07_part1_solution() {
        let day = Day07(input: Day07.input)
        #expect(day.part1() == "EBICGKQOVMYZJAWRDPXFSUTNLH")
    }

    @Test func testDay07_part2_solution() {
        let day = Day07(input: Day07.input)
        #expect(day.part2() == 906)
    }
}
