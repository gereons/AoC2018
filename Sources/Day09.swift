//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/9
//

import AoCTools

final class Day09: AdventOfCodeDay {
    let title = "Marble Mania"
    let players: Int
    let lastMarble: Int

    init(input: String) {
        // "10 players; last marble is worth 1618 points"
        let parts = input.components(separatedBy: " ")
        players = Int(parts[0])!
        lastMarble = Int(parts[6])!
    }

    func part1() -> Int {
        playMarbles(lastMarble: self.lastMarble)
    }
    
    func part2() -> Int {
        playMarbles(lastMarble: self.lastMarble * 100)
    }

    private func playMarbles(lastMarble: Int) -> Int {
        let marbles = CircularBuffer<Int>()
        marbles.insert(value: 0)

        var currentPlayer = 0
        var scores = [Int: Int]()

        for marble in 1 ... lastMarble {
            if marble.isMultiple(of: 23) {
                marbles.moveCurrent(by: -7)
                let taken = marbles.remove()
                marbles.moveCurrent(by: 1)
                scores[currentPlayer, default: 0] += marble + taken
            } else {
                marbles.moveCurrent(by: 1)
                marbles.insert(value: marble)
            }

            currentPlayer = (currentPlayer + 1) % self.players
        }

        return scores.values.max(by: <)!
    }


}
