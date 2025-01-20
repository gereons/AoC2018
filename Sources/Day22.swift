//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/22
//

import AoCTools

final class Day22: AdventOfCodeDay {
    let title = "Mode Maze"

    final class Maze {
        let target: Point
        let depth: Int

        private var memo = [Point: Int]()

        init(target: Point, depth: Int) {
            self.target = target
            self.depth = depth
        }
    }

    let maze: Maze

    init(input: String) {
        var depth = 0
        var target = Point.zero
        for line in input.lines {
            let parts = line.components(separatedBy: " ")
            switch parts[0] {
            case "depth:":
                depth = Int(parts[1])!
            case "target:":
                let xy = parts[1].components(separatedBy: ",")
                target = Point(Int(xy[0])!, Int(xy[1])!)
            default:
                fatalError()
            }
        }
        self.maze = Maze(target: target, depth: depth)
    }

    func part1() -> Int {
        var sum = 0
        for x in 0...maze.target.x {
            for y in 0...maze.target.y {
                let level = maze.erosionLevel(maze.geologicIndex(for: Point(x, y)))
                sum += level % 3
            }
        }
        return sum
    }

    func part2() -> Int {
        let pathfinder = AStarPathfinder(map: maze)

        let path = pathfinder.shortestPath(from: Maze.PathNode(point: .zero, equipped: .torch),
                                           to: Maze.PathNode(point: maze.target, equipped: .torch))

        var prevEquipped: Maze.Tool? = .torch
        var switches = 0
        for p in path {
            if p.equipped != prevEquipped {
                switches += 1
            }
            prevEquipped = p.equipped
        }

        return path.count + switches * 7
    }
}

extension Day22.Maze {
    /*
     The region at 0,0 (the mouth of the cave) has a geologic index of 0.
     The region at the coordinates of the target has a geologic index of 0.
     If the region's Y coordinate is 0, the geologic index is its X coordinate times 16807.
     If the region's X coordinate is 0, the geologic index is its Y coordinate times 48271.
     Otherwise, the region's geologic index is the result of multiplying the erosion levels of the regions at X-1,Y and X,Y-1.
     */
    func geologicIndex(for point: Point) -> Int {
        if point == .zero || point == self.target {
            return 0
        }
        if point.y == 0 { return point.x * 16807 }
        if point.x == 0 { return point.y * 48271 }

        if let index = memo[point] {
            return index
        }
        let index1 = geologicIndex(for: Point(point.x-1, point.y))
        let index2 = geologicIndex(for: Point(point.x, point.y-1))

        let level = erosionLevel(index1) * erosionLevel(index2)
        memo[point] = level
        return level
    }

    func erosionLevel(_ index: Int) -> Int {
        (index + depth) % 20183
    }
}

extension Day22.Maze: Pathfinding {
    typealias Coordinate = PathNode

    enum Terrain {
        case rocky
        case wet
        case narrow

        init(level: Int) {
            switch level % 3 {
            case 0: self = .rocky
            case 1: self = .wet
            case 2: self = .narrow
            default: fatalError()
            }
        }
    }

    enum Tool {
        case climbingGear
        case torch
    }

    struct PathNode: Hashable {
        let point: Point
        let equipped: Tool?
    }

    func terrain(for point: Point) -> Terrain {
        Terrain(level: erosionLevel(geologicIndex(for: point)))
    }

    func neighbors(of node: PathNode) -> [PathNode] {
        let points = node.point.neighbors()
            .filter { $0.x >= 0 && $0.y >= 0 }
        
        var n = [PathNode]()
        let current = terrain(for: node.point)
        for p in points {
            if p == target {
                n.append(PathNode(point: p, equipped: .torch))
            } else {
                switch (current, terrain(for: p)) {
                case (.rocky, .rocky):
                    n.append(PathNode(point: p, equipped: .torch))
                    n.append(PathNode(point: p, equipped: .climbingGear))
                case (.wet, .rocky): ()
                    n.append(PathNode(point: p, equipped: .climbingGear))
                case (.narrow, .rocky): ()
                    n.append(PathNode(point: p, equipped: .torch))

                case (.wet, .wet):
                    n.append(PathNode(point: p, equipped: nil))
                    n.append(PathNode(point: p, equipped: .climbingGear))
                case (.rocky, .wet):
                    n.append(PathNode(point: p, equipped: .climbingGear))
                case (.narrow, .wet):
                    n.append(PathNode(point: p, equipped: nil))

                case (.narrow, .narrow):
                    n.append(PathNode(point: p, equipped: nil))
                    n.append(PathNode(point: p, equipped: .torch))
                case (.rocky, .narrow):
                    n.append(PathNode(point: p, equipped: .torch))
                case (.wet, .narrow):
                    n.append(PathNode(point: p, equipped: nil))
                }
            }
        }
        return n
    }

    func costToMove(from: PathNode, to: PathNode) -> Int {
        switch (from.equipped, to.equipped) {
        case (nil, nil):
            return 1
        case (.some(let e1), .some(let e2)):
            return e1 == e2 ? 1 : 8
        case (nil, .some), (.some, nil):
            return 8
        }
    }

    func distance(from: PathNode, to: PathNode) -> Int {
        from.point.distance(to: to.point)
    }
}
