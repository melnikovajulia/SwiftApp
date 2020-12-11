import Foundation
import ArgumentParser

var flag = false
let path = "Sources/SwiftApp/words.json"
var words: [String: [String: String]]

guard let jsonFile = FileManager.default.contents(atPath: path)
else{
    exit(0)
}

words = (try? JSONDecoder().decode([String: [String: String]].self, from:jsonFile)) ?? [:]

func findWithKeyL(l:String){
    for (word1,word2) in words{
        for (language,word3) in word2{
            if l == language{
                print("\(word1)=\(word3)")
                flag = true
            }
        }
    }
}
func findWithKeyK(k:String) {
    for (word1,word2) in words{
        if k == word1{
            for (language,word3) in word2{
                print("\(language):\(word3)")
                flag = true
            }
        }
    }
}

func findWithKeyKAndL(k:String,l:String){
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

func findAll(){
    for (word1,word2) in words{
        print("\(word1)")
            for (language,word3) in word2{
            print("\(language):\(word3)") 
            flag = true
        }
    }
} 

struct AppLocalization: ParsableCommand {
    @Option(name: .shortAndLong, help: "The word selected for translation")
    var key: String?
    
    @Option(name: .shortAndLong, help: "Language selected for translation")
    var language: String?

    func run() throws {

        if  language == nil, let key:String = key {
            findWithKeyK(k:key)
        }
        else if  key == nil, let language:String = language{
            findWithKeyL(l:language)
        } 
        else if  let key:String = key, let language:String = language{
            findWithKeyKAndL(k:key,l:language)
        } 
        else if key == nil, language == nil{
            findAll()
        }
        if flag == false  {
            print("Not found")
        }

    }
}
AppLocalization.main()
