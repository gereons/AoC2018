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

    var alive: Bool { hp > 0 }

    init(type: Tile, position: Point, power: Int) {
        self.type = type
        self.position = position
        self.power = power
    }
}

final class Day15: AOCDay {
    private let grid: Grid<Tile>
    let input: String

    init(rawInput: String? = nil) {
        input = rawInput ?? Self.rawInput
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

    private func distance(_ u1: Unit, _ u2: Unit) -> Int {
        u1.position.distance(to: u2.position)
    }

    private func simulateBattle(grid: [Point: Tile], elfPower: Int = 3) -> Int? {
        var grid = grid

        var units = grid
            .filter { $1 == .elf || $1 == .goblin }
            .map {
                Unit(type: $1, position: $0, power: $1 == .elf ? elfPower : 3)
            }

        var round = 0
        var done = false

    loop:
        while !done {
            units = units
                .filter { $0.alive }
                .sorted { $0.position < $1.position }

            for unit in units {
                if !unit.alive {
                    continue
                }
                let targets = units
                    .filter { $0.alive && $0.type != unit.type }
                    .sorted {
                        if distance($0, unit) != distance($1, unit) {
                            return distance($0, unit) < distance($1, unit)
                        }
                        return $0.position < $1.position
                    }

                if targets.isEmpty {
                    done = true
                    break loop
                }

                if let target = targets.first, distance(target, unit) > 1 {
                    var path = [Point: Point]()
                    var queue = [unit.position]
                    var nearest = [Point]()
                    while !queue.isEmpty && nearest.isEmpty {
                        let step = queue.removeFirst()
                        for neighbor in step.neighbors().sorted() {
                            switch grid[neighbor] {
                            case .none:
                                continue
                            case .wall, unit.type:
                                break
                            case .floor:
                                if path[neighbor] == nil {
                                    path[neighbor] = step
                                    queue.append(neighbor)
                                }
                            default:
                                nearest.append(step)
                            }
                        }
                    }

                    if let chosen = nearest.sorted().first {
                        var step = chosen
                        while let p = path[step], p != unit.position {
                            step = p
                        }
                        grid[unit.position] = .floor
                        unit.position = step
                        grid[unit.position] = unit.type
                    }
                }

                let adjacent = targets
                    .filter { distance($0, unit) == 1 }
                    .sorted {
                        if $0.hp != $1.hp {
                            return $0.hp < $1.hp
                        }
                        return $0.position < $1.position
                    }
                
                if let target = adjacent.first {
                    target.hp -= unit.power
                    if !target.alive {
                        if elfPower > 3 && target.type == .elf {
                            return nil
                        }
                        grid[target.position] = .floor
                    }
                }
            }
            round += 1
        }

        print("combat ends after \(round) rounds, elfPower=\(elfPower)")
        let remainingHp = units
            .filter { $0.alive }
            .reduce(0) { $0 + $1.hp }
        return round * remainingHp
    }
}
