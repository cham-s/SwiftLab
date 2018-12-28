import UIKit

//var str = "Hello, playground"
//
//let printGreeting = { print("Hello!") }
//printGreeting()
//
//let copyingGreeting = printGreeting
//copyingGreeting()
//
//func createIncrementer() -> () -> Void {
//    var counter = 0
//
//    return {
//        counter += 1
//        print(counter)
//    }
//}
//
//let incrementer = createIncrementer()
//incrementer()
//incrementer()
//
//let incrementorCopy = incrementer
//incrementorCopy()
//incrementer()

struct Person {
    var name: String
    var age: Int
    var favoriteIceCream: String
}

let person = Person(name: "Jhon", age: 46, favoriteIceCream: "Vanilla")

final class PersonBox {
    var person: Person
    
    init(person: Person) {
        self.person = person
    }
}

let box = PersonBox(person: person)

final class TestContainer {
    var box: PersonBox!
}

let container1 = TestContainer()
let container2 = TestContainer()

container1.box = box
container2.box = box

print(container1.box.person.name)
print(container2.box.person.name)

box.person.name = "Not Jane"

print(container1.box.person.name)
print(container2.box.person.name)

final class Box<T> {
    var value: T
    
    init(value: T) {
        self.value = value
    }
}

final class TestContainer2 {
    var box: Box<Person>!
}

struct PersonStruct {
    var name: String
    var age: Int
}

var taylor = PersonStruct(name: "Taylor Swift", age: 26)
taylor.name = "Justin Bieber"

final class PersonClass {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let taylor2 = PersonClass(name: "Taylor Swift", age: 26)
taylor2.name = "Justin Bieber"
