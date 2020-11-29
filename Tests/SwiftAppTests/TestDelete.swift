@testable import App
import XCTest

final class TestDelete: XCTestCase {

    var delete: Delete!
    var getData: MockGetData!
    var write: MockWriterData!
    var search: MockSearch!
    var output: MockOutput!

    override func setUp() {
        super.setUp()
        getData = MockGetData()
        write = MockWritingData()
        search = MockSearch()
        output = MockOutput()
        delete = Delete(getData: getData, write: write)
    }
    override func tearDown() {
        delete = nil
        getData = nil
        write = nil
        super.tearDown()
    }
    
    func testDeleteWithKeyK() throws {
        let key = "house"
        getData.getDataResult = ["house":["en":"House"]]

        XCTAssertEqual(try delete.delete(newKey: key, newLanguage: nil), TestResult.successfullDeleted)
        XCTAssertEqual(getData.getDataCallsCount, 1)
        XCTAssertEqual(write.writeCallsCount, 1)
        XCTAssertEqual(write.writeDataParam, [:])
        XCTAssertEqual(output.outputCallsCount, 1)
    }

    func testDeleteWithL() throws {
        getData.getDataResult = ["night":["en":"Night","ita":"Notte"]]
        XCTAssertEqual(try delete.delete(newKey: nil, newLanguage: "ita"), TestResult.successfullDeleted)
        XCTAssertEqual(getData.getDataCallsCount, 1)
        XCTAssertEqual(write.writeCallsCount, 1)
        XCTAssertEqual(write.writeDataParam, ["night":["en":"Night"]])
        
    }
    func testDeleteWithAllKeys() throws {
        getData.getDataResult = ["hello":["ru":"Привет","en":"Hello"],"house":["ru":"Дом","tur":"Domo"]]
        
        XCTAssertEqual(try delete.delete(newKey: "house", newLanguage: "ru"), TestResult.deleteSuccess)
        XCTAssertEqual(write.writingDataCallsCount, 1)
        XCTAssertEqual(write.writingDataParameters, ["hello":["ru":"Привет","en":"Hello"],"house":["tur":"Domo"]])
         XCTAssertEqual(getData.getDataCallsCount, 1)  
    }

    func testDeleteNoArguments() throws {
        let result = delete.delete(key: nil, language: nil)
        XCTAssertEqual(try delete.delete(newKey: nil, newLanguage: nil), TestResult..notFoundArguments.errorDescription)
        XCTAssertEqual(writer.writingDataCallsCount, 0)
    }

    static var allTests = [
        ("testDeleteWithAllKeys", testDeleteWithAllKeys),
        ("testDeleteWithKeyK", testDeleteWithKey),
        ("testDeleteWithL", testDeleteWithLanguage),
        ("testDeleteNoArguments", testDeleteNoArguments)
    ]
}