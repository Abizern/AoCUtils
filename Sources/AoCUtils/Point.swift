import Foundation
import AppKit

public struct Point {
    public var x: Int
    public var y: Int

    public init(x: Int = 0, y: Int = 0) {
        self.x = x
        self.y = y
    }
}

extension Point {
    public enum Direction {
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



extension Point: Hashable {}

extension Point: Codable {}
