import Testing
@testable import AdventOfCode
import AoCTools

@Suite struct Day11Tests {

    @Test func testDay11_summedArea() throws {
        let day = Day11(input: "0")
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
        #expect(day.summedArea(input: input) == result)
    }

    @Test func testDay11_powerLevel() throws {
        #expect(Day11(input: "8").powerLevel(for: 3, y: 5) == 4)
        #expect(Day11(input: "57").powerLevel(for: 122, y: 79) == -5)
        #expect(Day11(input: "39").powerLevel(for: 217, y: 196) == 0)
        #expect(Day11(input: "71").powerLevel(for: 101,y: 153) == 4)
    }

    @Test func testDay11_part1() throws {
        #expect(Day11(input: "18").part1() == "33,45")
        #expect(Day11(input: "42").part1() == "21,61")
    }

    @Test func testDay11_part2() throws {
        #expect(Day11(input: "18").part2() == "90,269,16")
        #expect(Day11(input: "42").part2() == "232,251,12")
    }

    @Test func testDay11_part1_solution() {
        let day = Day11(input: Day11.input)
        #expect(day.part1() == "21,72")
    }

    @Test func testDay11_part2_solution() {
        let day = Day11(input: Day11.input)
        #expect(day.part2() == "242,13,9")
    }
}
