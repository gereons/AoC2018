//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/8
//

import AoCTools

private class Node {
    var children: [Node]
    var metadata: [Int]

    init(children: [Node] = [], metadata: [Int] = []) {
        self.children = children
        self.metadata = metadata
    }

    var metadataSum: Int {
        let childSum = children.reduce(0) { $0 + $1.metadataSum }
        return childSum + metadata.reduce(0, +)
    }

    var nodeValue: Int {
        if children.isEmpty {
            return metadata.reduce(0, +)
        }

        var sum = 0
        for index in metadata {
            if 0..<children.count ~= index - 1 {
                sum += children[index - 1].nodeValue
            }
        }
        return sum
    }

}

final class Day08: AOCDay {
    let input: [Int]
    init(rawInput: String? = nil) {
        let input = rawInput ?? Self.rawInput
        self.input = input.components(separatedBy: " ").map { Int($0)! }
    }

    func part1() -> Int {
        var iterator = input.makeIterator()
        let root = createNode(&iterator)

        return root.metadataSum
    }

    private func createNode(_ iterator: inout IndexingIterator<[Int]>) -> Node {
        let expectedNodes = iterator.next()!
        let expectedMetadata = iterator.next()!

        var children = [Node]()
        for _ in 0..<expectedNodes {
            children.append(createNode(&iterator))
        }

        var metadata = [Int]()
        for _ in 0..<expectedMetadata {
            metadata.append(iterator.next()!)
        }

        return Node(children: children, metadata: metadata)
    }

    func part2() -> Int {
        var iterator = input.makeIterator()
        let root = createNode(&iterator)

        return root.nodeValue
    }
}
