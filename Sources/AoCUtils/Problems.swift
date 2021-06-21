import Foundation

public struct Problems {
    public enum Part {
        case one
        case two
        case all
    }

    let problems: [Problem.Type]

    public init(_ problems: [Problem.Type]) {
        self.problems = problems
    }

    public func solve(_ day: Int, part: Part = .all) -> String {
        do {
            let problem = try problems[day-1].init()
            switch part {
            case .one:
                return problem.outputPart1()
            case .two:
                return problem.outputPart2()
            case .all:
                return problem.outputAll()
            }
        } catch {
            return error.localizedDescription
        }
    }

    public func solveAll() -> String {
        (0..<problems.count)
            .map { solve($0) }
            .reduce(into: "", +=)
    }

    public var count: Int {
        problems.count
    }
}
