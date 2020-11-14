import Foundation

class Update: UpdateProtocol {

    let writing: WritingDataProtocol
    let gettingData: GetDataProtocol
    var words: [String: [String: String]]

    init (gettingData: GetDataProtocol, writing: WritingDataProtocol) { 
        self.gettingData = gettingData
        self.words = gettingData.getData()
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