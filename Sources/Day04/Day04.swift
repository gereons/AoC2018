//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/4
//

import AoCTools
import Foundation

private struct GuardRecord {
    let id: Int
    let date: Date
    let asleep: [Bool]

    var minutesAsleep: Int {
        asleep.count { $0 }
    }
}

final class Day04: AOCDay {
    private var records = [GuardRecord]()
    let lines: [String]

    init(input: String) {
        self.lines = input.lines
    }

    private func parseInput() {
        guard records.isEmpty else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "[yyyy-MM-dd HH:mm]"
        let calendar = Calendar.current

        var byDate = [Date: [String]]()
        for line in lines {
            let parts = line.components(separatedBy: " ")
            // moving the date to "modern" times avoid some really weird (leap-second?) results
            let fixedP0 = parts[0].replacingOccurrences(of: "1518", with: "1918")
            let lineDate = dateFormatter.date(from: "\(fixedP0) \(parts[1])")!
            byDate[lineDate] = parts
        }

        var currentGuard: Int?
        var fallsAsleep = -1
        var recordDate = Date()
        var asleep = [Bool](repeating: false, count: 60)

        var records = [GuardRecord]()

        for (date, parts) in byDate.sorted(by: { $0.key < $1.key }) {
            let minute = calendar.component(.minute, from: date)
            switch parts[2] {
            case "Guard":
                if let current = currentGuard {
                    let record = GuardRecord(id: current, date: calendar.startOfDay(for: recordDate), asleep: asleep)
                    records.append(record)
                    asleep = [Bool](repeating: false, count: 60)
                }
                currentGuard = Int(parts[3].dropFirst())
            case "falls":
                fallsAsleep = minute
                recordDate = date
            case "wakes":
                for s in fallsAsleep..<minute {
                    asleep[s] = true
                }
                fallsAsleep = -1
            default: fatalError()
            }
        }

        if let current = currentGuard {
            let record = GuardRecord(id: current, date: calendar.startOfDay(for: recordDate), asleep: asleep)
            records.append(record)
        }

        self.records = records
    }

    func part1() -> Int {
        parseInput()
        var sleepPerGuard = [Int: Int]()
        for record in records {
            sleepPerGuard[record.id, default: 0] += record.minutesAsleep
        }

        let sleepiest = sleepPerGuard.max { $0.value < $1.value }!

        var sleepiestMinute = [Int: Int]()
        for record in records where record.id == sleepiest.key {
            for (minute, sleep) in record.asleep.enumerated() {
                sleepiestMinute[minute, default: 0] += sleep ? 1 : 0
            }
        }

        let minute = sleepiestMinute.max { $0.value < $1.value }!

        return sleepiest.key * minute.key
    }

    func part2() -> Int {
        parseInput()
        var sleepiestMinute = [Pair<Int, Int>: Int]()

        for record in records {
            for (minute, sleep) in record.asleep.enumerated() {
                sleepiestMinute[Pair(record.id, minute), default: 0] += sleep ? 1 : 0
            }
        }

        let sleepiest = sleepiestMinute.max { $0.value < $1.value }!

        return sleepiest.key.first * sleepiest.key.second
    }
}
