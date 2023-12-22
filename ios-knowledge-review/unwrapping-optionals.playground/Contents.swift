import UIKit

// MARK: - Unwrapping optionals

// Unwrapping is the process of safely extracting values from optional types in Swift.
// It helps avoid runtime crashes when dealing with values that might be nil.
// Various unwrapping techniques like `if let`, `guard let`, nil coalescing, force unwrap, and optional chaining provide flexibility in handling optionals based on different scenarios.

// Assume we have an optional variable
let optionalValue: Int? = 42

// 1. Using `if let`: Conditional binding to safely unwrap the optional value
if let unwrappedValue = optionalValue {
    print("Using if let: \(unwrappedValue)")
} else {
    print("Value is nil")
}

// 2. Using `guard let`: Safely unwrap the optional value with early exit if nil (we can avoid arrow patterns with this)
func processValueWithGuard() {
    guard let unwrappedValue = optionalValue else {
        print("Value is nil in guard")
        return
    }
    // Use unwrappedValue safely within the scope
    print("Using guard let: \(unwrappedValue)")
}
processValueWithGuard()

// 3. Using nil coalescing: Provide a default value if the optional is nil
let defaultValue = 0
let valueWithDefault = optionalValue ?? defaultValue
print("Using nil coalescing: \(valueWithDefault)")

// 4. Using force unwrap (use cautiously to avoid runtime crashes): Assumes the optional has a value
let forcedUnwrappedValue = optionalValue!
print("Using force unwrap: \(forcedUnwrappedValue)")

// 5. Optional chaining (useful for chaining multiple optional values): Safely access properties, methods, and subscripts
struct MyStruct {
    var property: String?
}

let myInstance: MyStruct? = MyStruct(property: "Hello")

let chainedValue = myInstance?.property?.count
print("Using optional chaining: \(chainedValue ?? 0)")

