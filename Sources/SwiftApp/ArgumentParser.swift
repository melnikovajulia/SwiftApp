import Foundation
import ArgumentParser

class ArgumentParser : ArgumentParserProtocol{
    func parse() -> Arguments? {
        do{
            let command = try Commands.parseAsRoot()
            
            switch command {
            case let command as Commands.Search:
                return .search(key: command.key, language: command.language)
            case let command as Commands.Update:
                return .update(word: command.word, key: command.key, language: command.language)
            case let command as Commands.Delete:
                return .delete(key: command.key, language: command.language)                
            default:
                return .help(message: Commands.helpMessage())
                
            }
        }
        catch {
            return .help(message: Commands.helpMessage())   
        }
    }
}

struct Commands: ParsableCommand {
    static var configuration = CommandConfiguration (
        subcommands: [Search.self, Update.self, Delete.self]
    )
}
extension Commands {
    struct Search: ParsableCommand {
        @Option(name: .shortAndLong, help: "The word selected for translation")
        var key: String?

        @Option(name: .shortAndLong, help: "Language selected for translation")
        var language: String?
    }
    struct Update: ParsableCommand {
        @Argument(help: "The word you want to add or update in the dictionary")
        var word: String

        @Option(name: .shortAndLong, help: "The word selected for translation")
        var key: String

        @Option(name: .shortAndLong, help: "Language selected for translation")
        var language: String
    }
    struct Delete: ParsableCommand {
        @Option(name: .shortAndLong, help: "The word selected for translation")
        var key: String?

        @Option(name: .shortAndLong, help: "Language selected for translation")
        var language: String?
    }  
}