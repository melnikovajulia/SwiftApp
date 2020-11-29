@testable import SwiftApp

class MockSearch: SearchProtocol {
	var searchParameters: (String?, String?, [String: [String: String]]?)!
    var searchResult: AppResults = .successfullSearch
    var searchCallsCount = 0
    func search(newKey: String?, newLanguage: String?, words: [String: [String: String]]?) -> (result: TestResult, outputString: String) {
        searchCallsCount += 1
        searchParameters = (key, language, dictionary)
        return (result: TestResult, outputString: String)
    }
}
   
