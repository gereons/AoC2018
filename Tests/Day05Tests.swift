import Testing
@testable import AdventOfCode

@Suite struct Day05Tests {
    @Test func testDay05_part1() throws {
        #expect(Day05(input: "aA").part1() == 0)
        #expect(Day05(input: "abBA").part1() == 0)
        #expect(Day05(input: "abAB").part1() == 4)
        #expect(Day05(input: "aabAAB").part1() == 6)
        #expect(Day05(input: "dabAcCaCBAcCcaDA").part1() == 10)
    }

    @Test func testDay05_part2() throws {
        #expect(Day05(input: "dabAcCaCBAcCcaDA").part2() == 4)
    }

    @Test func testDay05_part1_solution() {
        let day = Day05(input: Day05.input)
        #expect(day.part1() == 10774)
    }

    @Test func testDay05_part2_solution() {
        let day = Day05(input: Day05.input)
        #expect(day.part2() == 5122)
    }
}
