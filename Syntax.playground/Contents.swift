import UIKit

var place = "kitchen"

switch place {
case "pool":
    print("I'm chilling in the pool")
case "kitchen":
    print("I'm cooking diner")
case "living room":
    print("I'm watching TV")
default:
    print("Where am I?")
}


let place2 = "pool"
let action = "swimming"

switch (place2, action) {
case ("pool", "swimming"):
    print("It's so refreshing")
default:
    "What are you doing?"
}

let authentication = (name: "kitchen", password: "couteau")

switch authentication {
case ("kitchen", "couteau"):
    print("Welcome! kitchen")
default:
    print("Please try again.")
}

let authentication2 = (name: "kitchen", password: "couteau", ipAddress: "127.0.0.1")

switch authentication2 {
case ("kitchen", "couteau", _):
    print("Welcome!")
default:
    print("Please try again")
}


// If the first matches the res is not executed
switch authentication2 {
case (_, _, _):
    print("Hello anyone")
case ("kitchen", "couteau", _):
    print("Welcome!")
default:
    print("I doubt this will be printed.")
}

switch authentication2 {
case ("kitchen", let password, _):
    print("Welcome! Please consider changing your pw \(password) is sharp but weak")
default:
    print("Please try again")
}

let kitchen = (name: "kitchen", password: "couteau")
let livingroom = (name: "livingroom", password: "canape")
let gargden = (name: "garden", password: "grass")

let users = [kitchen, livingroom, gargden]

for case let (username, password) in users {
    print("name: \(username) pass: \(password)")
}


let name2: String? = "kitchen"
let password2: String? = "couteau"

switch (name2, password2) {
case let (.some(name), .some(password)):
    print("Hello, \(name) with pass: \(password)")
case let (.some(name), .none):
    print("Hey \(name)Please enter a password")
    
default:
    print("Who are you?")
}

switch (name2, password2) {
case let (name?, password?):
    print("Hello, \(name) with pass: \(password)")
case let (name?, nil):
    print("Hey \(name)Please enter a password")
    
default:
    print("Who are you?")
}

class Singer {
    let name: String
    lazy var expensiveComputation: Int = {
       return 17
    }()
    
    init(name: String) {
        self.name = name
    }
    

}

func fibonacci(of num: Int) -> Int {
    if num < 2 {
        return num
    } else {
        return fibonacci(of: num - 1) + fibonacci(of: num - 2)
    }
}
