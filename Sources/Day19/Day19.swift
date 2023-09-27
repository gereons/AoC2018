//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/19
//

import AoCTools

final class Day19: AOCDay {
    private let program: [ElfCode.Instruction]
    private let ipRegister: Int

    init(input: String? = nil) {
        let input = input ?? Self.input

        let (ipRegister, program) = ElfCode.parse(input.lines)

        self.program = program
        self.ipRegister = ipRegister!
    }

    func part1() -> Int {
        let cpu = ElfCode.CPU(ipRegister: self.ipRegister)
        cpu.run(self.program)
        return cpu.registers[0]
    }

    func part2() -> Int {
        // let cpu = CPU(ipRegister: self.ipRegister, registers: [1, 0, 0, 0, 0, 0])
        // cpu.run(self.program)
        // return cpu.registers[0]
        //
        // this takes waaaay too long
        //
        // so we resort to reverse engineering. the program calculates the sum of all factors that divide r3 after the
        // initialization phase (986 for part 1, giving 1620 as the result)
        //
        // for part2, r3 is 10551386.

        let target = 10551386
        return (1...target).reduce(0) { $0 + (target.isMultiple(of: $1) ? $1 : 0) }
    }
}
