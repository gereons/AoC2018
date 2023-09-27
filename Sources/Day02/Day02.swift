//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/3
//

import AoCTools

final class Day02: AOCDay {
    let input: [String]
    init(input: String? = nil) {
        self.input = (input ?? Self.input).lines
    }

    func part1() -> Int {
        var totalDoubles = 0
        var totalTriples = 0
        for line in input {
            let (doubles, triples) = check(line)
            if doubles > 0 {
                totalDoubles += 1
            }
            if triples > 0 {
                totalTriples += 1
            }
        }
        return totalDoubles * totalTriples
    }

    private func check(_ line: String) -> (Int, Int) {
        var freq = [Character: Int]()
        for ch in line {
            freq[ch, default: 0] += 1
        }
        let doubles = freq.filter { $0.value == 2 }.count
        let triples = freq.filter { $0.value == 3 }.count
        return (doubles, triples)
    }

    func part2() -> String {
        for line in input {
            for compare in input {
                assert(line.count == compare.count)
                var diffs = 0
                var diffIdx = line.startIndex
                for idx in line.indices {
                    if line[idx] != compare[idx] {
                        diffs += 1
                        diffIdx = idx
                    }
                }
                if diffs == 1 {
                    let start = line[line.startIndex..<diffIdx]
                    let end = line[line.index(after: diffIdx)...]
                    return String(start + end)
                }
            }
        }

        fatalError()
    }
}
