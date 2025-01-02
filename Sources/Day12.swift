//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/12
//

import AoCTools

private struct Note {
    let input: [Bool]
    let output: Bool

    init(_ str: String) {
        let parts = str.components(separatedBy: " ")
        input = parts[0].map { $0 == "#" }
        output = parts[2] == "#"
    }
}

final class Day12: AdventOfCodeDay {
    let title = "Subterranean Sustainability"
    let initialState: [Int: Bool]
    private let rules: [[Bool]: Bool]

    init(input: String) {
        let input = input.lines

        let line0 = input[0].components(separatedBy: " ")
        initialState = Dictionary(uniqueKeysWithValues: line0[2].enumerated().map { ($0.offset, $0.element == "#") })
        let notes = input.dropFirst(2).map { Note($0) }
        rules = Dictionary(uniqueKeysWithValues: zip(notes.map { $0.input}, notes.map { $0.output}))
    }

    func part1() -> Int {
        var current = initialState
        for _ in 0..<20 {
            current = spreadPlants(pots: current)
        }

        return current.reduce(0) { $0 + $1.key }
    }

    private func spreadPlants(pots: [Int: Bool]) -> [Int: Bool] {
        var next = [Int: Bool]()
        var keys = Set(pots.keys)
        for k in pots.keys {
            keys.formUnion([k-2, k-1, k+1, k+2])
        }
        for pot in keys {
            let state = state(at: pot, from: pots)
            if let result = rules[state] {
                next[pot] = result ? result : nil
            } else {
                next[pot] = nil
            }
        }
        return next
    }

    private func state(at index: Int, from pots: [Int: Bool]) -> [Bool] {
        [
            pots[index-2, default: false],
            pots[index-1, default: false],
            pots[index ,  default: false],
            pots[index+1, default: false],
            pots[index+2, default: false],
        ]
    }

    // running 50000000000 is impossible
    // by looking at the plant growth it appeared that a stable growth is reached after a few initial generation
    // find where that stable growth starts and extrapolate the end result from there
    func part2() -> Int {
        var current = initialState
        var previousDiff = 0
        var previousSize = 0
        var generation = 0
        let targetGenerations = 50000000000

        while true {
            current = spreadPlants(pots: current)
            let size = current.reduce(0) { $0 + $1.key }

            let diff = size - previousSize
            if diff != previousDiff {
                previousDiff = diff
                previousSize = size
                generation += 1
            } else {
                break
            }
        }

        return previousSize + (previousDiff * (targetGenerations - generation))
    }
}
