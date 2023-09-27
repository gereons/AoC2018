import XCTest
@testable import AdventOfCode

final class Day02Tests: XCTestCase {
    func testDay02_1() throws {
        let day = Day02(input: """
            abcdef
            bababc
            abbcde
            abcccd
            aabcdd
            abcdee
            ababab
            """)
        XCTAssertEqual(day.part1(), 12)
    }

    func testDay02_2() throws {
        let day = Day02(input: """
            abcde
            fghij
            klmno
            pqrst
            fguij
            axcye
            wvxyz
            """)
        XCTAssertEqual(day.part2(), "fgij")
    }
}
