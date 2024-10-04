//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/1
//

import AoCTools

final class Day01: AOCDay {
    let ints: [Int]

    init(input: String) {
        self.ints = input.asInts(separator: "\n")
    }

    func part1() -> Int {
        return ints.reduce(0) { $0 + $1}
    }

    func part2() -> Int {
        var seen = Set([0])

        var frequency = 0
        while true {
            for change in ints {
                frequency += change
                if seen.contains(frequency) {
                    return frequency
                }
                seen.insert(frequency)
            }
        }
    }
}
