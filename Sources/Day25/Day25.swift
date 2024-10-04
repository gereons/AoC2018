//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/25
//

import AoCTools
import Foundation

private struct Point4: Hashable {
    let w,x,y,z: Int

    static let zero = Point4(0, 0, 0, 0)

    init(_ w: Int, _ x: Int, _ y: Int, _ z: Int) {
        self.w = w
        self.x = x
        self.y = y
        self.z = z
    }

    init(_ str: String) {
        let parts = str.components(separatedBy: ",")
        w = Int(parts[0])!
        x = Int(parts[1])!
        y = Int(parts[2])!
        z = Int(parts[3])!
    }

    func distance(to point: Point4) -> Int {
        abs(w - point.w) + abs(x - point.x) + abs(y - point.y) + abs(z - point.z)
    }
}

private class Constellation: Equatable {
    static func == (lhs: Constellation, rhs: Constellation) -> Bool {
        lhs.id == rhs.id
    }

    let id = UUID()
    var points = Set<Point4>()

    var isEmpty: Bool { points.isEmpty }

    func isClose(to point: Point4) -> Bool {
        points.contains { $0.distance(to: point) <= 3 }
    }
}

final class Day25: AOCDay {
    private let points: [Point4]

    init(input: String) {
        points = input.lines.map { Point4($0) }
    }

    func part1() -> Int {
        var constellations = [Constellation]()

        for point in points.sorted(by: { $0.distance(to: .zero) < $1.distance(to: .zero) } ) {
            if let con = constellations.first(where: { $0.isClose(to: point) }) {
                con.points.insert(point)
            } else {
                let con = Constellation()
                con.points.insert(point)
                constellations.append(con)
            }
        }

        for c1 in constellations {
            for c2 in constellations {
                if c1 == c2 || c1.isEmpty || c2.isEmpty { continue }
                if c2.points.contains(where: { c1.isClose(to: $0) }) {
                    c1.points.formUnion(c2.points)
                    c2.points.removeAll()
                }
            }
        }

        return constellations.count { !$0.isEmpty }
    }

    func part2() {}
}
