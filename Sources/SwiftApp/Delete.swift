import Foundation

class Delete: DeleteProtocol {
    let writing: WritingDataProtocol
    let getData: GetDataProtocol

    var words: [String: [String: String]]

    init (getData: GetDataProtocol, writing: WritingDataProtocol) { 
        self.getData = getData
        self.words = getData.GetData()
        self.writing = writing
    }

    func delete(newKey: String?, newLanguage: String?) {
        if let key: String = newKey {
            if let language: String = newLanguage {
            deleteWithKeyAndLang(newKey: key, newLanguage: language)
            }
            else {
                deleteWithKey(newKey: key)
            }
        }
        else {
            if let language: String = newLanguage{
                deleteWithLang(newLanguage: language)
            }
        writing.writingData(data: words)  
    }
}

    func deleteWithKeyAndLang(newKey: String, newLanguage: String) {
        guard var dictionary = words[newKey] else {
            exit(0)
        } 
        dictionary[newLanguage] = nil
        words[newKey] = dictionary
    }

    func deleteWithKey(newKey: String) {
        words[newKey] = nil
    }

    func deleteWithLang(newLanguage: String) {
        for (word, dictionary) in words {
            var dictionary = dictionary
            dictionary[newLanguage] = nil
            words[word] = dictionary
        }
    }   

    }   
