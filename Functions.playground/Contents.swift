import UIKit



//func myPrint(_ values: Any...,
//                separator: String = " ",
//                terminator: String = "\n") {
//    for value in values {
//        print(value, terminator: "")
//        print(separator, terminator: "")
//        print(terminator, terminator: "")
//    }
//
//}
//
//
////myPrint("Hello", " world", terminator: "!")
//
//
//func *(lhs: [Int], rhs: [Int]) -> [Int]? {
//    guard lhs.count == rhs.count else { return nil }
//    var result = [Int]()
//
//    for i in 0..<lhs.count {
//        result.append(lhs[i] * rhs[i])
//    }
//
//    return result
//}
//
//let result = [1, 2, 3] * [1, 2, 3]
////print(result!)
//
//
//
//
//
//precedencegroup ExponentiationPrecdedence {
//    higherThan: MultiplicationPrecedence
//    associativity: right
//}
//
//infix operator **: ExponentiationPrecdedence
//
//func **(lhs: Double, rhs: Double) -> Double {
//    return pow(lhs, rhs)
//}
//
//func ...(lhs: CountableClosedRange<Int>, rhs: Int) -> [Int] {
//    let downwards = (rhs..<lhs.upperBound).reversed()
//    return Array(lhs) + downwards
//}
//
//infix operator ...: RangeFormationPrecedence
//
//precedencegroup RangeFormationPrecedence {
//    associativity: left
//    higherThan: CastingPrecedence
//}
//
//let range = 1...10...1

// Closures


//func testEscape(_ closure: (String) -> Void) {
//    DispatchQueue.main.async {
//        closure("Hello")
//    }
//}

//func testEcaping(_ closure: (String) -> Void) {
//    closure("Hello")
//}

typealias Action = () -> Void

let labeledActions = ["cooking", "eating", "cleaning"]
var actions = [Action]()

for label in labeledActions {
    actions.append({ print("I am \(label)") })
}

func runAction(action: Action) {
    
}



