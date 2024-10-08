import XCTest
@testable import AdventOfCode

@MainActor
final class Day20Tests: XCTestCase {
    func testDay20_1() throws {
        let d1 = Day20(input: "^ESSWWN(E|NNENN(EESS(WNSE|)SSS|WWWSSSSE(SW|NNNE)))$")
        XCTAssertEqual(d1.part1(), 23)

        let d2 = Day20(input: "^WSSEESWWWNW(S|NENNEEEENN(ESSSSW(NWSW|SSEN)|WSWWN(E|WWS(E|SS))))$")
        XCTAssertEqual(d2.part1(), 31)
    }
}
