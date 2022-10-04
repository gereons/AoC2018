import XCTest
@testable import AdventOfCode

final class Day04Tests: XCTestCase {
    func testDay04_1() throws {
        let day = Day04(rawInput: """
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
        XCTAssertEqual(day.part1(), 240)
    }

    func testDay04_2() throws {
        let day = Day04(rawInput: """
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
        XCTAssertEqual(day.part2(), 4455)
    }
}
