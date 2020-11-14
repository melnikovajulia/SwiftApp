class Search: SearchProtocol {

    var outputString = ""
    var words: [String: [String: String]]

    let getData: GetDataProtocol
    let outputData: OutputProtocol
    

    init (getData: GetDataProtocol, outputData: OutputProtocol) {
        self.getData = getData
        self.words = getData.getData()
        self.outputData = outputData
    } 
    
    func search(key: String?, language: String?) -> String {
        if let key: String = key && let language: String = language {
                outputString = findWithKeyAndLanguage(key: key, language: language)
            }
        else if let key: String = key && let language: String != language {
                let dictionary = findWithKey(key: key)
                outputString = outputData.outputLangAndVal(dictionary: dictionary)
            }
        else if let language: String = language && let key: String != key{
                let dictionary = findWithLanguage(language: newLanguage)
                outputString = outputData.outputKeyAndVal(dictionary: dictionary)
            }
        else if let language: String != language && let key: String != key{
                let dictionary = findAll()
                outputString = outputData.outputAllWords(dictionary: dictionary)
            }
        if outputString == "" {
            return "Not found"
        }
        return outputString
    }
    func findWithKeyAndLanguage(key: String, language: String) -> String {
         for (word, dictionary) in words {
            if key == word {
                for (languageCurrent, value) in dictionary {
                    if language == languageCurrent {

                        return value
                    }
                }
            }
        }
         
       return ""
    }

    func findWithKey(key: String) -> [String:String] {
        guard let dictionary = words[key] else {
            return [:]
        }
        return dictionary
    }

    func findWithLanguage(language: String) -> [String:String] {
        var dictionaryWordAndValue: [String: String]  = [:]
        for (word, dictionary) in words {
            for (languageCurrent, value) in dictionary {
                if language == languageCurrent {
                    dictionaryWordAndValue[word] = value
                }
            }
        }
        return dictionaryWordAndValue
    } 

    func findAll() -> [String: [String: String]] {
        return words
    }
}