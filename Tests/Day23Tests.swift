import Testing
@testable import AdventOfCode

@Suite struct Day23Tests {
    @Test func testDay23_part1() throws {
        let input = """
            pos=<0,0,0>, r=4
            pos=<1,0,0>, r=1
            pos=<4,0,0>, r=3
            pos=<0,2,0>, r=1
            pos=<0,5,0>, r=3
            pos=<0,0,3>, r=1
            pos=<1,1,1>, r=1
            pos=<1,1,2>, r=1
            pos=<1,3,1>, r=1
            """
        let day = Day23(input: input)
        #expect(day.part1() == 7)
    }

    @Test func testDay23_part2() throws {
        let day = Day23(input: """
            pos=<10,12,12>, r=2
            pos=<12,14,12>, r=2
            pos=<16,12,12>, r=4
            pos=<14,14,14>, r=6
            pos=<50,50,50>, r=200
            pos=<10,10,10>, r=5
            """)
        #expect(day.part2() == 36)
    }

    @Test func testDay23_part1_solution() {
        let day = Day23(input: Day23.input)
        #expect(day.part1() == 577)
    }

    // crashes in debug mode :-(
//    @Test func testDay20_part2_solution() {
//        let day = Day23(input: Day23.input)
//        #expect(day.part2() == 51429372)
//    }
}
