//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/18
//

import AoCTools

private enum Tile: Character, Drawable {
    case open = "."
    case trees = "|"
    case lumberyard = "#"

    static func value(for str: String) -> Self {
        Self(rawValue: Character(str))!
    }

    var draw: String { String(rawValue) }
}

final class Day18: AOCDay {
    private let area: [Point: Tile]

    init(input: String? = nil) {
        let input = input ?? Self.input

        var area = [Point: Tile]()
        for (y, line) in input.lines.enumerated() {
            for (x, ch) in line.enumerated() {
                let point = Point(x, y)
                area[point] = Tile(rawValue: ch)!
            }
        }
        self.area = area
    }

    func part1() -> Int {
        var area = self.area

        for _ in 0..<10 {
            let next = change(area)
            area = next
        }

        return score(area)
    }

    func part2() -> Int {
        var area = self.area

        var seen = [[Point: Tile]: Int]()
        seen[area] = 0

        var scores = [Int: Int]()
        scores[0] = score(area)

        var endLoop = 0
        var loopStart = 0

        for loop in 1..<1000000000 {
            let next = change(area)
            if let l = seen[next] {
                endLoop = loop
                loopStart = l
                break
            }
            area = next
            seen[area] = loop
            scores[loop] = score(area)
        }

        let index = (1000000000 - endLoop) % (endLoop - loopStart)

        return scores[loopStart + index]!
    }

    private func score(_ area: [Point: Tile]) -> Int {
        let trees = area.values.count { $0 == .trees }
        let lumber = area.values.count { $0 == .lumberyard }

        return trees * lumber
    }

    private func change(_ area: [Point: Tile]) -> [Point: Tile] {
        var result = [Point: Tile]()
        for (point, tile) in area {
            let neighbors = point.neighbors(adjacency: .all).compactMap { area[$0] }

            let new: Tile
            switch tile {
            case .open: new = neighbors.count { $0 == .trees } >= 3 ? .trees : .open
            case .trees: new = neighbors.count { $0 == .lumberyard } >= 3 ? .lumberyard : .trees
            case .lumberyard: new = (neighbors.count { $0 == .lumberyard } >= 1 && neighbors.count { $0 == .trees } >= 1) ? .lumberyard : .open
            }
            result[point] = new
        }
        return result
    }
}
