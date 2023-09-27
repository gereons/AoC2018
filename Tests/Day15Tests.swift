import XCTest
@testable import AdventOfCode

final class Day15Tests: XCTestCase {
    func testDay15_1a() throws {
        let input = """
#######
#G..#E#
#E#E.E#
#G.##.#
#...#E#
#...E.#
#######
"""
        let day = Day15(input: input)
        XCTAssertEqual(day.part1(), 36334)
    }

    func testDay15_1b() throws {
        let input = """
#######
#E..EG#
#.#G.E#
#E.##E#
#G..#.#
#..E#.#
#######
"""
        let day = Day15(input: input)
        XCTAssertEqual(day.part1(), 39514)
    }

    func testDay15_1c() throws {
        let input = """
#######
#.E...#
#.#..G#
#.###.#
#E#G#G#
#...#G#
#######
"""
        let day = Day15(input: input)
        XCTAssertEqual(day.part1(), 28944)
    }

    func testDay15_1d() throws {
        let input = """
#######
#E.G#.#
#.#G..#
#G.#.G#
#G..#.#
#...E.#
#######
"""
        let day = Day15(input: input)
        XCTAssertEqual(day.part1(), 27755)
    }

    func testDay15_1e() throws {
        let input = """
#########
#G......#
#.E.#...#
#..##..G#
#...##..#
#...#...#
#.G...G.#
#.....G.#
#########
"""
        let day = Day15(input: input)
        XCTAssertEqual(day.part1(), 18740)
    }

    func testDay15_2a() throws {
        let day = Day15(input: """
#######
#.G...#
#...EG#
#.#.#G#
#..G#E#
#.....#
#######
""")
        XCTAssertEqual(day.part2(), 4988)
    }

    func testDay15_2b() throws {
        let day = Day15(input: """
#######
#E.G#.#
#.#G..#
#G.#.G#
#G..#.#
#...E.#
#######
""")
        XCTAssertEqual(day.part2(), 3478)
    }

    func testDay15_2c() throws {
        let day = Day15(input: """
#######
#.E...#
#.#..G#
#.###.#
#E#G#G#
#...#G#
#######
""")
        XCTAssertEqual(day.part2(), 6474)
    }

    func testDay15_2d() throws {
        let day = Day15(input: """
#########
#G......#
#.E.#...#
#..##..G#
#...##..#
#...#...#
#.G...G.#
#.....G.#
#########
""")
        XCTAssertEqual(day.part2(), 1140)
    }
}
