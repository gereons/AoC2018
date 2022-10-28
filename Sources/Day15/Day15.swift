//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/15
//

import AoCTools

private enum Tile: String, Drawable {
    case goblin = "G"
    case elf = "E"
    case floor = "."
    case wall = "#"

    static func value(for str: String) -> Tile {
        Tile(rawValue: str)!
    }

    var draw: String {
        rawValue
    }
}

final class Day15: AOCDay {
    private let grid: Grid<Tile>

    init(rawInput: String? = nil) {
        let input = rawInput ?? Self.rawInput
        grid = Grid.parse(input)
    }

    func part1() -> Int {
        var grid = grid

        for _ in 0...5 {
            var newPoints = grid.points
            for y in 0...grid.maxY {
                for x in 0...grid.maxX {
                    let point = Point(x, y)
                    if newPoints[point] == .goblin || newPoints[point] == .elf {
                        newPoints[point] = .floor
                    }
                }
            }

            for y in 0...grid.maxY {
                for x in 0...grid.maxX {
                    let point = Point(x, y)

                    let path: [Point]
                    if grid.points[point] == .goblin {
                        path = findPath(from: point, toNearest: .elf, in: grid)
                    } else if grid.points[point] == .elf {
                        path = findPath(from: point, toNearest: .goblin, in: grid)
                    } else {
                        continue
                    }
                    if !path.isEmpty {
                        newPoints[path[0]] = grid.points[point]
                    }
                }
            }

            grid = Grid(points: newPoints)
            grid.draw()
        }
        return 0
    }

    private func findPath(from point: Point, toNearest opponent: Tile, in grid: Grid<Tile>) -> [Point] {
        let targets = grid.points.filter { $1 == opponent }

        var shortestPath = [Point]()
        var shortestPathLength = Int.max
        for target in targets.keys {
            let pathfinder = AStarPathfinder(map: grid)
            let path = pathfinder.shortestPath(from: point, to: target)
            if path.count < shortestPathLength {
                shortestPathLength = path.count
                shortestPath = path
            }
        }

        return shortestPath
    }

    func part2() -> Int {
        return 0
    }
}

extension Grid<Tile>: Pathfinding {
    public func neighbors(for point: Point) -> [Point] {
        let directions: [Point.Direction] = [.n, .e, .w, .s]
        let points = directions
            .map { point.moved($0) }
            .filter { self.points[$0] == .floor }
        return points
    }
}
