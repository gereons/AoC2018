//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/24
//

// https://www.reddit.com/r/adventofcode/comments/a91ysq/2018_day_24_solutions/

import AoCTools

/*
 17 units each with 5390 hit points (weak to radiation, bludgeoning) with an attack that does 4507 fire damage at initiative 2
 (\d*) units each with (\d*) hit points \(((.*) to (.*); )?(.*) to (.*)\) with an attack that does (\d*) (.*) damage at initiative (\d*)
 */

private class Army: CustomStringConvertible {
    enum Group: String, CustomStringConvertible {
        case immuneSystem
        case infection

        var description: String { rawValue }
    }

    struct Key: Hashable, CustomStringConvertible {
        let id: Int
        let group: Group

        var description: String {
            "\(group.rawValue) \(id)"
        }
    }

    let key: Key
    let initialUnits: Int
    var units: Int
    let hp: Int
    let weaknesses: Set<String>
    let immunities: Set<String>
    let dmg: Int
    let damageType: String
    let initiative: Int

    var damage: Int {
        switch key.group {
        case .immuneSystem: return dmg + boost
        case .infection: return dmg
        }
    }

    var alive: Bool { units > 0 }
    var power: Int { units * damage }

    var attacking: Key?
    var defending: Key?
    var boost = 0

    nonisolated(unsafe) static let regex = #/(\d*) units each with (\d*) hit points (\(((.*) to (.*); )?(.*) to (.*)\) )?with an attack that does (\d*) (.*) damage at initiative (\d*)/#

    var description: String {
        var wi = ""
        if !weaknesses.isEmpty {
            wi = "weak to \(weaknesses.joined(separator: ", "))"
        }
        if !immunities.isEmpty {
            if !wi.isEmpty {
                wi += "; "
            }
            wi += "immune to \(immunities.joined(separator: ", "))"
        }
        if !wi.isEmpty {
            wi = "(\(wi)) "
        }
        return "\(key): \(units) units each with \(hp) hit points \(wi)with an attack that does \(dmg) \(damageType) damage at initiative \(initiative)"
    }

    init(_ id: Int, _ group: Group, _ str: String) {
        self.key = Key(id: id, group: group)
        let matches = try! Self.regex.firstMatch(in: str)!
        initialUnits = Int(String(matches.1))!
        units = initialUnits
        hp = Int(String(matches.2))!

        var weaknesses = [String]()
        var immunities = [String]()
        if let kind = matches.5, let type = matches.6 {
            if kind == "weak" {
                weaknesses = type.components(separatedBy: ", ")
            } else {
                assert(kind == "immune")
                immunities = type.components(separatedBy: ", ")
            }
        }
        if let kind = matches.7, let type = matches.8 {
            if kind == "weak" {
                weaknesses = type.components(separatedBy: ", ")
            } else {
                assert(kind == "immune")
                immunities = type.components(separatedBy: ", ")
            }
        }

        self.weaknesses = Set(weaknesses)
        self.immunities = Set(immunities)

        dmg = Int(String(matches.9))!
        damageType = String(matches.10)
        initiative = Int(String(matches.11))!
    }

    func damage(from other: Army) -> Int {
        if immunities.contains(other.damageType) {
            return 0
        }

        if weaknesses.contains(other.damageType) {
            return other.power * 2
        }
        return other.power
    }

    func resetOpponents() {
        attacking = nil
        defending = nil
    }
}

final class Day24: AdventOfCodeDay {
    let title = "Immune System Simulator 20XX"
    private let armies: [Army.Key: Army]
    private let initiative: [Int: Army]

    init(input: String) {
        var armies = [Army]()
        var group = Army.Group.immuneSystem
        var id = 1
        for line in input.lines {
            if line.isEmpty { continue }
            if line.hasPrefix("Immune") {
                continue
            }
            if line.hasPrefix("Infect") {
                group = .infection
                id = 1
                continue
            }

            let group = Army(id, group, line)
            armies.append(group)
            id += 1
        }

        self.armies = Dictionary(uniqueKeysWithValues: zip(armies.map { $0.key }, armies))
        self.initiative = Dictionary(uniqueKeysWithValues: zip(armies.map { $0.initiative}, armies))
        assert(self.armies.count == self.initiative.count)
    }

    func part1() -> Int {
        armies.values.forEach {
            $0.units = $0.initialUnits
            $0.boost = 0
        }
        let result = battle()
        assert(result.winner == .infection)
        return result.survivors
    }

    func part2() -> Int {
        for boost in 0...2000 {
            armies.values.forEach {
                $0.units = $0.initialUnits
                $0.boost = boost
            }

            let result = battle()
            if result.winner == .immuneSystem {
                // print("min boost: \(boost)")
                return result.survivors
            }
        }

        fatalError()
    }

    private func battle() -> (winner: Army.Group, survivors: Int) {
        let initiatives = self.initiative.keys.sorted(by: >)
        while true {
            armies.values.forEach { $0.resetOpponents() }
            let immuneUnits = armies.values.filter { $0.key.group == .immuneSystem }.reduce(0) { $0 + $1.units }
            let infectUnits = armies.values.filter { $0.key.group == .infection }.reduce(0) { $0 + $1.units }

            if immuneUnits == 0 { return (winner: .infection, survivors: infectUnits) }
            if infectUnits == 0 { return (winner: .immuneSystem, survivors: immuneUnits) }

            assignOpponents()

            var sumKills = 0
            for ini in initiatives {
                guard
                    let attacker = self.initiative[ini],
                    attacker.alive,
                    let attacking = attacker.attacking
                else { continue }

                let defender = armies[attacking]!
                assert(defender.defending == attacker.key)
                assert(defender.alive)

                let damage = defender.damage(from: attacker)
                let kills = damage / defender.hp
                sumKills += kills
                // print(attacker.key, "deals", defender.damage(from: attacker), "dmg to", defender.key, "killing", kills)
                defender.units = max(0, defender.units - kills)
            }

            if sumKills == 0 {
                return (winner: .infection, survivors: infectUnits)
            }
        }
    }

    private func assignOpponents() {
        let attackers = armies.values
            .filter { $0.alive }
            .sorted(by: sortAttackers)

        for attacker in attackers {
            let opponents = armies.values
                .filter { $0.alive }
                .filter { $0.key.group != attacker.key.group }
                .filter { $0.defending == nil }
                .filter { $0.damage(from: attacker) != 0 }
                .sorted(by: sortDefenders(attacker))
            guard let defender = opponents.first else {
                continue
            }
            defender.defending = attacker.key
            attacker.attacking = defender.key

            // print("fight:", attacker.key, "attacks", defender.key, "for", defender.damage(from: attacker), "dmg")
        }
    }

    private func sortAttackers(_ lhs: Army, _ rhs: Army) -> Bool {
        if lhs.power != rhs.power {
            return lhs.power > rhs.power
        }
        return lhs.initiative > rhs.initiative
    }

    private func sortDefenders(_ attacker: Army) -> (Army, Army) -> Bool {
        return { lhs, rhs -> Bool in
            assert(lhs.key.group == rhs.key.group)
            if lhs.damage(from: attacker) != rhs.damage(from: attacker) {
                return lhs.damage(from: attacker) > rhs.damage(from: attacker)
            }
            if lhs.power != rhs.power {
                return lhs.power > rhs.power
            }
            return lhs.initiative > rhs.initiative
        }
    }
}
