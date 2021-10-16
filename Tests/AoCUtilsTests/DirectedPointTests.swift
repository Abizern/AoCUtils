import AoCUtils
import XCTest

final class DirectedPointTests: XCTestCase {
    func testDefaultInit() {
        let directedPoint = DirectedPoint()
        XCTAssertEqual(directedPoint.position, Point(x: 0, y: 0))
    }

    func testInitialiser() {
        let point = Point(x: 1, y: 2)
        let direction: Point.Direction = .left
        let directedPoint = DirectedPoint(position: point, direction: direction)

        XCTAssertEqual(directedPoint.position, point)
        XCTAssertEqual(directedPoint.direction, direction)
    }

    func testTurnedAndMoved() {
        let original = DirectedPoint(position: Point(), direction: .up)
        let translated = original.turnedAndMoved(amount: 2, turn: .left)

        XCTAssertEqual(translated.position, Point(x: -2, y: 0))
        XCTAssertEqual(translated.direction, .left)
    }

    func testMovedAndTurned() {
        let original = DirectedPoint(position: Point(), direction: .up)
        let translated = original.movedAndTurned(amount: 2, turn: .left)

        XCTAssertEqual(translated.position, Point(x: 0, y: 2))
        XCTAssertEqual(translated.direction, .left)
    }

    func testTurnAndMove() {
        var dp = DirectedPoint(position: Point(), direction: .up)
        dp.turnAndMove(amount: 2, turn: .left)

        XCTAssertEqual(dp.position, Point(x: -2, y: 0))
        XCTAssertEqual(dp.direction, .left)
    }

    func testMoveAndTurn() {
        var dp = DirectedPoint(position: Point(), direction: .up)
        dp.moveAndTurn(amount: 2, turn: .left)

        XCTAssertEqual(dp.position, Point(x: 0, y: 2))
        XCTAssertEqual(dp.direction, .left)
    }
}

