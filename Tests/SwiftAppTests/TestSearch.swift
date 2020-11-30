import XCTest
@testable import SwiftApp

final class TestSearch: XCTestCase {

    var getData: MockGetData!
    var search: Search!
    var output: MockOutput!

    override func setUp() {
        getData = MockGetData()
        output = MockOutput()
        search = Search(getData: getData, outputData: output)
    }

    func testSearchWithKeyKAndLanguage() throws {
        let key = "cat"
        let language = "en"
        getData.getDataResult = ["cat": ["en":"Cat"]]
        let result = search.search(newKey: "cat", newLanguage: "en")
        XCTAssertEqual(result.result, TestResult.successfullSearch)
        XCTAssertEqual(getData.getDataCallsCount, 1)
    }

    func testSearchWithKeyK() throws {
        let key = "house"
        getData.getDataResult = ["house": ["ru":"Дом"]]
        output.outputLangAndValResult = "ru:Дом"
        let result = search.search(newKey:key, newLanguage:nil)
        XCTAssertEqual(result.result, TestResult.successfullSearch)
        XCTAssertEqual(getData.getDataCallsCount, 1)
        XCTAssertEqual(output.outputLangAndValCallsCount, 1)
        XCTAssertEqual(output.outputLangAndValParam, ["ru":"Дом"])
    }

    func testSearchWithLanguage() throws {
        let language = "es"
        getData.getDataResult = ["hello": ["es":"Hola"]]
        let result = search.search(newKey: nil, newLanguage: language)
        XCTAssertEqual(result.result, TestResult.successfullSearch)
        XCTAssertEqual(getData.getDataCallsCount, 1)
        XCTAssertEqual(output.outputKeyAndValCallsCount, 1)  
    }

    func testSearchWithoutArguments() throws {
        getData.getDataResult = ["day": ["ru":"День"]]
        let result = search.search(newKey: nil, newLanguage: nil)
        XCTAssertEqual(result.result, TestResult.successfullSearch)
        XCTAssertEqual(getData.getDataCallsCount, 1)
        XCTAssertEqual(output.outputAllWordsCallsCount, 1) 
        XCTAssertEqual(output.outputAllWordsParam , ["day": ["ru":"День"]]) 
    }

    static var allTests = [
        ("testSearchWithKeyKAndLanguage", testSearchWithKeyKAndLanguage),
        ("testSearchWithKeyK", testSearchWithKeyK),
        ("testSearchWithLanguage", testSearchWithLanguage),
        ("testSearchWithoutArguments", testSearchWithoutArguments),
    ]
}