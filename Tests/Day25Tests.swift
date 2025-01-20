import Testing
@testable import AdventOfCode

@Suite struct Day25Tests {
    @Test func testDay25_part1() throws {
        var day = Day25(input: """
0,0,0,0
3,0,0,0
0,3,0,0
0,0,3,0
0,0,0,3
0,0,0,6
9,0,0,0
12,0,0,0
""")
        #expect(day.part1() == 2)

        day = Day25(input: """
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
        #expect(day.part1() == 4)

        day = Day25(input: """
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
        #expect(day.part1() == 3)

        day = Day25(input: """
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
        #expect(day.part1() == 8)
    }

    @Test func testDay25_part1_solution() {
        let day = Day25(input: Day25.input)
        #expect(day.part1() == 394)
    }
}
