@testable import AoCUtils
import XCTest

final class PointTests: XCTestCase {
    func testInit() {
        let point = Point()
        XCTAssertEqual(point, Point(x: 0, y: 0))
    }

    func testTranslated() {
        let point = Point(x: 2, y: 2)
        XCTAssertEqual(point.translated(.up, by: 1), Point(x: 2, y: 3))
        XCTAssertEqual(point.translated(.right, by: 1), Point(x: 3, y: 2))
        XCTAssertEqual(point.translated(.down, by: 1), Point(x: 2, y: 1))
        XCTAssertEqual(point.translated(.left, by: 1), Point(x: 1, y: 2))
    }

    func testTranslate() {
        var pt = Point()
        // The order of the tests matters because we are mutating pt
        pt.translate(.up, by: 1)
        XCTAssertEqual(pt, Point(x: 0, y: 1))

        pt.translate(.right, by: 1)
        XCTAssertEqual(pt, Point(x: 1, y: 1))

        pt.translate(.down, by: 1)
        XCTAssertEqual(pt, Point(x: 1, y: 0))

        pt.translate(.left, by: 1)
        XCTAssertEqual(pt, Point(x: 0, y: 0))
    }
}

final class PointDirectionTests: XCTestCase {
    func testTurnedLeft() {
        let directions: [Point.Direction] = [ .up, .right, .down, .left]
        let turned = directions.map { $0.turned(.left) }
        XCTAssertEqual(turned, [.left, .up, .right, .down])
    }

    func testTurnedRight() {
        let directions: [Point.Direction] = [ .up, .right, .down, .left]
        let turned = directions.map { $0.turned(.right) }
        XCTAssertEqual(turned, [.right, .down, .left, .up])
    }

    func testTurnLeft() {
        var a = Point.Direction.up
        var b = Point.Direction.right
        var c = Point.Direction.down
        var d = Point.Direction.left

        a.turn(.left)
        b.turn(.left)
        c.turn(.left)
        d.turn(.left)

        XCTAssertEqual(a, .left)
        XCTAssertEqual(b, .up)
        XCTAssertEqual(c, .right)
        XCTAssertEqual(d, .down)
    }

    func testTurnright() {
        var a = Point.Direction.up
        var b = Point.Direction.right
        var c = Point.Direction.down
        var d = Point.Direction.left

        a.turn(.right)
        b.turn(.right)
        c.turn(.right)
        d.turn(.right)

        XCTAssertEqual(a, .right)
        XCTAssertEqual(b, .down)
        XCTAssertEqual(c, .left)
        XCTAssertEqual(d, .up)
    }
}
