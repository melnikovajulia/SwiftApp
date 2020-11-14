import Foundation

class Delete: DeleteProtocol {
    let writing: WritingDataProtocol
    let getData: GetDataProtocol
    let key: String
    let language: String

    var words: [String: [String: String]]

    init (getData: GetDataProtocol, writing: WritingDataProtocol) { 
        self.getData = getData
        self.words = getData.GetData()
        self.writing = writing
    }

    func delete(newKey: String?, newLanguage: String?) {
        if key == newKey && language == newLanguage{
            deleteWithKeyAndLang(newKey: key, newLanguage: language)
        }
        else if key == newKey && language == newLanguage{
            deleteWithKey(newKey: key)
        }
        else if key != newKey && language == newLanguage{
            deleteWithLang(newLanguage: language)
        }
        
        writing.writingData(data: words)  
    }

    func deleteWithKeyAndLang(newKey: String, newLanguage: String) {
        guard var dictionary = words[newKey] else {
            exit(0)
        } 
        dictionary[newLanguage] = nil
        words[newKey] = dictionary
    }

    func deleteWithKey(newKey: String) {
        words[key] = nil
    }

    func deleteWithLang(newLanguage: String) {
        for (word, dictionary) in words {
            var dictionary = dictionary
            dictionary[language] = nil
            words[word] = dictionary
        }
    }   

    
}