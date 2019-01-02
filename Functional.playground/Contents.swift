import UIKit

var str = "Hello, playground"

func lengthOf(strings: [String]) -> [Int] {
    var result: [Int] = []
    
    for string in strings {
        result.append(string.count)
    }
    
    return result
}

func lengthOf(string: [String]) -> [Int] {
    return string.map { $0.count }
}

let i: Int? = 10
let j = i.map { $0 * 2 }
//print(j)

func fetchUsername(id: Int) -> String? {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return nil
    }
}


var username: String? = fetchUsername(id: 1989)
let formattedUsername = username.map { "Welcome, \($0)!" } ?? "Unknown user"
print(formattedUsername)
