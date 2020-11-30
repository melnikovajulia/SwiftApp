protocol OutputProtocol {

    func outputLangAndVal(words: [String:String]) -> String 
    func outputKeyAndVal(words: [String:String]) -> String 
    func outputAllWords (words: [String: [String: String]]) -> String 
}