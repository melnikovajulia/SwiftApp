import Foundation

protocol ArgumentParserProtocol {
    func parse(_ arguments: [String]?) -> Arguments?
}