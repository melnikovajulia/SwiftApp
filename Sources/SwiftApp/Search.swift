class Search: SearchProtocol {

    var outputString = ""
    var words: [String: [String: String]]

    let getData: GetDataProtocol
    let outputData: OutputProtocol
    

    init (getData: GetDataProtocol, outputData: OutputProtocol) {
        self.getData = getData
        self.words = getData.GetData()
        self.outputData = outputData
    } 
    
    func search(newKey: String?, newLanguage: String?) -> (result: TestResult, outputString: String) {
        if let key: String = newKey {
            if let language: String = newLanguage { 
                outputString = findWithKeyAndLanguage(key: key, language: language)
                return (.successfullSearch,outputString)
            }
            else {
                let dictionary = findWithKey(key: key)
                outputString = outputData.outputLangAndVal(words: dictionary)
                return (.successfullSearch,outputString)
            }
        }
        else {
            if let language: String = newLanguage{
                let dictionary = findWithLanguage(language: language)
                outputString = outputData.outputKeyAndVal(words: dictionary)
                return (.successfullSearch,outputString)
            }
             else{
                let dictionary = findAll()
                outputString = outputData.outputAllWords(words: dictionary)
                return (.successfullSearch,outputString)
            }
        }
        if outputString == "" {
            return (.failedSearch,"")
        }
         return (.successfullSearch,outputString)
    }

    private func findWithKeyAndLanguage(key: String, language: String) -> String {
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

    private func findWithKey(key: String) -> [String:String] {
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

    private func findAll() -> [String: [String: String]] {
        return words
    }
}