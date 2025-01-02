//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/10
//

import AoCTools

private class Light {
    private(set) var current: Point
    let start: Point
    let velocity: Point

    nonisolated(unsafe) static let regex = Regex(pattern: #"position=< *(-?\d*), *(-?\d*)> velocity=< *(-?\d*), *(-?\d*)>"#)

    init(_ str: String) {
        let matches = Self.regex.matches(in: str)
        start = Point(Int(matches[0])!, Int(matches[1])!)
        velocity = Point(Int(matches[2])!, Int(matches[3])!)
        current = start
    }

    func move() {
        current = Point(current.x + velocity.x, current.y + velocity.y)
    }
}

final class Day10: AdventOfCodeDay {
    let title = "The Stars Align"
    private let lights: [Light]
    let height: Int

    convenience init(input: String) {
        self.init(input: input, height: 10)
    }

    init(input: String, height: Int) {
        lights = input.lines.map { Light($0) }
        self.height = height
    }

    func part1() -> Int {
        var count = 0
        while true {
            let uniqueLights = Set(lights.map { $0.current })
            let points = Dictionary(uniqueKeysWithValues: zip(uniqueLights, [Bool](repeating: true, count: uniqueLights.count)))
            let grid = Grid(points: points)

            let minY = points.keys.min { $0.y < $1.y }!.y
            if grid.maxY - minY < height {
                grid.draw()
                break
            }
            lights.forEach { $0.move() }
            count += 1
        }

        // solution: GJNKBZEE
        return count
    }

    func part2() -> Int {
        return 0
    }
}
