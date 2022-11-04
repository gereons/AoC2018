//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/17
//

import AoCTools

private enum Ground {
    case sand
    case clay
    case spring
    case water
}

final class Day17: AOCDay {
    private let map: [Point: Ground]

    init(rawInput: String? = nil) {
        let input = rawInput ?? Self.rawInput

        let regex = Regex(pattern: #"(.)=(\d*), (.)=(\d*)\.\.(\d*)"#)

        var map = [Point: Ground]()
        for line in input.lines {
            let matches = regex.matches(in: line)
            let dim1 = matches[0]
            let val1 = Int(matches[1])!
            let dim2 = matches[2]
            let start = Int(matches[3])!
            let end = Int(matches[4])!

            for v in start...end {
                let point: Point
                if dim1 == "x" {
                    point = Point(val1, v)
                    assert(dim2 == "y")
                } else {
                    assert(dim1 == "y" && dim2 == "x")
                    point = Point(v, val1)
                }
                map[point] = .clay
            }
        }

        self.map = map
    }

    func part1() -> Int {
        var map = self.map
        let spring = Point(500, 0)
        map[spring] = .spring

        draw(map: map)

        while true {
            let add = addWater(from: spring, map: map)
            if add.isEmpty { break }
            add.forEach { map[$0] = .water }
            print("-----")
            draw(map: map)
        }

        return 0
    }

    func part2() -> Int {
        return 0
    }

    private func addWater(from spring: Point, map: [Point: Ground]) -> [Point] {
        var start = spring
        while true {
            let down1 = start.moved(.s)
            if map[down1, default: .sand] != .sand {
                break
            }
            start = down1
        }

        let diag1 = start.moved(.sw)
        let diag2 = start.moved(.se)
        switch (map[diag1, default: .sand], map[diag2, default: .sand]) {
        case (.spring, _), (_, .spring): fatalError()
        case (.sand, .sand): return [diag1, diag2]
        case (.sand, _): return [diag1]
        case (_, .sand): return [diag2]
        default:
            if map[start, default: .sand] == .sand {
                return [start]
            }
        }

        let left = start.moved(.w)
        let right = start.moved(.e)
        switch (map[left, default: .sand], map[right, default: .sand]) {
        case (.spring, _), (_, .spring):
            fatalError()
        case (.sand, .sand):
            return [left, right]
        case (.sand, .clay), (.sand, .water):
            return [left]
        case (.clay, .sand), (.water, .sand):
            return [right]
        case (.water, .clay):
            return addWater(start: left, map: map)
        case (.clay, .water):
            return addWater(start: right, map: map)
        case (.water, .water), (.clay, .clay):
            let up = start.moved(.n)
            if map[up, default: .sand] == .sand {
                return [up]
            }
            fatalError()
        }
    }

    private func addWater(start point: Point, map: [Point: Ground]) -> [Point] {
        let down1 = point.moved(.s)

        switch map[down1, default: .sand] {
        case .spring: fatalError()
        case .sand: return [down1]
        case .water: return addWater(start: down1, map: map)
        case .clay:
            let left = point.moved(.w)
            let right = point.moved(.e)
            switch (map[left, default: .sand], map[right, default: .sand]) {
            case (.spring, _), (_, .spring):
                fatalError()
            case (.sand, .sand):
                return [left, right]
            case (.sand, .clay):
                return [left]
            case (.clay, .sand):
                return [right]
            case (.water, .clay):
                return addWater(start: left, map: map)
            case (.clay, .water):
                return addWater(start: right, map: map)
            case (.water, .sand):
                return [right] + addWater(start: left, map: map)
            case (.sand, .water):
                return [left] + addWater(start: right, map: map)
            case (.water, .water):
                return addWater(start: left, map: map) + addWater(start: right, map: map)
            case (.clay, .clay):
                return []
            }
        }
    }

    private func draw(map: [Point: Ground]) {
        for y in 0 ... 15 {
            for x in 490 ... 510 {
                let point = Point(x, y)
                let ch: Character
                switch map[point, default: .sand] {
                case .sand: ch = "."
                case .clay: ch = "#"
                case .spring: ch = "+"
                case .water: ch = "~"
                }
                print(ch, terminator: "")
            }
            print()
        }
    }
}
