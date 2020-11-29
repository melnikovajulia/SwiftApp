import Foundation
import SwiftApp

do {
    let result = swiftApp()
    switch result {
    case 0:
      exit(Int32(result))
    case 1:
      print("Неправильная команда")
    case 2:
      print("Не удалось выполнить команду")
    case 3:
      print("Ошибка в количестве аргументов")
    default:
      print("Неизвестная ошибка")
    }    
} 



