import UIKit

//var str = "Hello, playground"
//
//func lengthOf(strings: [String]) -> [Int] {
//    var result: [Int] = []
//
//    for string in strings {
//        result.append(string.count)
//    }
//
//    return result
//}
//
//func lengthOf(string: [String]) -> [Int] {
//    return string.map { $0.count }
//}
//
//let i: Int? = 10
//let j = i.map { $0 * 2 }
////print(j)
//
//func fetchUsername(id: Int) -> String? {
//    if id == 1989 {
//        return "Taylor Swift"
//    } else {
//        return nil
//    }
//}
//
//
//var username: String? = fetchUsername(id: 1989)
//let formattedUsername = username.map { "Welcome, \($0)!" } ?? "Unknown user"
//print(formattedUsername)

let label = UILabel()
let label2 = UILabel()
let button = UIButton()
let button2 = UIButton()

let subviews: [UIView] = [label, label2, button, button2]

let view = UIView()
subviews.forEach { view.addSubview($0) }

let labels = view.subviews.compactMap { $0 as? UILabel }



let numbers = [[1, 2], [3, 4], [5, 6]]

let result = numbers.flatMap { $0.map { $0 + 1 } }

print(result)

// Optional FlatMap

let stringNumber: String? = "5"
let intNumber = stringNumber.map { Int($0) }
