@testable import App
import XCTest

class TestArgumentParser: XCTestCase {
    private var argumentParser: ArgumentParser!

    override func setUp() {
        super.setUp()
        argumentParser = ArgumentParser()
    }

    override func tearDown() {
        argumentParser = nil
        super.tearDown()
    }
    
    func testSearchWithKey() throws {
        let result = argumentParser.toParse(["search", "-k", "cat"])
        switch result {
            case .search(let key, let language):
              XCTAssertEqual(key, "cat")
              XCTAssertEqual(language, nil)
            default:
              XCTFail(TestResult.failedConvertArguments.errorDescription)
        }
    }

    func testSearchWithLanguage() throws {
        let result = argumentParser.toParse(["search", "-l", "en"])
        switch result {
            case .search(let key, let language):
              XCTAssertEqual(key, nil)
              XCTAssertEqual(language, "en")
            default:
              XCTFail(TestResult.failedConvertArguments.errorDescription)
        }
    }

    func testSearchWithKeyAndLanguage() throws {
        let result = argumentParser.toParse(["search", "-k", "cat", "-l", "en"])
        switch result {
            case .search(let key, let language):
              XCTAssertEqual(key, "cat")
              XCTAssertEqual(language, "en")
            default:
              XCTFail(TestResult.failedConvertArguments.errorDescription)
        }
    }

    func testSearchNotKeyNotLanguage() throws {
        let result = argumentParser.toParse(["search"])
        switch result {
            case .search(let key, let language):
              XCTAssertEqual(key, nil)
              XCTAssertEqual(language, nil)
            default:
              XCTFail(TestResult.failedConvertArguments.errorDescription)
        }
    }

    func testDeleteWithKeyAndLanguage() throws {
        let result = argumentParser.toParse(["delete", "-k", "hello", "-l", "es"])
        switch result {
            case .delete(let key, let language):
              XCTAssertEqual(key, "hello")
              XCTAssertEqual(language, "es")
            default:
              XCTFail(TestResult.failedConvertArguments.errorDescription)
        }
    }

    func testDeleteWithKey() throws {
        let result = argumentParser.toParse(["delete", "-k", "hello"])
        switch result {
            case .delete(let key, let language):
              XCTAssertEqual(key, "hello")
              XCTAssertEqual(language, nil)
            default:
              XCTFail(TestResult.failedConvertArguments.errorDescription)
        }
    }

    func testDeleteWithLanguage() throws {
        let result = argumentParser.toParse(["delete", "-l", "pt"])
        switch result {
            case .delete(let key, let language):
              XCTAssertEqual(key, nil)
              XCTAssertEqual(language, "pt")
            default:
              XCTFail(TestResult.failedConvertArguments.errorDescription)
        }
    }

    func testUpdate() throws {
        let result = argumentParser.toParse(["update", "Dog", "-k", "dog", "-l", "en"])
        switch result {
            case .update(let word, let key, let language):
              XCTAssertEqual(word, "Dog")
              XCTAssertEqual(key, "dog")
              XCTAssertEqual(language, "en")
            default:
              XCTFail(TestResult.failedConvertArguments.errorDescription)
        }
    }

    func testNotCorrectCommand() throws {
        if argumentParser.toParse(["go"]) != nil {
        XCTFail(TestResult.failedConvertArguments.errorDescription)
      }
    }

    func testNotCommand() throws {
      if argumentParser.toParse([""]) != nil {
        XCTFail(TestResult.failedConvertArguments.errorDescription)
      }
    }

    func testUpdateNotWord() throws {
      if argumentParser.toParse(["update -k house -l tur"]) != nil {
        XCTFail(TestResult.failedConvertArguments.errorDescription)
      }
    }

    static var allTests = [
        ("testSearchWithKey", testSearchWithKey),
        ("testSearchWithLanguage", testSearchWithLanguage),
        ("testSearchWithKeyAndLanguage", testSearchWithKeyAndLanguage),
        ("testSearchNotKeyNotLanguage", testSearchNotKeyNotLanguage),
        ("testDeleteWithKeyAndLanguage", testDeleteWithKeyAndLanguage),
        ("testDeleteWithKey", testDeleteWithKey),
        ("testDeleteWithLanguage", testDeleteWithLanguage),
        ("testUpdate", testUpdate),
        ("testNotCorrectCommand", testNotCorrectCommand),
        ("testNotCommand", testNotCommand),
        ("testUpdateNotWord", testUpdateNotWord)
    ]
}
