//
// Advent of Code 2018
//
// https://adventofcode.com/2018/day/13
//

import AoCTools
import Foundation

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

extension Direction {
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
    let id = UUID()
    var position: Point
    var direction: Direction
    var turnCount = 0
    var crashed = false

    init(position: Point, direction: Direction) {
        self.position = position
        self.direction = direction
    }

    func copy() -> Cart {
        Cart(position: self.position, direction: self.direction)
    }
}

final class Day13: AOCDay {
    private let track: [Point: Track]
    private let carts: [Cart]

    init(input: String) {
        var track = [Point: Track]()
        var carts = [Cart]()

        for (y, line) in input.lines.enumerated() {
            for (x, ch) in line.enumerated() {
                let point = Point(x, y)
                switch ch {
                case "/": track[point] = .curve1
                case "\\": track[point] = .curve2
                case "|": track[point] = .straightVertical
                case "-": track[point] = .straightHorizontal
                case "+": track[point] = .intersection
                case "v": track[point] = .straightVertical; carts.append(Cart(position: point, direction: .s))
                case "^": track[point] = .straightVertical; carts.append(Cart(position: point, direction: .n))
                case "<": track[point] = .straightHorizontal; carts.append(Cart(position: point, direction: .w))
                case ">": track[point] = .straightHorizontal; carts.append(Cart(position: point, direction: .e))
                case " ": ()
                default: fatalError()
                }
            }
        }

        self.track = track
        self.carts = carts
    }

    func part1() -> String {
        let carts = self.carts.map { $0.copy() }

        // draw(track: self.track, carts: carts)
        while true {
            for cart in carts.sorted(by: { $0.position < $1.position }) {
                let point = cart.position

                let newPoint = move(cart, from: point)
                cart.position = newPoint

                let crashed = carts.filter {
                    $0.id != cart.id && $0.position == cart.position
                }

                if let crash = crashed.first {
                    return crash.position.description
                }
            }
            // draw(track: self.track, carts: moved)
        }
    }

    func part2() -> String {
        let carts = self.carts.map { $0.copy() }

        // draw(track: self.track, carts: carts)
        while true {
            for cart in carts.sorted(by: { $0.position < $1.position }) {
                if cart.crashed { continue }
                let point = cart.position

                let newPoint = move(cart, from: point)
                cart.position = newPoint

                let crashed = carts.filter {
                    $0.id != cart.id && !$0.crashed && $0.position == cart.position
                }

                if let crash = crashed.first {
                    crash.crashed = true
                    cart.crashed = true
                    continue
                }
            }
            let remaining = carts.filter { !$0.crashed }
            if remaining.count == 1 {
                return remaining[0].position.description
            }
            // draw(track: self.track, carts: moved)
        }
    }

    private func move(_ cart: Cart, from point: Point) -> Point {
        var newPoint: Point?
        switch track[point] {
        case .straightVertical:
            newPoint = point.moved(to: cart.direction)
        case .straightHorizontal:
            newPoint = point.moved(to: cart.direction)
        case .curve1: // a "/" curve
            let dir = cart.direction
            let newDir: Direction
            switch dir {
            case .n: newDir = .e
            case .s: newDir = .w
            case .w: newDir = .s
            case .e: newDir = .n
            default: fatalError()
            }
            newPoint = point + newDir.offset
            cart.direction = newDir
        case .curve2: // a "\" curve
            let dir = cart.direction
            let newDir: Direction
            switch dir {
            case .n: newDir = .w
            case .s: newDir = .e
            case .w: newDir = .n
            case .e: newDir = .s
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
