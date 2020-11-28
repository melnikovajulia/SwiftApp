import Foundation
import ArgumentParser
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


func main() {

    let container = Container()
    let argumentParser = container.argumentParser

    guard let argument = argumentParser.parse() else {
        return
    }

    switch argument {
        case .search(let key, let language):
          let outputString = container.search.search(newKey: key, newLanguage: language)
          container.print.printData(data: outputString)
        
        case .update(let word, let key, let language):
          container.update.update(word: word, key: key, language: language)
        
        case .delete(let key, let language):
          container.delete.delete(newKey: key, newLanguage: language)

        case .help(message: let message):
        container.print.printData(data: message)     
        
    }
}
main()

