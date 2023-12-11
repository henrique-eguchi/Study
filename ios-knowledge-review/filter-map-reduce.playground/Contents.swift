import Foundation

// MARK: - Higher order functions - shorthand syntax for a basic for loop - it iterates over an array and spit out their results into a new variable

struct IndieApp {
    let name: String
    let monthlyPrice: Double
    let users: Int
}

let appPortfolio = [
    IndieApp(name: "Creator View", monthlyPrice: 11.99, users: 4356),
    IndieApp(name: "FitHero", monthlyPrice: 0.00, users: 1756),
    IndieApp(name: "Buckets", monthlyPrice: 3.99, users: 7598),
    IndieApp(name: "ConnectFour", monthlyPrice: 1.99, users: 34081)
]

// MARK: -  Filter - pass a conditional and filter the
let freeApps = appPortfolio.filter { $0.monthlyPrice == 0.00 }
print(freeApps)

// the same as
var freeAppsArr = [IndieApp]()
for app in appPortfolio where app.monthlyPrice == 0.00 {
    freeAppsArr.append(app)
}
print(freeAppsArr)

// MARK: -  Map - common use - pull out all of a specific property (example name)
let appNames = appPortfolio
    .map { $0.name }
    .sorted()
print(appNames)

let increasedPrices = appPortfolio
    .map { $0.monthlyPrice * 1.5 }
print(increasedPrices)

// MARK: -  Reduce - reduce all values into one - aggregation in other languages / sum up an array
let numbers = [3, 5, 9, 12, 18]
let sum = numbers.reduce(0, +)
print(sum)

let subtraction = numbers.reduce(100, -)
print(subtraction)

let totalUsers = appPortfolio.reduce(0, { $0 + $1.users })
print(totalUsers)

// MARK: -  Chaining - it can get to messy if we take this too far (caveat - always consider code readability over unreadable one liners)
let afterApplesCut = 0.7
let recurringRevenue = appPortfolio
    .map { $0.monthlyPrice * Double($0.users) * afterApplesCut}
    .reduce(0, +)
print(recurringRevenue)

// MARK: -  CompactMap - filter non nil values
let nilNumbers: [Int?] = [1, nil, 17, nil, 3, 7, nil, 99]
let nonNilNumbers = nilNumbers.compactMap { $0 }
print(nonNilNumbers)

// MARK: -  FlatMap - flat array of arrays into a flat one
let arrayOfArrays: [[Int]] = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
]
let singleArray = arrayOfArrays.flatMap { $0 }
print(singleArray)

let doubledSingleArray = arrayOfArrays.flatMap { $0.map { $0 * 2 } }
print(doubledSingleArray)


// MARK: - Q&A

// Question: What are higher order functions, and why are they useful in Swift?
// Answer: Higher order functions are functions that take other functions as parameters or return functions as results. They provide concise and expressive ways to perform operations on collections, offering more readable and functional code.

// Question: What does the `filter` higher order function do, and how does it compare to a traditional for loop?
// Answer: The `filter` function is used to filter elements based on a condition. It returns a new array containing only the elements that satisfy the condition. In comparison to a traditional for loop, `filter` provides a more concise and expressive syntax.

// Question: How does the `map` higher order function work, and what is a common use case for it?
// Answer: The `map` function transforms each element of a collection based on a provided closure and returns a new array with the transformed values. A common use case is extracting a specific property from objects in the collection.

// Question: Explain the purpose of the `reduce` higher order function, and how is it used for aggregation?
// Answer: The `reduce` function aggregates all values in a collection into a single result. It takes an initial value and a closure that specifies how to combine the current result with each element in the collection.

// Question: What is method chaining in the context of higher order functions, and what should be considered when chaining functions?
// Answer: Chaining involves applying multiple higher order functions one after another. While chaining can improve code readability, it's essential to balance it with maintainability and avoid overly complex one-liners.

// Question: Explain the purpose of the `compactMap` higher order function, and provide an example of its use.
// Answer: The `compactMap` function is used to filter out `nil` values from a collection of optionals. It returns a new array containing only the non-nil values.

// Question: Describe the `flatMap` higher order function and provide an example of its use.
// Answer: The `flatMap` function is used to flatten an array of arrays into a single array. It also allows applying a transformation to each element while flattening.
