import XCTest
@testable import App

final class SearchTests: XCTestCase {

    var getData: MockGetData!
    var search: Search!
    var output: MockOutput!

    override func setUp() {
        getData = GetDataMock()
        output = OutputMock()
        search = Search(getData: getData, output: output)
    }

    func testSearchWithKeyKAndLanguage() throws {
        let key = "cat"
        let language = "en"
        getData.getDataResult = ["cat": ["en":"Cat"]]
        XCTAssertEqual(try search.search(newKey: key, newLanguage: language), TestResult.successfullSearch)
        XCTAssertEqual(reading.getDataCallsCount, 1)
        XCTAssertEqual(output.outputCallsCount, 1)
        XCTAssertEqual(output.outputParam, "Cat")
    }

    func testSearchWithKeyK() throws {
        let key = "house"
        getData.getDataResult = ["house": ["ru":"Дом"]]
        XCTAssertEqual(try search.search(newKey: key, newLanguage: nil), TestResult.successfullSearch)
        XCTAssertEqual(getData.getDataCallsCount, 1)
        XCTAssertEqual(output.outputCallsCount, 1)
        XCTAssertEqual(output.outputParam, "house")
        XCTAssertEqual(output.outputCallsCount, 1)
        XCTAssertEqual(output.outputParam, ["ru":"Дом"])

    }

    func testSearchWithLanguage() throws {
        let language = "es"
        getData.getDataResult = ["hello": ["es":"Hola"]]
        XCTAssertEqual(try search.search(newKey: nil, newLanguage: language), TestResult.successfullSearch)
        XCTAssertEqual(getData.getDataCallsCount, 1)
        XCTAssertEqual(output.outputCallsCount, 1)  
    }

    func testSearchWithoutArguments() throws {
        reading.getDataResult = ["day": ["ru":"День"]]
        XCTAssertEqual(try search.search(newKey: nil, newLanguage: nil), TestResult.successfullSearch)
        XCTAssertEqual(getData.getDataCallsCount, 1)
        XCTAssertEqual(output.outputCallsCount, 1) 
        XCTAssertEqual(output.outputParameters, ["day": ["ru":"День"]]) 
    }

    func testSearchWithUncorrectKeyKAndLanguage() throws {
        let key = "horse"
        let language = "mol"
        getData.getDataResult = ["cat": ["en":"Cat"]]
        let results = 
        XCTAssertEqual(try search.search(newKey: key, newLanguage: language), TestResult.argumentsIsInvalid)
        XCTAssertEqual(getData.getDataCallsCount, 1)
        XCTAssertEqual(output.outputCallsCount, 1)
        XCTAssertEqual(output.outputParameters, TestResult.argumentsIsInvalid.errorDescription)
    }

    func testSearchWithUncorrectKeyK() throws {
        let key = "helo"
        reading.getDataResult = ["hello": ["en":"Hello","ru": "Привет","es": "Hola"]]
        let results = search.search(newKey: key, newLanguage: nil)
        XCTAssertEqual(try search.search(newKey: key, newLanguage: nil), TestResult.uncorrectKeyK)
        XCTAssertEqual(getData.getDataCallsCount, 1)
        XCTAssertEqual(output.outputCallsCount, 1)
        XCTAssertEqual(output.outputParameters, TestResult.uncorrectKeyK.errorDescription)
        XCTAssertEqual(output.outputCallsCount, 0)
    }

    func testSearchWithUncorrectLanguage() throws {
        let language = "tur"
        reading.getDataResult = ["night":["en":"Night","ru": "Ночь","ita":"Notte"]]
        let results = search.search(newKey: nil, newLanguage: language)
        XCTAssertEqual(try search.search(newKey: nil, newLanguage: language), TestResult.uncorrectLanguage)
        XCTAssertEqual(getData.getDataCallsCount, 1)
        XCTAssertEqual(output.outputCallsCount, 1)
        XCTAssertEqual(output.outputParameters, TestResult.uncorrectLanguage.errorDescription)
        XCTAssertEqual(output.outputCallsCount, 0)  
    }

    static var allTests = [
        ("testSearchWithKeyKAndLanguage", testSearchWithKeyAndLanguage),
        ("testSearchWithKeyK", testSearchWithKey),
        ("testSearchWithLanguage", testSearchWithLanguage),
        ("testSearchWithoutArguments", testSearchWithoutArguments),
        ("testSearchWithUncorrectKeyKAndLanguage", testSearchWithUncorrectKeyAndLanguage),
        ("testSearchWithUncorrectKeyK", testSearchWithUncorrectKey),
        ("testSearchWithUncorrectLanguage", testSearchWithUncorrectLanguage),
    ]
}