//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/21
//

import AoCTools

final class Day21: AOCDay {
    let ipRegister: Int
    let program: [ElfCode.Instruction]

    init(rawInput: String? = nil) {
        let input = rawInput ?? Self.rawInput

        let (ipRegister, program) = ElfCode.parse(input.lines)
        self.ipRegister = ipRegister!
        self.program = program
    }

    func part1() -> Int {
        let cpu = ElfCode.CPU(ipRegister: ipRegister)
        if let value = cpu.run(program, breakAt: 28, watchRegister: 5) {
            return value
        }
        return 0
    }

    func part2() -> Int {
        let cpu = ElfCode.CPU(ipRegister: ipRegister)
        var seen = Set<Int>()
        var lastSeen = 0

        while true {
            if let value = cpu.run(program, breakAt: 28, watchRegister: 5) {
                if seen.contains(value) {
                    return lastSeen
                } else {
                    seen.insert(value)
                    lastSeen = value
                }
            }
        }
    }
}
