import Foundation

public protocol Problem {
    init() throws
    func title() throws -> String
    func part1() throws -> String
    func part2() throws -> String
}

extension Problem {
    func outputPart1() -> String {
        let t: String
        let r: String

        do {
            t = try title()
        } catch {
            t = error.localizedDescription
        }

        do {
            r = try part1()
        } catch {
            r = error.localizedDescription
        }

        return """
            \(t)
            Part 1: \(r)

            """
    }

    func outputPart2() -> String {
        let t: String
        let r: String

        do {
            t = try title()
        } catch {
            t = error.localizedDescription
        }

        do {
            r = try part2()
        } catch {
            r = error.localizedDescription
        }

        return """
            \(t)
            Part 2: \(r)

            """
    }

    func outputAll() -> String {
        let t: String
        let r1: String
        let r2: String

        do {
            t = try title()
        } catch {
            t = error.localizedDescription
        }

        do {
            r1 = try part1()
        } catch {
            r1 = error.localizedDescription
        }

        do {
            r2 = try part2()
        } catch {
            r2 = error.localizedDescription
        }

        return """
            \(t)
            Part 1: \(r1)
            Part 2: \(r2)

            """
    }
}
