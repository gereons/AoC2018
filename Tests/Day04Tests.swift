import Testing
@testable import AdventOfCode

@Suite struct Day04Tests {
    @Test func testDay04_part1() throws {
        let day = Day04(input: """
            [1918-11-01 00:00] Guard #10 begins shift
            [1918-11-01 00:05] falls asleep
            [1918-11-01 00:25] wakes up
            [1918-11-01 00:30] falls asleep
            [1918-11-01 00:55] wakes up
            [1918-11-01 23:58] Guard #99 begins shift
            [1918-11-02 00:40] falls asleep
            [1918-11-02 00:50] wakes up
            [1918-11-03 00:05] Guard #10 begins shift
            [1918-11-03 00:24] falls asleep
            [1918-11-03 00:29] wakes up
            [1918-11-04 00:02] Guard #99 begins shift
            [1918-11-04 00:36] falls asleep
            [1918-11-04 00:46] wakes up
            [1918-11-05 00:03] Guard #99 begins shift
            [1918-11-05 00:45] falls asleep
            [1918-11-05 00:55] wakes up
            """)
        #expect(day.part1() == 240)
    }

    @Test func testDay04_part2() throws {
        let day = Day04(input: """
            [1918-11-01 00:00] Guard #10 begins shift
            [1918-11-01 00:05] falls asleep
            [1918-11-01 00:25] wakes up
            [1918-11-01 00:30] falls asleep
            [1918-11-01 00:55] wakes up
            [1918-11-01 23:58] Guard #99 begins shift
            [1918-11-02 00:40] falls asleep
            [1918-11-02 00:50] wakes up
            [1918-11-03 00:05] Guard #10 begins shift
            [1918-11-03 00:24] falls asleep
            [1918-11-03 00:29] wakes up
            [1918-11-04 00:02] Guard #99 begins shift
            [1918-11-04 00:36] falls asleep
            [1918-11-04 00:46] wakes up
            [1918-11-05 00:03] Guard #99 begins shift
            [1918-11-05 00:45] falls asleep
            [1918-11-05 00:55] wakes up
            """)
        #expect(day.part2() == 4455)
    }

    @Test func testDay04_part1_solution() {
        let day = Day04(input: Day04.input)
        #expect(day.part1() == 35184)
    }

    @Test func testDay04_part2_solution() {
        let day = Day04(input: Day04.input)
        #expect(day.part2() == 37886)
    }
}
