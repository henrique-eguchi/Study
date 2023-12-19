import UIKit

// MARK: - Classes & Structs

/// Class is `reference type` - you send a reference when it gets passed around
/// Class has inheritance
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
/// Struct does not have inheritance
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

print("-------------")


// MARK: - Conceptual Questions

// Classes

/// Question: What is the key difference between a class and a struct in Swift?

/// Question: What is inheritance, and how does it work in classes?

// Structs

/// Question: Why are structs considered lightweight, and what is member-wise initialization?

/// Question: When is it appropriate to use a struct over a class?

// Actors

/// Question: What is an actor in Swift, and why would you use it?

/// Question: How does actor isolation work, and why is it important for concurrency?

// MARK: - Answers

// Classes

/// Answer: The key difference is that classes are reference types, meaning when they are assigned
/// to a new constant or variable or passed as a function parameter, they are passed by reference.
/// Structs, on the other hand, are value types and are passed by value.

/// Answer: Inheritance is a mechanism in which a class can inherit properties and methods from
/// another class. The class that is being inherited from is called the superclass, and the class
/// that inherits is called the subclass. Subclasses can override or extend the functionality of the
/// superclass.

// Structs

/// Answer: Structs are considered lightweight because they are value types and are stored directly
/// where they are defined, eliminating the need for reference counting. Member-wise initialization
/// is a feature of structs where you get a default initializer that takes parameters for all the
/// properties of the struct. This initializer is automatically generated by the compiler.

/// Answer: Structs are appropriate when you are dealing with simple data structures or when you
/// want value semantics. They are especially useful for representing immutable data, and they are
/// commonly used in Swift for things like representing points, sizes, and colors.

// Actors

/// Answer: An actor is a type that provides isolation for mutable state to ensure that only one
/// task can access that state at a time. Actors are used when you need to ensure thread safety in
/// a concurrent environment. They support asynchronous programming using `async` and `await` to
/// manage concurrent tasks.

/// Answer: Actor isolation ensures that only one task (thread) can access the mutable state of an
/// actor at a time. All methods and properties of an actor are inherently isolated, meaning they
/// are protected from concurrent access. This is important for concurrency to prevent race
/// conditions and data inconsistencies that can arise when multiple tasks modify shared state
/// simultaneously.


