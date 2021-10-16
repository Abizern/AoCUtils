import Foundation

public struct DirectedPoint {
    public var position: Point
    public var direction: Point.Direction

    public init(position: Point = Point(x: 0, y: 0), direction: Point.Direction = .up) {
        self.position = position
        self.direction = direction
    }

    public func turnedAndMoved(amount: Int, turn: Point.Direction.Turn) -> DirectedPoint {
        var dp = self
        dp.turnAndMove(amount: amount, turn: turn)

        return dp
    }

    public func movedAndTurned(amount: Int, turn: Point.Direction.Turn) -> DirectedPoint {
        var dp = self
        dp.moveAndTurn(amount: amount, turn: turn)

        return dp
    }

    public mutating func turnAndMove(amount: Int, turn: Point.Direction.Turn) {
        self.direction.turn(turn)
        self.position.translate(self.direction, by: amount)
    }

    public mutating func moveAndTurn(amount: Int, turn: Point.Direction.Turn) {
        self.position.translate(self.direction, by: amount)
        self.direction.turn(turn)
    }
}

extension DirectedPoint: Equatable {}
extension DirectedPoint: Hashable {}
