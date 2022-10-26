import XCTest
@testable import AdventOfCode

final class Day14Tests: XCTestCase {
    func testDay14_1() throws {
        XCTAssertEqual(Day14(rawInput: "9").part1(), "5158916779")
        XCTAssertEqual(Day14(rawInput: "5").part1(), "0124515891")
        XCTAssertEqual(Day14(rawInput: "18").part1(), "9251071085")
        XCTAssertEqual(Day14(rawInput: "2018").part1(), "5941429882")
    }

    func testDay14_2() throws {
        XCTAssertEqual(Day14(rawInput: "51589").part2(), 9)
        XCTAssertEqual(Day14(rawInput: "01245").part2(), 5)
        XCTAssertEqual(Day14(rawInput: "92510").part2(), 18)
        XCTAssertEqual(Day14(rawInput: "59414").part2(), 2018)
    }
}
