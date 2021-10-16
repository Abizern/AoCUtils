import Foundation

public protocol Problem {
    init() throws
    func title() throws -> String
    func part1() throws -> String
    func part2() throws -> String
}

extension Problem {
    init() throws {
        throw UtilsError.notImplemented
    }

    func title() throws -> String {
        throw UtilsError.notImplemented
    }

    func part1() throws -> String {
        throw UtilsError.notImplemented
    }

    func part2() throws -> String {
        throw UtilsError.notImplemented
    }
}

extension Problem {
    func outputPart1() -> String {
        let title: String
        let result: String

        do {
            title = try self.title()
        } catch {
            title = error.localizedDescription
        }

        do {
            result = try part1()
        } catch {
            result = error.localizedDescription
        }

        return """
            \(title)
            Part 1: \(result)

            """
    }

    func outputPart2() -> String {
        let title: String
        let result: String

        do {
            title = try self.title()
        } catch {
            title = error.localizedDescription
        }

        do {
            result = try part2()
        } catch {
            result = error.localizedDescription
        }

        return """
            \(title)
            Part 2: \(result)

            """
    }

    func outputAll() -> String {
        let title: String
        let result1: String
        let result2: String

        do {
            title = try self.title()
        } catch {
            title = error.localizedDescription
        }

        do {
            result1 = try part1()
        } catch {
            result1 = error.localizedDescription
        }

        do {
            result2 = try part2()
        } catch {
            result2 = error.localizedDescription
        }

        return """
            \(title)
            Part 1: \(result1)
            Part 2: \(result2)

            """
    }
}
