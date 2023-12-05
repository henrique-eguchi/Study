import UIKit

// MARK: - Classes & Structs

/// Class is `reference type` - you send a reference when it gets passed around
/// Analogy - It is like changing a shared Google Sheet with others.
/// Usage: When you do got behavior: logic, use cases, need inheritance...
final class Car {
    var year: Int
    var make: String
    var color: String

    init(year: Int, make: String, color: String) {
        self.year = year
        self.make = make
        self.color = color
    }
}

// Tests

var myCar = Car(year: 2022, make: "Porsche", color: "Red")
var stolenCar = myCar
// Change reference's property
stolenCar.color = "Yellow"
print(myCar.color) // Print out "Yellow" even if you are referencing `myCar` object.

print("-------------")

/// Struct is `value type` - you copy the object when it gets passed around
/// Analogy - It is like creating a copy of a sheet by downloading it and change it locally.
/// Structs has member-wise initialization which means there's no need for having constructor since you got one for free.
/// Usage: Aim to create structs for pure data, immutable, and no-behavior, SwiftUI views - Structs are lightweight & performant
struct SecondCar {
    var year: Int
    var make: String
    var color: String
}

// Tests

var mySecondCar = SecondCar(year: 2022, make: "McLaren", color: "Orange")
var secondStolenCar = mySecondCar
// Change copied's property
secondStolenCar.color = "Black"
print(mySecondCar.color) // Still "Orange"
print(secondStolenCar.color) // Copied car is "Black"

print("-------------")


// MARK: - Actors

/// Actor is a `reference type` with concurrency support, ensuring thread safety.
/// Analogy - It is like having a dedicated person (actor) managing a shared Google Sheet to prevent conflicts.
/// Usage: When you need a threa-safe component and are comfortable/happy with extra async/await complexity for concurrent programming.

actor SafeCar {
    private var year: Int
    private var make: String
    private var color: String

    init(year: Int, make: String, color: String) {
        self.year = year
        self.make = make
        self.color = color
    }

    // Actor-isolated method to safely access and modify properties
    func updateColor(to newColor: String) {
        color = newColor
    }

    // Actor-isolated method to safely retrieve the color
    func getColor() -> String {
        return color
    }
}

// Tests

// Creating an instance of the SafeCar actor
let mySafeCar = SafeCar(year: 2022, make: "Tesla", color: "Blue")

// Async call to update color, ensuring thread safety
Task {
    await mySafeCar.updateColor(to: "Green")
    print(await mySafeCar.getColor()) // Prints "Green"
}

// Accessing properties directly will result in a compile-time error due to actor isolation
// Uncommenting the line below will result in a compilation error:
//print(mySafeCar.getColor())



// MARK: - Generics


// MARK: - Filter, Map, Reduce


// MARK: - Data Structures: Array & Set


// MARK: - Unwrapping Optionals


// MARK: - Concurrency & Threading


// MARK: - Generics


// MARK: - Network calls


// MARK: - Singleton


// MARK: - Dependency Injection


// MARK: - Delegates & Protocols


// MARK: - View lifecycle (UIKit)



