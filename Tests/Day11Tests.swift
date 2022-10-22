import XCTest
@testable import AdventOfCode
import AoCTools

final class Day11Tests: XCTestCase {

    func testDay11_summedArea() throws {
        let day = Day11(rawInput: "0")
        let input = [
            [0, 0, 0, 0, 0, 0, 0],
            [0,31, 2, 4,33, 5,36],
            [0,12,26, 9,10,29,25],
            [0,13,17,21,22,20,18],
            [0,24,23,15,16,14,19],
            [0,30, 8,28,27,11, 7],
            [0, 1,35,34, 3,32, 6]
        ]
        let result = [
            [0,   0,   0,   0,   0,   0,   0],
            [0,  31,  33,  37,  70,  75, 111],
            [0,  43,  71,  84, 127, 161, 222],
            [0,  56, 101, 135, 200, 254, 333],
            [0,  80, 148, 197, 278, 346, 444],
            [0, 110, 186, 263, 371, 450, 555],
            [0, 111, 222, 333, 444, 555, 666]
        ]
        XCTAssertEqual(day.summedArea(input: input), result)
    }

    func testDay11_powerLevel() throws {
        XCTAssertEqual(Day11(rawInput: "8").powerLevel(for: 3, y: 5), 4)
        XCTAssertEqual(Day11(rawInput: "57").powerLevel(for: 122, y: 79), -5)
        XCTAssertEqual(Day11(rawInput: "39").powerLevel(for: 217, y: 196), 0)
        XCTAssertEqual(Day11(rawInput: "71").powerLevel(for: 101,y: 153), 4)
    }

    func testDay11_1() throws {
        XCTAssertEqual(Day11(rawInput: "18").part1(), "33,45")
        XCTAssertEqual(Day11(rawInput: "42").part1(), "21,61")
    }

    func testDay11_2() throws {
        XCTAssertEqual(Day11(rawInput: "18").part2(), "90,269,16")
        XCTAssertEqual(Day11(rawInput: "42").part2(), "232,251,12")
    }
}
