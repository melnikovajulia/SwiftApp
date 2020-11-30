@testable import SwiftApp
import XCTest

class TestUpdate: XCTestCase {

    var update: Update!
    var getData: MockGetData!
    var write: MockWritingData!
    var output: MockOutput!
    
    override func setUp() {
        super.setUp()
        getData = MockGetData()
        write = MockWritingData()
        update = Update(getData: getData, writing: write)
    }

    override func tearDown() {
        output = nil
        update = nil
        getData = nil
        write = nil
        super.tearDown()
    }

    func testUpdateWithAllKey() throws {
        getData.getDataResult = ["hello":[ "en": "Hello","ru": "Привет","es": "Hola"]]
        XCTAssertEqual(try update.update(word: "Hej", key: "hello", language: "sv"), TestResult.successfullUpdate)
        XCTAssertEqual(getData.getDataCallsCount, 1)
        XCTAssertEqual(write.writeCallsCount, 1)
        XCTAssertEqual(write.writeDataParam, ["hello":[ "en": "Hello","ru": "Привет","es": "Hola","sv":"Hej"]])

    }
    
    static var allTests = [
        ("testUpdateWithAllKey", testUpdateWithAllKey)
    ]
}