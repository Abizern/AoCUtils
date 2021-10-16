import Foundation

public struct Point {
    public var x: Int
    public var y: Int

    public init(x: Int = 0, y: Int = 0) {
        self.x = x
        self.y = y
    }
}

extension Point {
    public enum Direction: CaseIterable {
        case up
        case right
        case down
        case left
    }
}

//
extension Point {
    public mutating func translate(_ dir: Direction, by amount: Int) {
        guard amount != 0 else { return }
        switch dir {
        case .up:
            y += amount
        case .right:
            x += amount
        case .down:
            y -= amount
        case .left:
            x -= amount
        }
    }

    public func translated(_ dir: Direction, by amount: Int) -> Point {
        var pt = self
        pt.translate(dir, by: amount)
        return pt
    }
}

extension Point.Direction {
    public enum Turn {
        case left
        case right
    }

    public mutating func turn(_ turn: Turn) {
        self = self.turned(turn)
    }

    public func turned(_ turn: Turn) -> Point.Direction {
        let directions = Self.allCases
        let index = directions.firstIndex(of: self)!
        let newIndex: Int

        switch turn {
        case .left:
            newIndex = (index + 4 - 1) % 4
        case .right:
            newIndex = (index + 1) % 4
        }

        return directions[newIndex]
    }
}

extension Point: Hashable {}
extension Point: Codable {}
