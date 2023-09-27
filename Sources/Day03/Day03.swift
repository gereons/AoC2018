//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/3
//

import AoCTools

private struct Rect {
    let id: Int
    let x: Int
    let y: Int
    let width: Int
    let height: Int

    init(_ string: String) {
        // #1 @ 1,3: 4x4
        let regex = Regex(pattern: #"#(\d*) @ (\d*),(\d*): (\d*)x(\d*)"#)
        let matches = regex.matches(in: string)
        assert(matches.count == 5)
        id = Int(matches[0])!
        x = Int(matches[1])!
        y = Int(matches[2])!
        width = Int(matches[3])!
        height = Int(matches[4])!
    }

    var maxX: Int { x + width }
    var maxY: Int { y + height }

    var allPoints: [Point] {
        (x..<maxX).map { x in
            (y..<maxY).map { y in
                Point(x, y)
            }
        }.flatMap { $0 }
    }
}

final class Day03: AOCDay {
    private let rects: [Rect]
    init(input: String? = nil) {
        let input = input ?? Self.input
        rects = input.lines.map { Rect($0) }
    }

    func part1() -> Int {
        var use = [Point: Int]()

        for rect in rects {
            for x in rect.x..<rect.maxX {
                for y in rect.y..<rect.maxY {
                    use[Point(x,y), default: 0] += 1
                }
            }
        }

        return use.filter { $0.value > 1 }.count
    }

    func part2() -> Int {
        var claims = [Point: [Int]]()

        for rect in rects {
            for x in rect.x..<rect.maxX {
                for y in rect.y..<rect.maxY {
                    claims[Point(x,y), default: []].append(rect.id)
                }
            }
        }

        for rect in rects {
            if rect.allPoints.allSatisfy({ claims[$0]!.count == 1 }) {
                return rect.id
            }
        }
        fatalError()
    }
}
