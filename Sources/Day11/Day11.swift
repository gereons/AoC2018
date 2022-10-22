//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/11
//
// see https://en.wikipedia.org/wiki/Summed-area_table
//

import AoCTools

final class Day11: AOCDay {
    let serial: Int
    let gridSize = 300
    private var grid = [[Int]]()
    private var summedArea = [[Int]]()

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

        let line = [Int](repeating: 0, count: gridSize + 1)
        grid = [[Int]](repeating: line, count: gridSize + 1)

        for x in 1...gridSize {
            for y in 1...gridSize {
                grid[x][y] = powerLevel(for: x, y: y)
            }
        }

        self.summedArea = summedArea(input: grid)
    }

    func summedArea(input: [[Int]]) -> [[Int]] {
        var result = input
        for x in 1 ..< input.count {
            for y in 1 ..< input[x].count {
                result[x][y] = input[x][y] + result[x][y-1] + result[x-1][y] - result[x-1][y-1]
            }
        }
        return result
    }

    func part1() -> String {
        initGrid()

        let (point, _) = findMaxSquare(size: 3)
        return "\(point.x),\(point.y)"
    }

    func part2() -> String {
        initGrid()

        var maxPower = Int.min
        var maxPoint = Point.zero
        var maxSize = 0

        for size in 1...gridSize {
            let (point, power) = findMaxSquare(size: size)
            if power > maxPower {
                maxPower = power
                maxPoint = point
                maxSize = size
            }
        }

        return "\(maxPoint.x),\(maxPoint.y),\(maxSize)"
    }

    private func findMaxSquare(size: Int) -> (Point, Int) {
        var maxPower = Int.min
        var maxPoint = Point.zero

        for x in 1 ... gridSize + 1 - size {
            for y in 1 ... gridSize + 1 - size {
                let pointA = Point(x - 1, y - 1)
                let pointB = Point(x + size - 1, y - 1)
                let pointC = Point(x - 1, y + size - 1)
                let pointD = Point(x + size - 1, y + size - 1)

                let powerSum =
                summedArea[pointD.x][pointD.y] +
                summedArea[pointA.x][pointA.y] -
                summedArea[pointB.x][pointB.y] -
                summedArea[pointC.x][pointC.y]

                if powerSum > maxPower {
                    maxPower = powerSum
                    maxPoint = Point(x, y)
                }
            }
        }

        return (maxPoint, maxPower)
    }
}
