import Foundation

//func fetchData<T: Decodable>(for: T.Type) async throws -> T { }

// Generics eliminates code duplication by creating general solution that can handle various types.

struct Motor { }

protocol Drivable {
    var motor: Motor { get }
    var wheels: Int { get }

}

func driveHome<T: Drivable>(vehicle: T) { } // no matter what vehicle is
// Generic constraint (protocol conformance) on `<T: Drivable>`
// Convention to use a single letter variable, typically T, U, V
// T can be of any type as long as it conforms to Drivable

struct Porsche911GT3: Drivable {
    var motor: Motor
    var wheels: Int
    // ...
}

struct BMWS1000RR: Drivable {
    var motor: Motor
    var wheels: Int
    // ...
}

// Usage

let my911 = Porsche911GT3(motor: Motor(), wheels: 4)
let my1000RR = BMWS1000RR(motor: Motor(), wheels: 2)

driveHome(vehicle: my911)
driveHome(vehicle: my1000RR)

// It may easily bring unnecessary complexity the code


// This function will work as long as T conforms to Comparable
func determineHigherValue<T: Comparable>(valueOne: T, valueTwo: T) {
    let higherValue = valueOne > valueTwo ? valueOne : valueTwo
    print("\(higherValue) is the higher value")
}

determineHigherValue(valueOne: 1, valueTwo: 2)
determineHigherValue(valueOne: "Henrique", valueTwo: "Paulo")
determineHigherValue(valueOne: Date.now, valueTwo: Date.distantFuture)

// Generic are everywhere in Swift

var numbersArray = Array(repeating: 3, count: 10)
var stringArray = Array(repeating: "Sean", count: 5)
numbersArray.append(5) // it knows that newElement is a Int on its autocompletion
stringArray.append("Swift")



// Real life example

// It is very specific to the user
//func fetchUser(from url: URL) async throws -> User {
//    let (data, _) = try await URLSession.shared.data(from: url)
//
//    do {
//        return try decoder.decode(User.self, from: data)
//    } catch {
//        throw error
//    }
//}

// Can be turned into:

// for: T.Type in order for us to let know the network call know which type is going to be
//func fetchData<T: Decodable>(for: T.Type, from url: URL) async throws -> T {
//    let (data, _) = try await URLSession.shared.data(from: url)
//
//    do {
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        throw error
//    }
//}

// Call site example

//let user = try await NetworkManager.shared.fetchData(for: User.self, from: url)


// Most of the time we need future proof, that Future never comes (be careful of premature optimization) and we should avoid this
// Generic can add unnecessary complexity to our code - only use it when it is a 'slum dunk' use case - when the code repeats often. Concrete types are way easier to read and way easier to understand



// MARK: - Q&A

// Question: What is the purpose of generics in Swift, and how do they eliminate code duplication?
// Answer: Generics in Swift provide a way to create flexible and reusable functions and types that can work with any data type. They eliminate code duplication by allowing the creation of a general solution that can handle various types.

// Question: How is a generic function defined, and what role does the `<T: Decodable>` play in the function `fetchData`?
// Answer: A generic function is defined by using `<T>` to represent a placeholder for a type. In the function `fetchData`, `<T: Decodable>` is a generic constraint indicating that the type `T` must conform to the `Decodable` protocol.

// Question: What is a generic constraint, and why is it used in the function `driveHome`?
// Answer: A generic constraint restricts the types that can be used with a generic function or type. In the function `driveHome`, the constraint `<T: Drivable>` ensures that the type `T` must conform to the `Drivable` protocol.

// Question: Provide an example of using the generic function `determineHigherValue` with different types.
// Answer: The `determineHigherValue` function works with any type that conforms to the `Comparable` protocol. Examples include comparing integers, strings, and dates.

// Question: Where are generics commonly used in Swift, and provide examples?
// Answer: Generics are commonly used in Swift in various standard library functions and data structures. Examples include creating generic arrays using `Array(repeating:count:)`, where the type is inferred based on the provided value.

// Question: Illustrate how generics can simplify code using the real-life example of the `fetchUser` function and its generic counterpart `fetchData`.
// Answer: The `fetchUser` function is specific to the `User` type, while the generic `fetchData` function can work with any type that conforms to `Decodable`. This generic approach simplifies code and makes it more versatile.

// Question: What caution should be exercised when using generics, as mentioned in the provided content?
// Answer: Generics can add unnecessary complexity to code, and it is advised to use them when there is a clear and repetitive use case. Concrete types are often easier to read and understand, so generics should be used judiciously.
