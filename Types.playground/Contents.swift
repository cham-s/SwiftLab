import UIKit
import Foundation

//let str = String(28, radix: 16, uppercase: true)
//
//
//let int = Int("1C", radix: 16)
//
//var dictionary = Dictionary<String, String>(minimumCapacity: 10)
//
//enum Color: String {
//    case unknown
//    case blue
//    case green
//    case pink
//    case purple
//    case red
//
//    var description: String {
//        switch self {
//        case .unknown:
//            return  "the color of magic"
//        default:
//            return "You know the rest"
//        }
//    }
//}
//
//struct Toy {
//    let name: String
//    let color: Color
//}
//
//let barbie = Toy(name: "Barbie", color: .pink)
//let receCar = Toy(name: "Lighting McQueen", color: .red)
//
//
//
//enum Planet: Int {
//    case mercury = 1
//    case venus
//    case earth
//    case mars
//    case unknown
//}
//
//let marsNumber = Planet.mars.rawValue
//
//let mars = Planet(rawValue: 556) ?? Planet.unknown
//
//let pink = Color.pink.rawValue
//
//let barbiew = Toy(name: "Barbie", color: .pink)
//let raceCar = Toy(name: "Lightning MacQueen", color: .red)
//
//print("The \(barbie.name) toy is \(barbie.color)")
//
//print("The \(barbie.name) toy is \(barbie.color.rawValue.uppercased())")

//struct Dog {
//    var breed: String
//    var age: Int
//}
//
//extension Dog: Comparable {
//    static func <(lhs: Dog, rhs: Dog) -> Bool {
//        return lhs.age < rhs.age
//    }
//    static func ==(lhs: Dog, rhs: Dog) -> Bool {
//        return lhs.age == rhs.age
//    }
//}
//
//let poppy = Dog(breed: "Poodle", age: 5)
//let rusty = Dog(breed: "Labrador", age: 2)
//let rover = Dog(breed: "Corgi", age: 11)
//var dogs = [poppy, rusty, rover]
//
//
//let start = CFAbsoluteTimeGetCurrent()
//
//var array = Array(1...1000000)
//array.reserveCapacity(1000000)
//array.reserveCapacity(1000000)
//
//let end = CFAbsoluteTimeGetCurrent() - start
//
//print("Took \(end) seconds")
//
//let array2 = Array<Int>(1...1000000)
//let array3 = ContiguousArray<Int>(1...1000000)
//
//var start1 = CFAbsoluteTimeGetCurrent()
//array2.reduce(0, +)
//var end1 = CFAbsoluteTimeGetCurrent() - start1
//print("Took \(end1) seconds")
//
//start1 = CFAbsoluteTimeGetCurrent()
//array3.reduce(0, +)
//end1 = CFAbsoluteTimeGetCurrent() - start1

//print("Took \(end1) seconds")

let cities = ["Shanghai": 24_256_800, "Karachi": 23_500_000,
              "Beijing": 21_516_000, "Seoul": 9_995_000]
let groupedCities = Dictionary(grouping: cities.keys) { $0.first! }
print(groupedCities)

let panamaPopulation = cities["Paname", default: 0]
