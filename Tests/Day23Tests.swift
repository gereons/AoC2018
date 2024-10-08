import XCTest
@testable import AdventOfCode

@MainActor
final class Day23Tests: XCTestCase {
    func testDay23_1() throws {
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
        XCTAssertEqual(day.part1(), 7)
    }

    func testDay23_2() throws {
        let day = Day23(input: """
            pos=<10,12,12>, r=2
            pos=<12,14,12>, r=2
            pos=<16,12,12>, r=4
            pos=<14,14,14>, r=6
            pos=<50,50,50>, r=200
            pos=<10,10,10>, r=5
            """)
        XCTAssertEqual(day.part2(), 36)
    }
}
