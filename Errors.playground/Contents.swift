import UIKit



//func encrypt(_ str: String, with password: String) throws -> String {
//    let encrypted = password + str + password
//    return String(encrypted.reversed())
//}
//
//
//
//do {
//    let encrypted = try encrypt("Secret!", with: "Jh0n")
//    print(encrypted)
//} catch {
//    print("Encryption failed")
//}
//
//do {
//    let encrypted = try encrypt("Secret!", with: "Jh0n")
//    print(encrypted)
//} catch PasswordError.empty {
//    print("You must Provide a password")
//}

enum PasswordError: Error {
    case empty
    case short
    case obvious
}

func functionA() {
    do {
        try functionB()
    } catch {
        print("Error!")
    }
}

//func functionB() {
//    do {
//        try functionC()
//    } catch {
//        print("Error!")
//    }
//}

func functionB() throws {
    do {
        try functionC()
    } catch PasswordError.empty {
        print("Empty password!")
    }
}

func functionC() throws {
    throw PasswordError.short
}

func definitelyWontThrow() {
    print("Shiny!")
}

enum Failure: Error {
    case badNetwork(message: String)
    case broken
}

func fetchRemote() throws -> String {
    throw Failure.badNetwork(message: "Filrewall blocked port.")
}

func fetchLocal() -> String {
    return "Taylor"
}

func fetchUserData(unsing closure: () throws -> String) rethrows {
    let userData = try closure()
    print("User data received: \(userData)")
    
    do {
        try fetchUserData(unsing: fetchLocal)
    } catch Failure.badNetwork(message: let message) {
        print(message)
    } catch {
        print("Fetch error")
    }
}

fetchUserData(unsing: fetchRemote)

