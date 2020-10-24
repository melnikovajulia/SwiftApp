import Foundation
import ArgumentParser

var flag = false
var arrayAgr:Array<String> 
arrayAgr = CommandLine.arguments
let path = "words.json"
var words: [String: [String: String]]

guard let jsonFile = FileManager.default.contents(atPath: path)
else{
    exit(0)
}

words = (try? JSONDecoder().decode([String: [String: String]].self, from:jsonFile)) ?? [:]



func FindKey(key:String) -> String{
    var clue = ""
    for i in 0..<arrayAgr.count{
        if arrayAgr[i] == key{
            clue = arrayAgr[i+1]
        }
    }
   
    return clue

}

func FindWithKeyL(l:String){
    for (word1,word2) in words{
        for (language,word3) in word2{
            if l == language{
                print("\(word1)=\(word3)")
                flag = true
            }
        }
    }
}
func FindWithKeyK(k:String) {
    for (word1,word2) in words{
        if k == word1{
            for (language,word3) in word2{
                print("\(language):\(word3)")
                flag = true
            }
        }
    }
}

func FindWithKeyKAndL(k:String,l:String){
    for (word1,word2) in words{
        if k == word1{
            for (language,word3) in word2{
                if l==language{
                    print("\(word3)")
                    flag = true
                }
            }
        }
    }
}

func FindAll(){
    for (word1,word2) in words{
        print("\(word1)")
            for (language,word3) in word2{
            print("\(language):\(word3)") 
            flag = true
        }
    }
} 

struct Translator: ParsableCommand {
   
    
    @Option(name: .shortAndLong, help: "The word selected for translation")
    var key: String?
    
    @Option(name: .shortAndLong, help: "Language selected for translation")
    var language: String?

    func run() throws {

        if  language == nil, let key:String = key {
            FindWithKeyK(k:key)
        }
        else if  key == nil, let language:String = language{
            FindWithKeyL(l:language)
        } 
        else if  let key:String = key, let language:String = language{
            FindWithKeyKAndL(k:key,l:language)
        } 
        else if key == nil, language == nil{
            FindAll()
        }
        if flag == false  {
            print("Not found")
        }

    }
}

Translator.main()
