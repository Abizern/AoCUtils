import Foundation

public func enumeratedMatcher(_ regex: NSRegularExpression) -> (String) -> [String] {
    { string in
        var result: [String] = .init()
        let range = NSRange(string.startIndex..<string.endIndex, in: string)

        regex.enumerateMatches(in: string, options: [], range: range) { match, _, _ in
            guard let match = match else { return }
            (1..<match.numberOfRanges).forEach { n in
                guard let subRange = Range(match.range(at: n), in: string)
                else { return }

                result.append(String(string[subRange]))
            }
        }

        return result
    }
}

public extension String {
    func capturedGroups(_ regex: NSRegularExpression) -> [String] {
        enumeratedMatcher(regex)(self)
    }
}
