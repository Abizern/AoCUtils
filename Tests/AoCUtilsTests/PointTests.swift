import XCTest
@testable import AoCUtils

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
