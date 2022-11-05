//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/19
//

import AoCTools

private enum Opcode: String, CaseIterable, CustomStringConvertible {
    case addr, addi
    case mulr, muli
    case banr, bani
    case borr, bori
    case setr, seti
    case gtir, gtri, gtrr
    case eqir, eqri, eqrr

    var description: String { rawValue }
}

private struct Instruction {
    let opcode: Opcode
    let data: [Int]

    init(_ str: String) {
        // seti 5 0 1
        let parts = str.components(separatedBy: " ")
        assert(parts.count == 4)
        opcode = Opcode(rawValue: parts[0])!
        data = [ Int(parts[1])!, Int(parts[2])!, Int(parts[3])! ]
    }
}

private class CPU {
    private let ipRegister: Int
    private(set) var registers: [Int]
    private var ip = 0

    init(ipRegister: Int, registers: [Int] = [Int](repeating: 0, count: 6)) {
        self.ipRegister = ipRegister
        assert(registers.count == 6)
        self.registers = registers
    }

    func run(_ program: [Instruction]) {
        var prevR0 = registers[0]
        while 0 ..< program.count ~= ip {
            let instruction = program[ip]
            // print(ip, registers, instruction, terminator: " ")
            execute(instruction)
            if registers[0] != prevR0 {
                // print(registers)
            }
            prevR0 = registers[0]
        }
    }

    private func execute(_ instruction: Instruction) {
        registers[ipRegister] = ip

        let data = instruction.data
        let result: Int
        switch instruction.opcode {
        case .addr: result = registers[data[0]] + registers[data[1]]
        case .addi: result = registers[data[0]] + data[1]
        case .mulr: result = registers[data[0]] * registers[data[1]]
        case .muli: result = registers[data[0]] * data[1]
        case .banr: result = registers[data[0]] & registers[data[1]]
        case .bani: result = registers[data[0]] & data[1]
        case .borr: result = registers[data[0]] | registers[data[1]]
        case .bori: result = registers[data[0]] | data[1]
        case .setr: result = registers[data[0]]
        case .seti: result = data[0]
        case .gtir: result = data[0] > registers[data[1]] ? 1 : 0
        case .gtri: result = registers[data[0]] > data[1] ? 1 : 0
        case .gtrr: result = registers[data[0]] > registers[data[1]] ? 1 : 0
        case .eqir: result = data[0] == registers[data[1]] ? 1 : 0
        case .eqri: result = registers[data[0]] == data[1] ? 1 : 0
        case .eqrr: result = registers[data[0]] == registers[data[1]] ? 1 : 0
        }

        registers[data[2]] = result
        ip = registers[ipRegister]
        ip += 1
    }
}


final class Day19: AOCDay {
    private let program: [Instruction]
    private let ipRegister: Int

    init(rawInput: String? = nil) {
        let input = rawInput ?? Self.rawInput

        var ipRegister = 0
        var program = [Instruction]()
        for line in input.lines {
            if line.hasPrefix("#ip") {
                let parts = line.components(separatedBy: " ")
                ipRegister = Int(parts[1])!
            } else {
                program.append(Instruction(line))
            }
        }

        self.program = program
        self.ipRegister = ipRegister
    }

    func part1() -> Int {
        let cpu = CPU(ipRegister: self.ipRegister)
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
