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

    private func simulateBattle(grid: [Point: Tile], elfPower: Int = 3) -> Int? {
        var turn = 0

        var units = grid
            .filter { $1 == .elf || $1 == .goblin }
            .map {
                Unit(type: $1, position: $0, power: $1 == .elf ? elfPower : 3)
            }

        while true {
            units.sort { $0.position < $1.position }

            for i in 0..<units.count {
                if !units[i].isAlive {
                    continue
                }

                let targetPositions = units.filter { $0.type != units[i].type && $0.isAlive }.map { $0.position }
                let currentActorPositions = units.filter { $0.isAlive }.map { $0.position }
                var destinationPositions = [Point]()
                var metaMap = [Point: Point]()
                var maxDepth = Int.max
                var steps = [(Int, Point)]()
                steps.append((0, units[i].position))

                // success
                if targetPositions.isEmpty {
                    return turn * units.filter { $0.isAlive }.map { $0.hp }.reduce(0, +)
                }

            route:
                while steps.count > 0 {
                    let (currentDepth, currentStep) = steps.remove(at: 0)

                    if currentDepth > maxDepth {
                        continue
                    }

                    // check if the actor is in range of a target
                    for target in currentStep.neighbors().sorted() {
                        if targetPositions.contains(target) {
                            maxDepth = currentDepth
                            destinationPositions.append(currentStep)
                            continue route
                        }
                    }

                    for newStep in currentStep.neighbors().sorted() {
                        if grid[newStep] == .wall || currentActorPositions.contains(newStep) || metaMap[newStep] != nil {
                            continue
                        }

                        metaMap[newStep] = currentStep
                        steps.append((currentDepth + 1, newStep))
                    }
                }

                destinationPositions.sort(by: <)

                // route building
                var route = [Point]()
                if destinationPositions.count > 0 {
                    var step = destinationPositions[0]
                    route.append(step)
                    // builds the route backwards
                    while metaMap[step] != units[i].position {
                        if metaMap[step] != nil {
                            route.append(metaMap[step]!)
                            step = metaMap[step]!
                        } else {
                            break
                        }
                    }
                    units[i].position = (route.last ?? units[i].position)
                }

                // find all potential target indices adjacent to the current position
                var targetIndices = units.indices.filter {
                    units[$0].isAlive &&
                    units[$0].type != units[i].type &&
                    units[$0].position.distance(to: units[i].position) == 1
                }

                if !targetIndices.isEmpty {
                    targetIndices.sort {
                        if units[$0].hp != units[$1].hp {
                            return units[$0].hp < units[$1].hp
                        }
                        return units[$0].position < units[$1].position
                    }

                    units[targetIndices[0]].hp -= units[i].power
                    if elfPower > 3 && units[targetIndices[0]].type == .elf && !units[targetIndices[0]].isAlive {
                        return nil
                    }
                }
            }
            turn += 1
        }
    }
    
}
