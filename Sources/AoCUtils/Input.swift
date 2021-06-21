import Foundation

/// Convenience functions for reading inputs. Error handling involves outputting the description as output.
public enum Input {
    /// A single `String` from the input
    public static func string(from url: URL) throws -> String {
        try String(contentsOf: url)
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// An array of `String` from the input split on newlines
    public static func lines(from url: URL) throws -> [String] {
        try string(from: url)
            .components(separatedBy: .newlines)
    }

    /// An array of `String` from the input split on blank lines
    public static func newlines(from url: URL) throws -> [String] {
        try string(from: url).components(separatedBy: "\n\n")
    }

    /// A single `Int` from the input
    public static func int(from url: URL) throws -> Int {
        let string = try string(from: url)
        guard let value = Int(string)
        else {
            throw UtilsError.intConversion(string)
        }

        return value
    }

    /// An array of `Int` from the input, split on newlines and converted to `Int`
    public static func ints(from url: URL) throws -> [Int] {
        try lines(from: url).compactMap(Int.init)
    }

    /// A `Set<Int>` from the input split on newlines and converted to `Int`
    public static func set(from url: URL) throws -> Set<Int> {
       try Set(ints(from: url))
    }
}
