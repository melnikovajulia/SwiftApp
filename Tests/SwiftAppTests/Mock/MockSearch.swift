@testable import SwiftApp

class MockSearch: SearchProtocol {
	var searchParameters: (String?, String?)!
    var searchResult: TestResult = .successfullSearch
    var searchCallsCount = 0
    func search(newKey: String?, newLanguage: String?) -> (result: TestResult, outputString: String) {
        searchCallsCount += 1
        searchParameters = (newKey, newLanguage)
        return (result: searchResult, outputString: String)
    }
    
}
   



  
