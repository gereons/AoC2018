import XCTest
@testable import AdventOfCode

@MainActor
final class Day25Tests: XCTestCase {
    func testDay25_1a() throws {
        let day = Day25(input: """
0,0,0,0
3,0,0,0
0,3,0,0
0,0,3,0
0,0,0,3
0,0,0,6
9,0,0,0
12,0,0,0
""")
        XCTAssertEqual(day.part1(), 2)
    }

    func testDay25_1b() throws {
        let day = Day25(input: """
-1,2,2,0
0,0,2,-2
0,0,0,-2
-1,2,0,0
-2,-2,-2,2
3,0,2,-1
-1,3,2,2
-1,0,-1,0
0,2,1,-2
3,0,0,0
""")
        XCTAssertEqual(day.part1(), 4)
    }

    func testDay25_1c() throws {
        let day = Day25(input: """
1,-1,0,1
2,0,-1,0
3,2,-1,0
0,0,3,1
0,0,-1,-1
2,3,-2,0
-2,2,0,0
2,-2,0,-1
1,-1,0,-1
3,2,0,2
""")
        XCTAssertEqual(day.part1(), 3)
    }

    func testDay25_1d() throws {
        let day = Day25(input: """
1,-1,-1,-2
-2,-2,0,1
0,2,1,3
-2,3,-2,1
0,2,3,-2
-1,-1,1,-2
0,-2,-1,0
-2,2,3,-1
1,2,2,0
-1,-2,0,-2
""")
        XCTAssertEqual(day.part1(), 8)
    }
}
