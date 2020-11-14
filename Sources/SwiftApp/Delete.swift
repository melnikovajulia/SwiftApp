import Foundation

class Delete: DeleteProtocol {
    let writing: WriterDataProtocol
    let gettingData: GetDataProtocol

    var words: [String: [String: String]]

    init (gettingData: GetDataProtocol, writing: WritingDataProtocol) { 
        self.gettingData = gettingData
        self.words = gettingData.getData()
        self.writing = writing
    }

    func delete(key: String?, language: String?) {
        if let key: String = key && let language: String = language{
            delete(key: key, language: language)
        }
        else if let key: String = key && let language: String != language{
            delete(key: newKey)
        }
        else if let key: String != key && let language: String = language{
            delete(language: newLanguage)
        }
        
        writing.writingData(data: words)  
    }

    func delete(key: String, language: String) {
        guard var dictionary = words[key] else {
            exit(0)
        } 
        dictionary[language] = nil
        words[key] = dictionary
    }

    func delete(key: String) {
        words[key] = nil
    }

    func delete(language: String) {
        for (word, dictionary) in words {
            var dictionary = dictionary
            dictionary[language] = nil
            words[word] = dictionary
        }
    }   

    
}