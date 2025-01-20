import Testing
@testable import AdventOfCode

@Suite struct Day14Tests {
    @Test func testDay14_part1() throws {
        #expect(Day14(input: "9").part1() == "5158916779")
        #expect(Day14(input: "5").part1() == "0124515891")
        #expect(Day14(input: "18").part1() == "9251071085")
        #expect(Day14(input: "2018").part1() == "5941429882")
    }

    @Test func testDay14_part2() throws {
        #expect(Day14(input: "51589").part2() == 9)
        #expect(Day14(input: "01245").part2() == 5)
        #expect(Day14(input: "92510").part2() == 18)
        #expect(Day14(input: "59414").part2() == 2018)
    }

    @Test func testDay14_part1_solution() {
        let day = Day14(input: Day14.input)
        #expect(day.part1() == "5715102879")
    }

    @Test func testDay14_part2_solution() {
        let day = Day14(input: Day14.input)
        #expect(day.part2() == 20225706)
    }
}
