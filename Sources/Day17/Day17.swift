//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/17
//

import AoCTools

private enum Ground: Character {
    case sand = "."
    case clay = "#"
    case spring = "+"
    case waterFlow = "|"
    case waterRest = "~"
}

final class Day17: AOCDay {
    private let map: [Point: Ground]
    private let maxY: Int
    private let minY: Int

    init(input: String) {
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
        self.maxY = map.keys.map { $0.y }.max()!
        self.minY = map.keys.map { $0.y }.min()!
    }

    func part1() -> Int {
        let map = fill(map)
        return map
            .filter { $0.key.y >= minY && $0.key.y <= maxY }
            .values.count { $0 == .waterFlow || $0 == .waterRest }
    }

    func part2() -> Int {
        let map = fill(map)
        return map
            .filter { $0.key.y >= minY && $0.key.y <= maxY }
            .values.count { $0 == .waterRest }
    }

    private func fill(_ map: [Point: Ground]) -> [Point: Ground] {
        var map = map
        let spring = Point(500, 0)
        var queue = [spring]

        func groundAt(_ x: Int, _ y: Int) -> Ground {
            map[Point(x, y), default: .sand]
        }

    next:
        while var point = queue.popLast(), [.sand, .spring].contains(map[point, default: .sand]) {
            // draw(map: map, maxY: maxY)
            while true {
                if point.y == (maxY) {
                    map[point] = .waterFlow
                    continue next
                } else {
                    let y = point.y
                    switch groundAt(point.x, y + 1) {
                    case .spring:
                        fatalError()
                    case .waterFlow:
                        map[point] = .waterFlow
                        continue next
                    case .sand:
                        queue.append(point)
                        point = Point(point.x, y + 1)
                    case .clay, .waterRest:
                        var xLeft = point.x - 1
                        while groundAt(xLeft, y) != .clay, (groundAt(xLeft, y + 1) == .clay || groundAt(xLeft, y + 1) == .waterRest) {
                            xLeft -= 1
                        }
                        var xRight = point.x + 1
                        while groundAt(xRight, y) != .clay, (groundAt(xRight, y + 1) == .clay || groundAt(xRight, y + 1) == .waterRest) {
                            xRight += 1
                        }
                        if groundAt(xLeft, y) == .clay, groundAt(xRight, y) == .clay {
                            for x in (xLeft + 1)...(xRight - 1) {
                                map[Point(x, y)] = .waterRest
                            }
                            continue next
                        } else {
                            if groundAt(xLeft, y + 1) == .sand {
                                queue.append(point)
                                point = Point(xLeft, y + 1)
                            } else if groundAt(xRight, y + 1) == .sand {
                                queue.append(point)
                                point = Point(xRight, y + 1)
                            } else {
                                if groundAt(xLeft, y) == .clay {
                                    xLeft += 1
                                }
                                if groundAt(xRight, y) == .clay {
                                    xRight -= 1
                                }
                                for x in xLeft...xRight {
                                    map[Point(x, y)] = .waterFlow
                                }
                                continue next
                            }
                        }
                    }
                }
            }
        }

        // draw(map: map, maxY: maxY)

        return map
    }

    private func draw(map: [Point: Ground], maxY: Int) {
        for y in 0 ... maxY {
            for x in 490 ... 510 {
                let point = Point(x, y)
                let g = map[point, default: .sand]
                print(g.rawValue, terminator: "")
            }
            print()
        }
        print("----")
    }
}
