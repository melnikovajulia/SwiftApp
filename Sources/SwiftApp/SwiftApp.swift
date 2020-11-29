import Foundation
import ArgumentParser

class Container {
    var argumentParser: ArgumentParserProtocol {
        ArgumentParser()
    }
    var writing: WritingDataProtocol {
        WritingData()
    }
    var getData: GetDataProtocol {
        GetData()
    }
    var output: OutputProtocol {
        OutputData()
    }
    var search: SearchProtocol {
        Search(getData: getData, outputData: output)
    }
    var update: UpdateProtocol {
        Update(getData: getData, writing: writing)
    }
    var delete: DeleteProtocol {
        Delete(getData: getData, writing: writing)
    }
    var print: PrintDataProtocol {
        PrintData()
    }
}


    public func swiftApp()-> Int {

    let container = Container()
    var result = TestResult.notFoundArguments
    let argumentParser = container.argumentParser
    guard let argument = argumentParser.parse() else {
        exit(0)
    }

    switch argument {
        case .search(let key, let language):
          let outputString = container.search.search(newKey: key, newLanguage: language).outputString
          let result = container.search.search(newKey: key, newLanguage: language).result
          container.print.printData(data: outputString)
        case .update(let word, let key, let language):
            result = container.update.update(word: word, key: key, language: language)
        case .delete(let key, let language):
            result = container.delete.delete(newKey: key, newLanguage: language)
        case .help(message: let message):
            container.print.printData(data: message)  
            result = TestResult.failedConvertArguments
        
    }

    switch result {
        case .failedSearch:
            return 1
        case .failedDeleted:
            return 2
        case .failedConvertArguments:
            return 3
        case .notFoundArguments:
            return 4
        case .uncorrectKeyK:
            return 5
        case .uncorrectLanguage:
            return 6
        case .argumentsIsInvalid:
            return 7
        default:
            return 0 
    }
}



