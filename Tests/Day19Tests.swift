import XCTest
@testable import AdventOfCode

@MainActor
final class Day19Tests: XCTestCase {
    func testDay19_1() throws {
        let input = """
            #ip 0
            seti 5 0 1
            seti 6 0 2
            addi 0 1 0
            addr 1 2 3
            setr 1 0 0
            seti 8 0 4
            seti 9 0 5
            """
        let day = Day19(input: input)
        XCTAssertEqual(day.part1(), 6)
    }
}
