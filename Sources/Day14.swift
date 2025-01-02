//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/14
//

import AoCTools

final class Day14: AdventOfCodeDay {
    let title = "Chocolate Charts"
    let recipes: Int
    let rawInput: String

    init(input: String) {
        rawInput = input
        recipes = Int(input)!
    }

    func part1() -> String {
        var scores = [3, 7]
        var elf1 = 0
        var elf2 = 1

        while true {
            let sum = scores[elf1] + scores[elf2]
            if sum > 9 {
                scores.append(sum / 10)
                scores.append(sum % 10)
            } else {
                scores.append(sum)
            }
            elf1 = (elf1 + 1 + scores[elf1]) % scores.count
            elf2 = (elf2 + 1 + scores[elf2]) % scores.count
            if scores.count >= self.recipes + 10 {
                break
            }
        }

        return scores[recipes..<recipes+10].map { String($0) }.joined(separator: "")
    }

    func part2() -> Int {
        var scores = [3, 7]
        var elf1 = 0
        var elf2 = 1

        let digits = rawInput.map { Int(String($0))! }

        while true {
            let sum = scores[elf1] + scores[elf2]
            if sum > 9 {
                scores.append(sum / 10)
                scores.append(sum % 10)
            } else {
                scores.append(sum)
            }
            elf1 = (elf1 + 1 + scores[elf1]) % scores.count
            elf2 = (elf2 + 1 + scores[elf2]) % scores.count

            let end = scores.suffix(digits.count)
            if end == digits {
                return scores.count - digits.count
            }
            let end2 = scores.suffix(digits.count + 1).dropLast()
            if end2 == digits {
                return scores.count - digits.count - 1
            }
        }
    }
}

func == (lhs: Array<Int>.SubSequence, rhs: [Int]) -> Bool {
    if lhs.count != rhs.count { return false }

    var i1 = lhs.makeIterator()
    var i2 = rhs.makeIterator()
    for _ in 0..<lhs.count {
        if i1.next() != i2.next() {
            return false
        }
    }
    return true
}
