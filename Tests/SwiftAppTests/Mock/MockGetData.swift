import Foundation
@testable import SwiftApp

class MockGetData: GetDataProtocol {
    var getDataParameters: ()!
    var getDataResult: [String: [String: String]] = [:]
    var getDataCallsCount = 0
    
    func GetData() -> [String: [String: String]] {
       getDataCallsCount += 1
       getDataParameters = ()
       return getDataResult
    }
}