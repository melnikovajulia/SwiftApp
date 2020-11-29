@testable import SwiftApp

class MockDelete: DeleteProtocol {

	var deleteParam: (String?, String?)!
    var deleteResult: ResultTest = .successfullDeleted
    var deleteCallsCount = 0
    func delete(newKey: String?, newLanguage: String?) -> ResultTest {
        deleteCallsCount += 1
        deleteParam = (key, language)
        return deleteResult
    }
}