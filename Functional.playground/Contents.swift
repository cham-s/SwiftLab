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

//let label = UILabel()
//let label2 = UILabel()
//let button = UIButton()
//let button2 = UIButton()
//
//let subviews: [UIView] = [label, label2, button, button2]
//
//let view = UIView()
//subviews.forEach { view.addSubview($0) }
//
//let labels = view.subviews.compactMap { $0 as? UILabel }
//
//let numbers = [[1, 2], [3, 4], [5, 6]]
//
//let result = numbers.flatMap { $0.map { $0 + 1 } }
//
//print(result)
//
//// Optional FlatMap
//
//let stringNumber: String? = "5"
//let intNumber = stringNumber.map { Int($0) }
//let flatMapNumber = stringNumber.flatMap { Int($0) }
//
//
//
//let ns = [1, 3, 4, 5]
//let max = ns.max { $0 < $1 }
//print(max ?? "none")

//let london = (name: "London", continent: "Europe", population:
//    8_539_000)
//let paris = (name: "Paris", continent: "Europe", population:
//    2_244_000)
//let lisbon = (name: "Lisbon", continent: "Europe", population:
//    530_000)
//let rome = (name: "Rome", continent: "Europe", population:
//    2_627_000)
//let tokyo = (name: "Tokyo", continent: "Asia", population:
//    13_350_000)
//let cities = [london, paris, lisbon, rome, tokyo]
//
//let totalPopulation = cities.reduce(0) { $0 + $1.population }
//let europePopulation = cities.filter { $0.continent == "Europe" }.reduce(0) {
//    $0 + $1.population
//}
//
//let biggestCities = cities.filter { $0.population > 2_000_000 }.sorted {
//    $0.population > $1.population
//    }.prefix(upTo: 3).map {
//        "\($0.name) is a big city, with a population of \($0.population)"
//}.joined(separator: "\n")
//
//print(biggestCities)
//
//precedencegroup CompositionPrecedence {
//    associativity: left
//}
//
//infix operator >>>: CompositionPrecedence
//
//func >>> <T, U, V>(lhs: @escaping (T) -> U, rhs: @escaping (U) -> V)
//    -> (T) -> V {
//        return { rhs(lhs($0)) }
//}
//
//
//// <T, U, V>(lhs: (T) -> U, rhs (U) -> V) -> (T) -> V
//// <T, U, V>(lhs: (T) -> U, rhs: ((T) -> U) -> V) -> (T) -> ((T) -> U) -> V
//
//func generateRand(max: Int) -> Int {
//    let number = Int.random(in: 0...max)
//    print("Using number: \(number)")
//    return number
//}
//
//func calculateFactors(number: Int) -> [Int] {
//    return (1...number).filter { number % $0 == 0 }
//}
//
//func reduceToString(numbers: [Int]) -> String {
//    return numbers.reduce("Factors: ") { $0 + String($1) + " " }
//}
//
//let result = reduceToString(numbers: calculateFactors(number: generateRand(max: 100)))
//print(result)
//
//
//let combined = generateRand >>> calculateFactors >>> reduceToString
//print(combined(100))

//let numbers = Array(1...10000)
//let lazyFilter = numbers.lazy.filter { $0 % 2 == 0 }
//let lazyMap = numbers.lazy.map { $0 * 2 }
//
//print(lazyFilter.count)
//print(lazyFilter.count)
//print(lazyMap[5000])
//print(lazyMap[5000])


let myNumber = 5

let myMonad = [myNumber]

let doubleNumbers = { (value: Int) in return [value * 2] }

let result1 = myMonad.flatMap(doubleNumbers)
let result2 = doubleNumbers(myNumber)

result1 == result2

let value = 5

let array = [5]

let wrapInarray = { (value: Int) in return [value] }
let flatMapped = array.flatMap(wrapInarray)
array == flatMapped

let anotherNumber = 5
let anotherArray = [myNumber]
let multiplyBy5 = { [$0 * 5] }
let multiplyBy10 = { [$0 * 10] }

let chained = anotherArray.flatMap(multiplyBy5).flatMap(multiplyBy10)
let nested = anotherArray.flatMap { multiplyBy10($0).flatMap(multiplyBy10) }

chained == nested
