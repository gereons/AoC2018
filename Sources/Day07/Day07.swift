//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/7
//

import AoCTools

private class Step {
    let id: String
    var prerequisites: [String]

    init(id: String, prerequisites: [String] = []) {
        self.id = id
        self.prerequisites = prerequisites
    }

    func isAvailable(done: String) -> Bool {
        let done = Set(done.map { $0 })
        let prereq = Set(prerequisites.map { Character($0) })
        return prereq.isSubset(of: done)
    }
}

private class Worker {
    let id: String

    private(set) var workingOn: String?
    private(set) var finishedAt: Int?

    init(id: String, workingOn: String? = nil, finishedAt: Int? = nil) {
        self.id = id
        self.workingOn = workingOn
        self.finishedAt = finishedAt
    }

    func startWork(on step: String, finishedAt: Int) {
        assert(workingOn == nil)
        workingOn = step
        self.finishedAt = finishedAt
    }

    func clear() {
        workingOn = nil
        finishedAt = nil
    }
}

final class Day07: AOCDay {
    private let steps: [String: Step]
    private let workers: Int
    private let baseDuration: Int

    convenience init(rawInput: String?) {
        self.init(rawInput: rawInput, workers: 5, baseDuration: 60)
    }

    init(rawInput: String? = nil, workers: Int, baseDuration: Int) {
        let input = rawInput ?? Self.rawInput

        var steps = [String: Step]()
        for line in input.lines {
            let parts = line.components(separatedBy: " ")
            // "Step C must be finished before step A can begin."
            let id = parts[7]
            let prereq = parts[1]

            if let step = steps[id] {
                step.prerequisites.append(prereq)
                step.prerequisites.sort(by: <)
                steps[id] = step
            } else {
                steps[id] = Step(id: id, prerequisites: [prereq])
            }
        }
        self.steps = steps
        self.workers = workers
        self.baseDuration = baseDuration
    }

    func part1() -> String {
        let allSteps = Set(steps.flatMap { $0.value.prerequisites })
        let start = allSteps.subtracting(steps.keys).sorted(by: <)

        var available = start
        var done = ""

        while !available.isEmpty {
            let id = available.removeFirst()
            done.append(id)

            let next = steps.values.filter { $0.isAvailable(done: done) }
                .map { $0.id }
                .filter { !done.contains($0) }

            available = Set(available + next).sorted(by: <)
        }
        
        return done
    }

    func part2() -> Int {
        let allSteps = Set(steps.flatMap { $0.value.prerequisites })
        let start = allSteps.subtracting(steps.keys).sorted(by: <)

        var available = start
        var done = ""
        var second = 0

        let workers = (0..<self.workers).map { Worker(id: "\($0)") }

        while true {
            var doneNow = [String]()
            for worker in workers where worker.workingOn != nil {
                if second >= worker.finishedAt! {
                    doneNow.append(worker.workingOn!)
                    worker.clear()
                }
            }

            done += doneNow.sorted(by: <).joined(separator: "")
            if done.count == steps.count + start.count {
                break
            }

            let next = steps.values.filter { $0.isAvailable(done: done) }
                .map { $0.id }
                .filter { !done.contains($0) }
                .filter { !workers.compactMap { $0.workingOn }.contains($0) }

            available = Set(available + next).sorted(by: <)

            for worker in workers where worker.workingOn == nil {
                if available.isEmpty { break }
                let id = available.removeFirst()
                worker.startWork(on: id, finishedAt: second + duration(id))
            }

            if available.isEmpty {
                let finished = workers.compactMap { $0.finishedAt }.min(by: <)
                second = finished!
            } else {
                second += 1
            }
        }

        return second
    }

    private func duration(_ id: String) -> Int {
        let ch = Character(id).asciiValue!
        return Int(ch - 64) + baseDuration
    }
}
