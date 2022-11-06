//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/20
//

import AoCTools


final class Day20: AOCDay {
    let input: String
    init(rawInput: String? = nil) {
        input = rawInput ?? Self.rawInput
    }

    func part1() -> Int {
        let grid = fillGrid(input)

        return grid.values.max(by: <)!
    }

    func part2() -> Int {
        let grid = fillGrid(input)

        return grid.values.count { $0 >= 1000}
    }

    private func fillGrid(_ input: String) -> [Point: Int] {
        let move: [Character: Point.Direction] = [
            "N": .n,
            "W": .w,
            "E": .e,
            "S": .s
        ]

        var current = Point.zero
        var grid = [Point: Int]()
        grid[current] = 0
        var stack = Stack<Point>()

        for ch in input {
            switch ch {
            case "(": stack.push(current)
            case ")": current = stack.pop()
            case "|": current = stack.peek()!
            case "N", "W", "E", "S":
                let distance = grid[current]! + 1
                current = current.moved(move[ch]!)
                grid[current] = min(grid[current, default: Int.max], distance)
            case "^", "$": continue
            default: fatalError()
            }
        }

        return grid
    }
}
