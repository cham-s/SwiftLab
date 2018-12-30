import UIKit



enum PasswordError: Error {
    case empty
    case short
    case obvious(message: String)
}

func encrypt(_ str: String, with password: String) throws -> String {
    let encrypted = password + str + password
    return String(encrypted.reversed())
}



do {
    let encrypted = try encrypt("Secret!", with: "Jh0n")
    print(encrypted)
} catch {
    print("Encryption failed")
}

do {
    let encrypted = try encrypt("Secret!", with: "Jh0n")
    print(encrypted)
} catch PasswordError.empty {
    print("You must Provide a password")
}
enum PasswordError: Error {
    case empty
    case short
    case obvious
}

func functionA() {
    functionB()
}

func functionB() {
    do {
        functionC()
    } catch {
        print("Error!")
    }
}

func functionC() throws {
    throw PasswordError.short
}


