import Testing
@testable import AdventOfCode

@Suite struct Day20Tests {
    @Test func testDay20_part1() throws {
        let d1 = Day20(input: "^ESSWWN(E|NNENN(EESS(WNSE|)SSS|WWWSSSSE(SW|NNNE)))$")
        #expect(d1.part1() == 23)

        let d2 = Day20(input: "^WSSEESWWWNW(S|NENNEEEENN(ESSSSW(NWSW|SSEN)|WSWWN(E|WWS(E|SS))))$")
        #expect(d2.part1() == 31)
    }

    @Test func testDay20_part1_solution() {
        let day = Day20(input: Day20.input)
        #expect(day.part1() == 3314)
    }

    @Test func testDay20_part2_solution() {
        let day = Day20(input: Day20.input)
        #expect(day.part2() == 8550)
    }
}
