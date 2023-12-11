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
