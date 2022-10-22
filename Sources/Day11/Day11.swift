//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/11
//

import AoCTools

final class Day11: AOCDay {
    let serial: Int
    private var grid = [[Int]]()

    init(rawInput: String? = nil) {
        let input = rawInput ?? Self.rawInput
        serial = Int(input)!
    }

    func powerLevel(for x: Int, y: Int) -> Int {
        let rackId = x + 10
        let power = (rackId * y + serial) * rackId

        let hundreds = (power / 100) % 10
        return hundreds - 5
    }

    func initGrid() {
        guard grid.isEmpty else { return }

        let line = [Int](repeating: 0, count: 301)
        grid = [[Int]](repeating: line, count: 301)

        for x in 1...300 {
            for y in 1...300 {
                grid[x][y] = powerLevel(for: x, y: y)
            }
        }
    }

    func part1() -> String {
        initGrid()

        var maxPower = Int.min
        var maxPoint = Point.zero

        for x in 2...299 {
            for y in 2...299 {
                let point = Point(x, y)
                let neighbors = point.neighbors(adjacency: .all)
                let powerSum = neighbors.reduce(0) { $0 + grid[$1.x][$1.y] } + grid[point.x][point.y]
                if powerSum > maxPower {
                    maxPower = powerSum
                    maxPoint = Point(x-1, y-1)
                }
            }
        }

        return "\(maxPoint.x),\(maxPoint.y)"
    }

    func part2() -> String {
        initGrid()

        var maxPower = Int.min
        var maxPoint = Point.zero
        var maxSize = 0

        for size in 1...300 {
            for x in 1 ... 301 - size {
                for y in 1 ... 301 - size {
                    var powerSum = 0
                    for nx in x ..< x + size {
                        for ny in y ..< y + size {
                            powerSum += grid[nx][ny]
                        }
                    }
                    
                    if powerSum > maxPower {
                        maxPower = powerSum
                        maxPoint = Point(x, y)
                        maxSize = size
                    }
                }
            }
        }

        return "\(maxPoint.x),\(maxPoint.y),\(maxSize)"
    }
}
