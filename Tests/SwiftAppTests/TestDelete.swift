@testable import SwiftApp
import XCTest

final class TestDelete: XCTestCase {

    var delete: Delete!
    var getData: MockGetData!
    var write: MockWritingData!
    var output: MockOutput!

    override func setUp() {
        super.setUp()
        getData = MockGetData()
        write = MockWritingData()
        output = MockOutput()
        delete = Delete(getData: getData, writing: write)
    }
    override func tearDown() {
        delete = nil
        getData = nil
        write = nil
        super.tearDown()
    }
    
    public func testDeleteWithKeyK() throws {
        let key = "house"
        getData.getDataResult = ["house":["en":"House"]]

        XCTAssertEqual(try delete.delete(newKey: key, newLanguage: nil), TestResult.successfullDeleted)
        XCTAssertEqual(getData.getDataCallsCount, 1)
        XCTAssertEqual(write.writeCallsCount, 1)
        XCTAssertEqual(write.writeDataParam, [:])
        XCTAssertEqual(output.outputKeyAndValCallsCount, 1)
    }

    public func testDeleteWithL() throws {
        getData.getDataResult = ["night":["en":"Night","ita":"Notte"]]
        XCTAssertEqual(try delete.delete(newKey: nil, newLanguage: "ita"), TestResult.successfullDeleted)
        XCTAssertEqual(getData.getDataCallsCount, 1)
        XCTAssertEqual(write.writeCallsCount, 1)
        XCTAssertEqual(write.writeDataParam, ["night":["en":"Night"]])
        
    }
    public func testDeleteWithAllKeys() throws {
        getData.getDataResult = ["hello":["ru":"Привет","en":"Hello"],"house":["ru":"Дом","tur":"Domo"]]
        
        XCTAssertEqual(try delete.delete(newKey: "house", newLanguage: "ru"), TestResult.successfullDeleted)
        XCTAssertEqual(write.writeCallsCount, 1)
        XCTAssertEqual(write.writeDataParam, ["hello":["ru":"Привет","en":"Hello"],"house":["tur":"Domo"]])
         XCTAssertEqual(getData.getDataCallsCount, 1)  
    }

    public func testDeleteNoArguments() throws {
        let result = delete.delete(newKey: nil, newLanguage: nil)
        XCTAssertEqual(try delete.delete(newKey: nil, newLanguage: nil), TestResult.notFoundArguments)
        XCTAssertEqual(write.writeCallsCount, 0)
    }

    static var allTests = [
        ("testDeleteWithAllKeys", testDeleteWithAllKeys),
        ("testDeleteWithKeyK", testDeleteWithKeyK),
        ("testDeleteWithL", testDeleteWithL),
        ("testDeleteNoArguments", testDeleteNoArguments)
    ]
}