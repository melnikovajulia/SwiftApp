@testable import SwiftApp

class MockWritingData : WritingDataProtocol {
    var writeDataParam: ([String: [String: String]])!
    var writeCallsCount = 0

    func writingData(data: [String: [String: String]]) {
       writeCallsCount += 1
       writeDataParam = (data)
    }
}