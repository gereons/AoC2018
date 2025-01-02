//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/6
//

import AoCTools

final class Day06: AdventOfCodeDay {
    let title = "Chronal Coordinates"
    let points: [Point]
    let distanceLimit: Int

    convenience init(input: String) {
        self.init(input: input, distanceLimit: 10000)
    }

    init(input: String, distanceLimit: Int) {
        var points = [Point]()
        for line in input.lines {
            let parts = line.components(separatedBy: ", ")
            let x = Int(parts[0])
            let y = Int(parts[1])
            let point = Point(x!, y!)
            points.append(point)
        }
        self.points = points
        self.distanceLimit = distanceLimit
    }

    func part1() -> Int {
        let n1 = neighbors(for: points, border: 1)
        let n10 = neighbors(for: points, border: 10)

        var unchanged = [Point: Int]()
        for point in n1.keys {
            let c1 = n1[point]!
            let c2 = n10[point]!

            if c1 == c2 {
                unchanged[point] = c1
            }
        }

        let max = unchanged.max { $0.value < $1.value }!
        return max.value
    }

    private func neighbors(for points: [Point], border: Int) -> [Point: Int] {
        let minX = points.map { $0.x }.min(by: <)!
        let maxX = points.map { $0.x }.max(by: <)!
        let minY = points.map { $0.y }.min(by: <)!
        let maxY = points.map { $0.y }.max(by: <)!

        var distances = [Point: [Point: Int]]()
        for x in (minX-border) ... (maxX+border) {
            for y in (minY-border) ... (maxY+border) {
                let point = Point(x, y)
                for target in points {
                    let distance = point.distance(to: target)
                    distances[point, default: [:]][target] = distance
                }
            }
        }

        var neighbors = [Point: Point]()
        for (point, distances) in distances {
            let d = distances.sorted { $0.value < $1.value }
            if d[0].value < d[1].value {
                neighbors[point] = d[0].key
            }
        }

        var neighborCount = [Point: Int]()
        for point in points {
            let n = neighbors.count { $0.value == point }
            neighborCount[point] = n
        }

        return neighborCount
    }

    func part2() -> Int {
        let distanceSums = distanceSums(for: points, border: 1)

        return distanceSums.count { $0.value < distanceLimit }
    }

    private func distanceSums(for points: [Point], border: Int) -> [Point: Int] {
        let minX = points.map { $0.x }.min(by: <)!
        let maxX = points.map { $0.x }.max(by: <)!
        let minY = points.map { $0.y }.min(by: <)!
        let maxY = points.map { $0.y }.max(by: <)!

        var distances = [Point: Int]()
        for x in (minX-border) ... (maxX+border) {
            for y in (minY-border) ... (maxY+border) {
                let point = Point(x, y)
                for target in points {
                    let distance = point.distance(to: target)
                    distances[point, default: 0] += distance
                }
            }
        }

        return distances
    }
}
