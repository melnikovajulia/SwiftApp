@testable import SwiftApp

class MockDelete: DeleteProtocol {

	var deleteParam: (String?, String?)!
    var deleteResult: TestResult = .successfullDeleted
    var deleteCallsCount = 0
    func delete(newKey: String?, newLanguage: String?) -> TestResult {
        deleteCallsCount += 1
        deleteParam = (newKey, newLanguage)
        return deleteResult
    }
}