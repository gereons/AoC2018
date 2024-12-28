//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/16
//

import AoCTools
import Algorithms

private struct Sample {
    let before: [Int]
    let instruction: [Int]
    let after: [Int]

    init(_ lines: [String]) {
        let parts1 = lines[0].split(separator: " ", maxSplits: 1)
        assert(parts1[0] == "Before:")
        before = String(parts1[1].dropFirst().dropLast()).integers()

        instruction = lines[1].integers()

        let parts3 = lines[2].split(separator: " ", maxSplits: 1)
        assert(parts3[0] == "After:")
        after = String(parts3[1].dropFirst(2).dropLast()).integers()
    }
}

private enum Opcode: CaseIterable {
    case addr, addi
    case mulr, muli
    case banr, bani
    case borr, bori
    case setr, seti
    case gtir, gtri, gtrr
    case eqir, eqri, eqrr
}

private class CPU {
    var registers: [Int]

    init(registers: [Int]) {
        self.registers = registers
    }

    func checkOpcode(_ opcode: Opcode, instruction: [Int]) -> [Int] {
        var registers = self.registers
        switch opcode {
        case .addr: registers[instruction[3]] = registers[instruction[1]] + registers[instruction[2]]
        case .addi: registers[instruction[3]] = registers[instruction[1]] + instruction[2]
        case .mulr: registers[instruction[3]] = registers[instruction[1]] * registers[instruction[2]]
        case .muli: registers[instruction[3]] = registers[instruction[1]] * instruction[2]
        case .banr: registers[instruction[3]] = registers[instruction[1]] & registers[instruction[2]]
        case .bani: registers[instruction[3]] = registers[instruction[1]] & instruction[2]
        case .borr: registers[instruction[3]] = registers[instruction[1]] | registers[instruction[2]]
        case .bori: registers[instruction[3]] = registers[instruction[1]] | instruction[2]
        case .setr: registers[instruction[3]] = registers[instruction[1]]
        case .seti: registers[instruction[3]] = instruction[1]
        case .gtir: registers[instruction[3]] = instruction[1] > registers[instruction[2]] ? 1 : 0
        case .gtri: registers[instruction[3]] = registers[instruction[1]] > instruction[2] ? 1 : 0
        case .gtrr: registers[instruction[3]] = registers[instruction[1]] > registers[instruction[2]] ? 1 : 0
        case .eqir: registers[instruction[3]] = instruction[1] == registers[instruction[2]] ? 1 : 0
        case .eqri: registers[instruction[3]] = registers[instruction[1]] == instruction[2] ? 1 : 0
        case .eqrr: registers[instruction[3]] = registers[instruction[1]] == registers[instruction[2]] ? 1 : 0
        }

        return registers
    }
}

final class Day16: AOCDay {
    private let samples: [Sample]
    private let testProgram: [[Int]]

    init(input: String) {
        let sampleInput = input.lines.chunks(ofCount: 4)

        var samples = [Sample]()
        var program = [[Int]]()
        for sample in sampleInput where sample.count == 4 {
            if sample.first!.hasPrefix("Before:") {
                samples.append(Sample(Array(sample)))
            } else {
                for line in sample where !line.isEmpty {
                    program.append(line.integers())
                }
            }
        }
        self.samples = samples
        self.testProgram = program
    }

    func part1() -> Int {
        var sum = 0
        for sample in samples {
            if checkMatches(sample).count >= 3 {
                sum += 1
            }
        }
        return sum
    }

    func part2() -> Int {
        var map = [Int: Opcode]()
        var knownOpcodes = Set<Opcode>()

        // determine opcodes
        while map.count != Opcode.allCases.count {
            for sample in samples {
                let matches = Set(checkMatches(sample)).subtracting(knownOpcodes)
                if matches.count == 1 {
                    knownOpcodes.insert(matches.first!)
                    map[sample.instruction[0]] = matches.first!
                    break
                }
            }
        }

        // run test program
        let cpu = CPU(registers: [0, 0, 0, 0])
        for instruction in testProgram {
            let opcode = map[instruction[0]]!
            let reg = cpu.checkOpcode(opcode, instruction: instruction)
            cpu.registers = reg
        }

        return cpu.registers[0]
    }

    private func checkMatches(_ sample: Sample) -> [Opcode] {
        var opcodes = [Opcode]()

        for opcode in Opcode.allCases {
            let cpu = CPU(registers: sample.before)
            let registers = cpu.checkOpcode(opcode, instruction: sample.instruction)
            if registers == sample.after {
                opcodes.append(opcode)
            }
        }
        return opcodes
    }
}
