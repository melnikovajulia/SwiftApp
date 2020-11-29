class OutputData: OutputProtocol {
    var outputString = "" 

    internal func outputLangAndVal(words: [String:String]) -> String {
        for (language, value) in words {
            if outputString == "" {
                outputString = "\(language):\(value)"
            }
            else {
                outputString += "\n\(language):\(value)"
            }     
        }
        return outputString
    }
    
    internal func outputKeyAndVal(words: [String:String]) -> String {
        for (key, value) in words {
            if outputString == "" {
                outputString = "\(key) = \(value)"
            }
            else {
                outputString += "\n\(key) = \(value)"
            }
        }
        return outputString
    }

    internal func outputAllWords (words: [String: [String: String]]) -> String {
        for (word, langAndVal) in words {
            if outputString == "" {
                outputString = word
            }
            else {
                outputString += "\n\(word)"
            }
            for (language, value) in langAndVal {
                    outputString += "\n\(language):\(value)"
                }
        }
        return outputString
    }
}