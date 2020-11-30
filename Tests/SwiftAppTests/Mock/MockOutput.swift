@testable import SwiftApp
class MockOutput : OutputProtocol {
    var outputLangAndValParam: ([String:String])!
    var outputLangAndValCallsCount = 0
    var outputLangAndValResult = ""

    func outputLangAndVal(words: [String:String]) -> String {
        outputLangAndValCallsCount += 1
        outputLangAndValParam = (words)
        return outputLangAndValResult
    }
    
    var outputKeyAndValParam: ([String:String])!
    var outputKeyAndValResult = ""
    var outputKeyAndValCallsCount = 0

    func outputKeyAndVal(words: [String:String]) -> String {
        outputKeyAndValCallsCount += 1
        outputKeyAndValParam = (words)
        return outputKeyAndValResult
    }
    
    var outputAllWordsParam: ([String: [String: String]])!
    var outputAllWordsResult = ""
    var outputAllWordsCallsCount = 0
    
    func outputAllWords (words: [String: [String: String]]) -> String {
        outputAllWordsCallsCount += 1
        outputAllWordsParam = (words)
        return outputAllWordsResult
    }
}
