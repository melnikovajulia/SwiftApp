import Foundation

class WritingData: WritingDataProtocol {
    func writingData(data: [String: [String: String]]) {

        let encoderData = try? JSONEncoder().encode(data)
        
        guard let url = Bundle.module.url(forResource: "data", withExtension: "json")
        else {
            print("Файл не найден")
            exit(0)
        }
         try? encoderData?.write(to: url)
    }
}
