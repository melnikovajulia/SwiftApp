import Foundation
var flag = false
var arrayAgr:Array<String> 
arrayAgr = CommandLine.arguments
var k = ""
var l = ""

var words: [String:[String:String]] = ["hello":["ru":"Привет","en":"Hello","es":"Hola"],"day":["ru":"День","en":"Day","pt":"Dia"]]

if CommandLine.arguments.count == 5 {
    FindWithKeyKAndL(k:FindKey(key:"-k"),l:FindKey(key:"-l"))

}

if CommandLine.arguments.count == 3 {
    guard CommandLine.arguments[1] == "-k" || CommandLine.arguments[1] == "-l" 
    else {
       exit(0)
    }
    if CommandLine.arguments[1] == "-k"{
        FindWithKeyK(k:FindKey(key:"-k"))

    }
    if CommandLine.arguments[1] == "-l"{
        FindWithKeyL(l:FindKey(key:"-l"))

    }

}

if CommandLine.arguments.count == 1 {
    FindAll()
}
if flag == false{
    print("Not found")
}

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
    for (_,word2) in words{
        for (language,word3) in word2{
            if l == language{
                print("\(language)=\(word3)")
            }
        }
    }
flag = true
}
func FindWithKeyK(k:String) {
    for (word1,word2) in words{
        if k == word1{
            for (language,word3) in word2{
                print("\(language):\(word3)")
            }
        }
    }
flag = true
}

func FindWithKeyKAndL(k:String,l:String){
    for (word1,word2) in words{
        if k == word1{
            for (language,word3) in word2{
                if l==language{
                    print("\(word3)")

                }
            }
        }
    }
flag = true
}

func FindAll(){
    for (word1,word2) in words{
        print("\(word1)")
            for (language,word3) in word2{
            print("\(language):\(word3)") 
        }
    }
flag = true
} 

