//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/23
//

import AoCTools

private struct Bot: Hashable {
    let point: Point3
    let range: Int

    nonisolated(unsafe) static let regex = Regex(pattern: #"pos=<(-?\d*),(-?\d*),(-?\d*)>, r=(\d*)"#)

    init(_ str: String) {
        // pos=<0,0,0>, r=4
        let match = Self.regex.matches(in: str)
        point = Point3(Int(match[0])!, Int(match[1])!, Int(match[2])!)
        range = Int(match[3])!
    }

    func inRange(of bot: Bot) -> Bool {
        point.distance(to: bot.point) <= range
    }

    func overlap(with bot: Bot) -> Bool {
        point.distance(to: bot.point) <= range + bot.range
    }
}

private final class BronKerbosch<T: Hashable> {
    let neighbors: [T: Set<T>]
    private var bestR = Set<T>()

    init(neighbors: [T: Set<T>]) {
        self.neighbors = neighbors
    }

    func largestClique() -> Set<T> {
        execute(p: Set(neighbors.keys))
        return bestR
    }

    private func execute(p: Set<T>, r: Set<T> = [], x: Set<T> = []) {
        if p.isEmpty && x.isEmpty {
            if r.count > bestR.count {
                bestR = r
            }
        } else {
            let mostNeighbors = Array(p + x).max { neighbors[$0]!.count < neighbors[$1]!.count }!
            let pWithoutNeighbors = p.subtracting(neighbors[mostNeighbors]!)
            for v in pWithoutNeighbors {
                let neighborsOfV = neighbors[v]!
                execute(p: p.intersection(neighborsOfV), r: r + v, x: x.intersection(neighborsOfV))
            }
        }
    }
}

final class Day23: AdventOfCodeDay {
    let title = "Experimental Emergency Teleportation"
    private let bots: [Bot]

    init(input: String) {
        bots = input.lines.map { Bot($0) }
    }

    func part1() -> Int {
        let strongest = bots.max { $0.range < $1.range }!

        var count = 0
        for bot in bots {
            if strongest.inRange(of: bot) {
                count += 1
            }
        }

        return count
    }

    // NB: crashes when run in Xcode or via plain `swift run`
    // works in release mode (swift run --configuration release), though
    func part2() -> Int {
        let neighbors = Dictionary(uniqueKeysWithValues: bots.map { bot in
            (bot, Set(bots.filter { $0 != bot && $0.overlap(with: bot) }))
        })
        let clique = BronKerbosch(neighbors: neighbors).largestClique()

        return clique.map { $0.point.distance() - $0.range }.max(by: <)!
    }
}
