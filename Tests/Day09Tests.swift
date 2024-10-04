import XCTest
@testable import AdventOfCode

@MainActor
final class Day09Tests: XCTestCase {

    func testDay09_1() throws {
        let testInput = [
            "9 players; last marble is worth 25 points": 32,
            "10 players; last marble is worth 1618 points": 8317,
            "13 players; last marble is worth 7999 points": 146373,
            "17 players; last marble is worth 1104 points": 2764,
            "21 players; last marble is worth 6111 points": 54718,
            "30 players; last marble is worth 5807 points": 37305
        ]

        for (input, score) in testInput {
            let day = Day09(input: input)
            XCTAssertEqual(day.part1(), score)
        }
    }
}
