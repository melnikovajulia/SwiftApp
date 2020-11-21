import Foundation

class WritingData: WritingDataProtocol {
    func writingData(data: [String: [String: String]]) {

        let encoderData = try? JSONEncoder().encode(data)
        
        guard let url = Bundle.module.url(forResource: "words", withExtension: "json")
        else {
            print("File not found")
            exit(0)
        }
         try? encoderData?.write(to: url)
    }
}
