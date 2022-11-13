//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/23
//

import AoCTools

private struct Bot {
    let point: Point3
    let range: Int

    static let regex = Regex(pattern: #"pos=<(-?\d*),(-?\d*),(-?\d*)>, r=(\d*)"#)

    init(_ str: String) {
        // pos=<0,0,0>, r=4
        let match = Self.regex.matches(in: str)
        point = Point3(Int(match[0])!, Int(match[1])!, Int(match[2])!)
        range = Int(match[3])!
    }
}

final class Day23: AOCDay {
    private let bots: [Bot]

    init(rawInput: String? = nil) {
        let input = rawInput ?? Self.rawInput
        bots = input.lines.map { Bot($0) }
    }

    func part1() -> Int {
        let strongest = bots.max { $0.range < $1.range }!

        var count = 0
        for bot in bots {
            if bot.point.distance(to: strongest.point) <= strongest.range {
                count += 1
            }
        }

        return count
    }

    func part2() -> Int {

        return 0
    }
}
