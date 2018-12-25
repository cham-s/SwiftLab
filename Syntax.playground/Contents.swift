import UIKit

//var place = "kitchen"
//
//switch place {
//case "pool":
//    print("I'm chilling in the pool")
//case "kitchen":
//    print("I'm cooking diner")
//case "living room":
//    print("I'm watching TV")
//default:
//    print("Where am I?")
//}
//
//
//let place2 = "pool"
//let action = "swimming"
//
//switch (place2, action) {
//case ("pool", "swimming"):
//    print("It's so refreshing")
//default:
//    "What are you doing?"
//}
//
//let authentication = (name: "kitchen", password: "couteau")
//
//switch authentication {
//case ("kitchen", "couteau"):
//    print("Welcome! kitchen")
//default:
//    print("Please try again.")
//}
//
//let authentication2 = (name: "kitchen", password: "couteau", ipAddress: "127.0.0.1")
//
//switch authentication2 {
//case ("kitchen", "couteau", _):
//    print("Welcome!")
//default:
//    print("Please try again")
//}
//
//
//// If the first matches the res is not executed
//switch authentication2 {
//case (_, _, _):
//    print("Hello anyone")
//case ("kitchen", "couteau", _):
//    print("Welcome!")
//default:
//    print("I doubt this will be printed.")
//}
//
//switch authentication2 {
//case ("kitchen", let password, _):
//    print("Welcome! Please consider changing your pw \(password) is sharp but weak")
//default:
//    print("Please try again")
//}
//
//let kitchen = (name: "kitchen", password: "couteau")
//let livingroom = (name: "livingroom", password: "canape")
//let gargden = (name: "garden", password: "grass")
//
//let users = [kitchen, livingroom, gargden]
//
//for case let (username, password) in users {
//    print("name: \(username) pass: \(password)")
//}
//
//
//let name2: String? = "kitchen"
//let password2: String? = "couteau"
//
//switch (name2, password2) {
//case let (.some(name), .some(password)):
//    print("Hello, \(name) with pass: \(password)")
//case let (.some(name), .none):
//    print("Hey \(name)Please enter a password")
//
//default:
//    print("Who are you?")
//}
//
//switch (name2, password2) {
//case let (name?, password?):
//    print("Hello, \(name) with pass: \(password)")
//case let (name?, nil):
//    print("Hey \(name)Please enter a password")
//
//default:
//    print("Who are you?")
//}
//
//class Singer {
//    let name: String
//    lazy var expensiveComputation: Int = {
//       return 17
//    }()
//
//    init(name: String) {
//        self.name = name
//    }
//
//
//}
//

//func fibonacci(of num: Int) -> Int {
//    if num < 2 {
//        return num
//    } else {
//        return fibonacci(of: num - 1) + fibonacci(of: num - 2)
//    }
//}
//
//
////let fibonacciSequence = (0...20).map(fibonacci)
////print(fibonacciSequence[10])
//
//let lazyFibonacciSequence = Array(0...1999).lazy.map(fibonacci)
////print(lazyFibonacciSequence[19])

// Nested functions, classes and structs

//enum London {
//    static let coordinates = (lat: 51.507222, long: -0.1275)
//
//    enum SubwayLines {
//        case bakerloo, central, circle, district, elizabeth,
//        hammersmithCity, jubilee, metropolitan, northern, piccadilly,
//        victoria, waterlooCity
//    }
//
//    enum Places {
//        case buckinghamPalace, cityHall, oldBailey, piccadilly,
//        stPaulsCathedral
//    }
//}
//
//enum R {
//    enum Storyboards: String {
//        case main, detail, upgrade, share, help
//    }
//
//    enum Images: String {
//        case welcome, home, about, button
//    }
//}
//
//struct Cat {
//    enum Breed {
//        case britishShortHair, burmese, persian, ragdoll,
//        russianBlue, scottishFold, siamese
//    }
//
//    var name: String
//    var breed: Breed
//}
//
//struct Deck {
//    struct Card {
//        enum Suit {
//            case hearts, diamonds, clubs, spades
//        }
//
//        var rank: Int
//        private var suit: Suit
//    }
//
//    var cards = [Card]()
//}
//

struct Point {
    let x: Double
    let y: Double
}

enum DistanceTechnique {
    case euclidean
    case euclideanSquared
    case manhattan
}

func createDistanceAlgorithm(technique: DistanceTechnique) -> (Point, Point) -> Double {
    func calculateEuclideanDistanceSquared(start: Point, end: Point) -> Double {
        let deltaX = start.x - end.x
        let deltaY = start.y - end.y
        
        return deltaX * deltaX + deltaY * deltaY
    }
    
    func calculateEuclideanDistance(start: Point, end: Point) -> Double {
        return sqrt(calculateEuclideanDistanceSquared(start: start, end: end))
    }
    
    func calculateManhattanDistance(start: Point, end: Point) -> Double {
        return abs(start.x - end.x) + abs(start.y - end.y)
    }
    
    switch technique {
    case .euclidean:
        return calculateEuclideanDistance
    case .euclideanSquared:
        return calculateEuclideanDistanceSquared
    case .manhattan:
        return calculateManhattanDistance
    }
}

let distanceAlgorithm = createDistanceAlgorithm(technique: .euclidean)
let distance =  distanceAlgorithm(Point(x: 10, y: 10), Point(x: 100, y: 100))



