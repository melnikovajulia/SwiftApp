import Foundation

class GetData: GetDataProtocol {
    func GetData() -> [String: [String: String]] {
        var words: [String: [String: String]]

        guard let path = Bundle.module.path(forResource: "data", ofType: "json")
        else {
            print("Путь не найден")
            exit(0)
        }
        guard let jsonFile = FileManager.default.contents(atPath: path) else {
            print("Указанный файл не найден")
            exit(0)
        }
        words = (try? JSONDecoder().decode([String: [String: String]].self, from:jsonFile)) ?? [:]
        
        return words
    }
}