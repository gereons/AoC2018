//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/5
//

import AoCTools

final class Day05: AOCDay {
    let polymers: [Character]
    init(input: String? = nil) {
        let input = input ?? Self.input
        polymers = input.map { $0 }
    }

    func part1() -> Int {
        return react(polymers)
    }

    private func react(_ polymers: [Character]) -> Int {
        var polymers = polymers

        var startIndex = 0
        while polymers.count > 0 {
            var didReact = false
            for index in startIndex ..< polymers.count - 1 {
                let ch1 = polymers[index]
                let ch2 = polymers[index + 1]
                if ch1.lowercased() != ch2.lowercased() {
                    continue
                }

                if (ch1.isLowercase && ch2.isUppercase) || (ch2.isLowercase && ch1.isUppercase) {
                    // react!
                    polymers.removeSubrange(index...index+1)
                    didReact = true
                    startIndex = max(0, index - 1)
                    break
                }
            }

            if !didReact {
                break
            }
        }

        return polymers.count
    }

    func part2() -> Int {
        let units = Set(self.polymers.map { $0.lowercased() })

        var minCount = Int.max
        for unit in units {
            let polymers = self.polymers.filter {
                $0.lowercased() != unit
            }

            let count = react(polymers)
            minCount = min(minCount, count)
        }

        return minCount
    }
}
