import Foundation
import SwiftApp


do {
    let result = swiftApp()
    switch result {
    case 0:
      exit(Int32(result))
    case 1:
      print("Сommand is entered incorrectlyа")
    case 2:
      print("Failed to complete command")
    case 3:
      print("Invalid number of arguments")
    default:
      print("Unknown error")
    }    
} 



