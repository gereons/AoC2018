//
//  File.swift
//  
//
//  Created by Gereon Steffens on 07.11.22.
//

import Foundation

enum ElfCode {
    static func parse(_ lines: [String]) -> (Int?, [Instruction]) {
        var ipRegister: Int?
        var program = [Instruction]()

        for line in lines {
            if line.hasPrefix("#ip") {
                let parts = line.components(separatedBy: " ")
                ipRegister = Int(parts[1])
            } else {
                program.append(Instruction(line))
            }
        }

        return (ipRegister, program)
    }

    enum Opcode: String, CaseIterable, CustomStringConvertible {
        case addr, addi
        case mulr, muli
        case banr, bani
        case borr, bori
        case setr, seti
        case gtir, gtri, gtrr
        case eqir, eqri, eqrr

        var description: String { rawValue }
    }

    struct Instruction {
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

    class CPU {
        private let ipRegister: Int
        private(set) var registers: [Int]
        private var ip = 0 // instruction pointer
        private(set) var ic = 0 // instruction counter

        init(ipRegister: Int, registers: [Int] = [Int](repeating: 0, count: 6)) {
            self.ipRegister = ipRegister
            assert(registers.count == 6)
            self.registers = registers
        }

        @discardableResult
        func run(_ program: [Instruction], maxSteps: Int? = nil) -> Bool {
            ic = 0
            var prevR = -1
            let r = 5
            while 0 ..< program.count ~= ip {
                let instruction = program[ip]
                print(ip, instruction.opcode, instruction.data, registers, terminator: " ")
                execute(instruction)
                print(registers)
//                if registers[r] != prevR {
//                    print(ip, registers)
//                }
                prevR = registers[r]
                ic += 1

                if let maxSteps, ic > maxSteps {
                    return false
                }
            }
            return true
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
}
