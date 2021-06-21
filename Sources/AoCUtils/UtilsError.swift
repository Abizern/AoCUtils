import Foundation

public enum UtilsError: Error {
    case notImplemented
    case fileNotFound(String)
    case intConversion(String)
}

extension UtilsError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notImplemented:
            return NSLocalizedString("Not implemented yet", comment: "")
        case .fileNotFound(let string):
            return NSLocalizedString("File \(string) cannot be found", comment: "")
        case .intConversion(let string):
            return NSLocalizedString("\(string) cannot be converted to Int", comment: "")
        }
    }
}
