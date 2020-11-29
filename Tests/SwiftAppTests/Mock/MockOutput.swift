@testable import SwiftApp
class MockOutputData : OutputDataProtocol {
    var outputParam: ([String:String])!
    var outputResult = ""
    var outputCallsCount = 0

    func outputLangAndVal(words: [String:String]) -> String {
        outputCallsCount += 1
        outputParam = (words)
        return outputResult
    }
    
    var outputParam: ([String:String])!
    var outputResult = ""
    var outputCallsCount = 0

    func outputKeyAndVal(words: [String:String]) -> String {
        outputCallsCount += 1
        outputParam = (words)
        return outputResult
    }
    
    var outputParam: ([String: [String: String]])!
    var outputResult = ""
    var outputCallsCount = 0
    
    func outputAllWords (words: [String: [String: String]]) -> String {
        outputCallsCount += 1
        outputParam = (words)
        return outputResult
    }
}
