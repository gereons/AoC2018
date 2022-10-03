//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/1
//

import AoCTools

final class Day01: AOCDay {
    let input: [Int]
    init(rawInput: String? = nil) {
        let input = rawInput ?? Self.rawInput
        self.input = input.asInts(separator: "\n")
    }

    func part1() -> Int {
        return input.reduce(0) { $0 + $1}
    }

    func part2() -> Int {
        var seen = Set([0])

        var frequency = 0
        while true {
            for change in input {
                frequency += change
                if seen.contains(frequency) {
                    return frequency
                }
                seen.insert(frequency)
            }
        }
    }
}
