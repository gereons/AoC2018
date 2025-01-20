import Testing
@testable import AdventOfCode

@Suite struct Day02Tests {
    @Test func testDay02_part1() throws {
        let day = Day02(input: """
            abcdef
            bababc
            abbcde
            abcccd
            aabcdd
            abcdee
            ababab
            """)
        #expect(day.part1() == 12)
    }

    @Test func testDay02_part2() throws {
        let day = Day02(input: """
            abcde
            fghij
            klmno
            pqrst
            fguij
            axcye
            wvxyz
            """)
        #expect(day.part2() == "fgij")
    }

    @Test func testDay02_part1_solution() {
        let day = Day02(input: Day02.input)
        #expect(day.part1() == 5952)
    }

    @Test func testDay02_part2_solution() {
        let day = Day02(input: Day02.input)
        #expect(day.part2() == "krdmtuqjgwfoevnaboxglzjph")
    }
}
