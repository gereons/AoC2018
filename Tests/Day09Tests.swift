import Testing
@testable import AdventOfCode

@Suite struct Day09Tests {

    @Test func testDay09_part1() throws {
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
            #expect(day.part1() == score)
        }
    }

    @Test func testDay09_part1_solution() {
        let day = Day09(input: Day09.input)
        #expect(day.part1() == 375414)
    }

    @Test func testDay09_part2_solution() {
        let day = Day09(input: Day09.input)
        #expect(day.part2() == 3168033673)
    }
}
