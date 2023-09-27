//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/15
//

import AoCTools

private enum Tile: Character, Drawable {
    case goblin = "G"
    case elf = "E"
    case floor = "."
    case wall = "#"
}

private final class Unit {
    let type: Tile
    let power: Int
    var hp = 200
    var position: Point

    var isAlive: Bool { hp > 0 }

    init(type: Tile, position: Point, power: Int) {
        self.type = type
        self.position = position
        self.power = power
    }
}

final class Day15: AOCDay {
    private let grid: Grid<Tile>

    init(input: String? = nil) {
        let input = input ?? Self.input
        grid = Grid<Tile>.parse(input)
    }

    func part1() -> Int {
        simulateBattle(grid: grid.points)!
    }

    func part2() -> Int {
        for elfPower in 4...100 {
            if let result = simulateBattle(grid: grid.points, elfPower: elfPower) {
                return result
            }
        }
        fatalError()
    }

    private func simulateBattle(grid: [Point: Tile], elfPower: Int = 3) -> Int? {
        var turn = 0

        var units = grid
            .filter { $1 == .elf || $1 == .goblin }
            .map {
                Unit(type: $1, position: $0, power: $1 == .elf ? elfPower : 3)
            }

        while true {
            units = units
                .filter { $0.isAlive }
                .sorted { $0.position < $1.position }

            for unit in units {
                if !unit.isAlive {
                    continue
                }

                let targets = Set(units.filter { $0.type != unit.type && $0.isAlive }.map { $0.position })
                let currentUnitPositions = Set(units.filter { $0.isAlive }.map { $0.position })
                var destinations = [Point]()
                var path = [Point: Point]()
                var maxDepth = Int.max
                var steps = [(Int, Point)]()
                steps.append((0, unit.position))

                // battle ends when no target remains
                if targets.isEmpty {
                    return turn * units.filter { $0.isAlive }.reduce(0) { $0 + $1.hp }
                }

            loop:
                while steps.count > 0 {
                    let (currentDepth, currentStep) = steps.remove(at: 0)

                    if currentDepth > maxDepth {
                        continue
                    }

                    for target in currentStep.neighbors().sorted() {
                        if targets.contains(target) {
                            maxDepth = currentDepth
                            destinations.append(currentStep)
                            continue loop
                        }
                    }

                    for newStep in currentStep.neighbors().sorted() {
                        if grid[newStep] == .wall || currentUnitPositions.contains(newStep) || path[newStep] != nil {
                            continue
                        }

                        path[newStep] = currentStep
                        steps.append((currentDepth + 1, newStep))
                    }
                }

                // move unit
                if let step = destinations.min(by: <) {
                    var newPosition = step
                    while let p = path[newPosition], p != unit.position {
                        newPosition = p
                    }
                    unit.position = newPosition
                }

                // find adjacent units
                let adjacents = units
                    .filter {
                        $0.isAlive &&
                        $0.type != unit.type &&
                        $0.position.distance(to: unit.position) == 1
                    }
                    .sorted {
                        if $0.hp != $1.hp {
                            return $0.hp < $1.hp
                        }
                        return $0.position < $1.position
                    }

                // deal damage
                if let adjacent = adjacents.first {
                    adjacent.hp -= unit.power
                    if elfPower > 3 && adjacent.type == .elf && !adjacent.isAlive {
                        return nil
                    }
                }
            }
            turn += 1
        }
    }
}
