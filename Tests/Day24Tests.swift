import XCTest
@testable import AdventOfCode

@MainActor
final class Day24Tests: XCTestCase {
    let input = """
Immune System:
17 units each with 5390 hit points (weak to radiation, bludgeoning) with an attack that does 4507 fire damage at initiative 2
989 units each with 1274 hit points (immune to fire; weak to bludgeoning, slashing) with an attack that does 25 slashing damage at initiative 3

Infection:
801 units each with 4706 hit points (weak to radiation) with an attack that does 116 bludgeoning damage at initiative 1
4485 units each with 2961 hit points (immune to radiation; weak to fire, cold) with an attack that does 12 slashing damage at initiative 4
"""

    func testDay24_1() throws {
        let day = Day24(input: input)
        XCTAssertEqual(day.part1(), 5216)
    }

    func testDay24_2() throws {
        let day = Day24(input: input)
        XCTAssertEqual(day.part2(), 51)
    }
}
