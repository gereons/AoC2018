import XCTest
@testable import AdventOfCode

@MainActor
final class Day14Tests: XCTestCase {
    func testDay14_1() throws {
        XCTAssertEqual(Day14(input: "9").part1(), "5158916779")
        XCTAssertEqual(Day14(input: "5").part1(), "0124515891")
        XCTAssertEqual(Day14(input: "18").part1(), "9251071085")
        XCTAssertEqual(Day14(input: "2018").part1(), "5941429882")
    }

    func testDay14_2() throws {
        XCTAssertEqual(Day14(input: "51589").part2(), 9)
        XCTAssertEqual(Day14(input: "01245").part2(), 5)
        XCTAssertEqual(Day14(input: "92510").part2(), 18)
        XCTAssertEqual(Day14(input: "59414").part2(), 2018)
    }
}
