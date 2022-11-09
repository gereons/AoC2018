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
        for r0 in [885103571386] {
            let cpu = ElfCode.CPU(ipRegister: self.ipRegister, registers: [r0, 0, 0, 0, 0, 0])
            let finished = cpu.run(program, maxSteps: 2000000)
            if r0.isMultiple(of: 1000) { print(r0) }
            if finished {
                return cpu.ic
            }
        }
        return 0
    }

    func part2() -> Int {
        return 0
    }
}
