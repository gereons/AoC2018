//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/13
//

import AoCTools

private enum Track {
    case straightVertical
    case straightHorizontal
    case curve1
    case curve2
    case intersection

    var char: String {
        switch self {
        case .straightVertical: return "|"
        case .straightHorizontal: return "-"
        case .curve1: return "/"
        case .curve2: return "\\"
        case .intersection: return "+"
        }
    }
}

extension Point.Direction {
    var char: String {
        switch self {
        case .n: return "^"
        case .w: return "<"
        case .e: return ">"
        case .s: return "v"
        default: fatalError()
        }
    }
}

private class Cart {
    let initialDirection: Point.Direction

    var direction: Point.Direction
    var turnCount = 0

    init(direction: Point.Direction) {
        self.initialDirection = direction
        self.direction = direction
    }

    func reset() {
        self.direction = initialDirection
        self.turnCount = 0
    }
}

final class Day13: AOCDay {
    private let track: [Point: Track]
    private let carts: [Point: Cart]

    init(rawInput: String? = nil) {
        let input = rawInput ?? Self.rawInput

        var track = [Point: Track]()
        var carts = [Point: Cart]()

        for (y, line) in input.lines.enumerated() {
            for (x, ch) in line.enumerated() {
                let point = Point(x, y)
                switch ch {
                case "/": track[point] = .curve1
                case "\\": track[point] = .curve2
                case "|": track[point] = .straightVertical
                case "-": track[point] = .straightHorizontal
                case "+": track[point] = .intersection
                case "v": track[point] = .straightVertical; carts[point] = Cart(direction: .s)
                case "^": track[point] = .straightVertical; carts[point] = Cart(direction: .n)
                case "<": track[point] = .straightHorizontal; carts[point] = Cart(direction: .w)
                case ">": track[point] = .straightHorizontal; carts[point] = Cart(direction: .e)
                case " ": ()
                default: fatalError()
                }
            }
        }

        self.track = track
        self.carts = carts
    }

    func part1() -> String {
        var carts = self.carts
        carts.values.forEach { $0.reset() }

        // draw(track: self.track, carts: carts)
        var crashedAt: Point?
        while crashedAt == nil {
            var moved = [Point: Cart]()
            for entry in carts.sorted(by: { $0.key < $1.key }) {
                let point = entry.key
                let cart = entry.value

                let newPoint = move(cart, from: point)

                if moved[newPoint] != nil || carts[newPoint] != nil {
                    // print("crash at \(newPoint)")
                    crashedAt = newPoint
                    break
                } else {
                    moved[newPoint] = cart
                }
            }
            // draw(track: self.track, carts: moved)
            carts = moved
        }

        return "\(crashedAt!.x),\(crashedAt!.y)"
    }

    func part2() -> String {
        var carts = self.carts
        carts.values.forEach { $0.reset() }

        // draw(track: self.track, carts: carts)
        while true {
            var moved = [Point: Cart]()
            let points = carts.keys.sorted(by: <)
            for point in points {
                guard let cart = carts[point] else { continue }

                let newPoint = move(cart, from: point)

                assert(moved[newPoint] == nil)
                if carts[newPoint] != nil {
                    print("crash at \(newPoint)")
                    carts[newPoint] = nil
                    moved[newPoint] = nil
                } else {
                    moved[newPoint] = cart
                }
            }
            print(moved.count)
            // draw(track: self.track, carts: moved)
            carts = moved
            if moved.count == 1 {
                break
            }
        }

        assert(carts.count == 1)
        let point = carts.keys.first!
        return "\(point.x),\(point.y)"
    }

    private func move(_ cart: Cart, from point: Point) -> Point {
        var newPoint: Point?
        switch track[point] {
        case .straightVertical:
            assert(cart.direction == .n || cart.direction == .s)
            newPoint = point.moved(cart.direction)
        case .straightHorizontal:
            assert(cart.direction == .w || cart.direction == .e)
            newPoint = point.moved(cart.direction)
        case .curve1: // a "/" curve
            let dir = cart.direction
            let newDir: Point.Direction
            switch dir {
            case .n: newDir = Point.Direction.e
            case .s: newDir = Point.Direction.w
            case .w: newDir = Point.Direction.s
            case .e: newDir = Point.Direction.n
            default: fatalError()
            }
            newPoint = point + newDir.offset
            cart.direction = newDir
        case .curve2: // a "\" curve
            let dir = cart.direction
            let newDir: Point.Direction
            switch dir {
            case .n: newDir = Point.Direction.w
            case .s: newDir = Point.Direction.e
            case .w: newDir = Point.Direction.n
            case .e: newDir = Point.Direction.s
            default: fatalError()
            }
            newPoint = point + newDir.offset
            if cart.direction == .n || cart.direction == .s {

            }
            cart.direction = newDir
        case .intersection:
            switch cart.turnCount % 3 {
            case 0: // left
                let dir = cart.direction.turned(.counterclockwise)
                newPoint = point + dir.offset
                cart.direction = dir
            case 1: // straight
                newPoint = point + cart.direction.offset
            case 2: // right
                let dir = cart.direction.turned(.clockwise)
                newPoint = point + dir.offset
                cart.direction = dir
            default: fatalError()
            }
            cart.turnCount += 1
        case .none:
            fatalError()
        }

        assert(track[newPoint!] != nil)

        return newPoint!
    }

    private func draw(track: [Point: Track], carts: [Point: Cart]) {
        let minX = track.keys.map { $0.x }.min(by: <)!
        let maxX = track.keys.map { $0.x }.max(by: <)!
        let minY = track.keys.map { $0.y }.min(by: <)!
        let maxY = track.keys.map { $0.y }.max(by: <)!

        for y in minY ... maxY {
            for x in minX ... maxX {
                let point = Point(x, y)
                if let cart = carts[point] {
                    print(cart.direction.char, terminator: "")
                } else if let track = track[point] {
                    print(track.char, terminator: "")
                } else {
                    print(" ", terminator: "")
                }
            }
            print()
        }
        print("-----------------------------")
    }
}

extension Point: Comparable {
    public static func < (lhs: Point, rhs: Point) -> Bool {
        if lhs.y != rhs.y {
            return lhs.y < rhs.y
        }
        return lhs.x < rhs.x
    }
}
