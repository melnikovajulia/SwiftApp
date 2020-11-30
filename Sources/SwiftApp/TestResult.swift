import Foundation

public enum TestResult: Swift.Error, Equatable {
    case successfullDeleted 
    case failedDeleted
    case successfullSearch
    case failedSearch
    case notFoundArguments
    case failedConvertArguments
    case argumentsIsInvalid
    case uncorrectKeyK
    case uncorrectLanguage
    case successfullUpdate
    
    public var errorDescription: String {
        switch self {
        case .failedSearch:
            return "Couldn't find a value"
        case .failedDeleted:
            return "Couldn't delete a value"
        case .notFoundArguments:
            return "No arguments found"
        case .failedConvertArguments:
            return "Failed to convert arguments"
        case .argumentsIsInvalid:
            return "Arguments is invalid"
        case .uncorrectKeyK:
            return "Entering an invalid key -k"
        case .uncorrectLanguage:
            return "Entering an invalid language"
        default:
            return "Unknown Error"
        }
    }
    
    
   
}

