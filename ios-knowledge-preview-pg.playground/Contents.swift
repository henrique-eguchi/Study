import UIKit

// MARK: - Classes & Structs

/// Class is `reference type` - you send a reference when it gets passed around
/// Analogy - It is like changing a shared Google Sheet with others.
/// Usage: When you do got behavior: logic, use cases...
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
/// Usage: Aim to create structs for pure data, immutable, and no-behavior, SwiftUI views
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


// MARK: - Actors
// Usage: Use actors when you need to ensure a component is thread-safe and you’re happy with the extra async/await complexity.
