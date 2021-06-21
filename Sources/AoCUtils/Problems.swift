import Foundation
import CoreText

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

    public func solve(_ definition: Problem.Type, part: Part = .all) -> String {
        let problem = definition.init()
        switch part {
        case .one:
            return problem.outputPart1()
        case .two:
            return problem.outputPart2()
        case .all:
            return problem.outputAll()
        }
    }

    public func solveAll() -> String {
        problems
            .map { solve($0) }
            .reduce(into: "", +=)
    }
}
