import Foundation

class Update: UpdateProtocol {

    let writing: WritingDataProtocol
    let getData: GetDataProtocol
    var words: [String: [String: String]]

    init (getData: GetDataProtocol, writing: WritingDataProtocol) { 
        self.getData = getData
        self.words = getData.GetData()
        self.writing = writing
    }

    func update(word: String, key: String, language: String) {
        var dictionary = words[key] ?? [:]
        if dictionary.isEmpty {
            words[key] = [language : word]
        }
        else {
            dictionary[language] = word
            words[key] = dictionary
        }
        writing.writingData(data: words)
    }
}