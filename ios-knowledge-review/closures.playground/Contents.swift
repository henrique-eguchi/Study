import UIKit

// MARK: - Closures

/// Self-contained blocks of functionality that can be passed around and used in your code. Functions that can be passed around
/// Example: () -> Void

struct Student {
    let name: String
    let testScore: Int
}

let students = [
    Student(name: "Luke", testScore: 88),
    Student(name: "Han", testScore: 73),
    Student(name: "Leia", testScore: 95),
    Student(name: "Chewy", testScore: 78),
    Student(name: "Obi-Wan", testScore: 65),
    Student(name: "Ahsoka", testScore: 86),
    Student(name: "Yoda", testScore: 68)
]

// Writing a separate closure promote cleanliness and reusability
var topStudentFilter: (Student) -> Bool = { student in
    return student.testScore > 80
}

// Function alternative
func topStudentFilterFunc(student: Student) -> Bool {
    return student.testScore > 80
}

// Can pass both `topStudentFilter` and `topStudentFilterFunc`
let topStudents = students.filter(topStudentFilter)

for topStudent in topStudents {
    print(topStudent.name)
}

// Shorthand
let topStudents2 = students.filter { $0.testScore > 80 }
let studentRanking = topStudents.sorted { $0.testScore > $1.testScore }


// MARK: - Trailing closure synthax

/// Most of SwiftUI views has trailing closure synthax
/// Example:
/// - func someFunc(completion: () -> Void) {
/// Call as: someFunc { }


// MARK: - @escaping

/// Use @escaping when the closure needs to outlive the life of the function that called it.
/// Example:
/// Generally on network requests, you send the completion block and as soon as the request complete, it will execute your code
/// See more - ARC & Retain cycles


// MARK: - Questions

/// 1. What is a closure in Swift, and how is it different from a function?

/// 2. How can closures be used for filtering elements in an array, as demonstrated in the provided code?

/// 3. Explain the concept of trailing closure syntax in Swift. Provide an example from the code.

/// 4. What does the @escaping attribute mean in the context of closures, and when would you use it?

/// 5. Compare and contrast the topStudentFilter closure and the topStudentFilterFunc function in terms of usage and syntax.

/// 6. In the context of the provided code, why might you choose to use a closure for filtering instead of a traditional function?

/// 7. How does the closure syntax { $0.testScore > 80 } work, and what is its equivalent long-form syntax?

/// 8. Describe a scenario where you might use a closure with the sorted function, as demonstrated in the code.

// MARK: - Answers

/// 1. A closure in Swift is a self-contained block of functionality that can be passed around and used in your code.
/// Closures are similar to functions but have a more concise syntax. The key difference is that closures can capture
/// and store references to variables and constants from the surrounding context in which they are defined, allowing
/// them to modify or use these values even after the context has finished executing.

/// 2. Closures can be used as predicates for filtering elements in an array using functions like filter. In the code,
/// the topStudentFilter closure is used to filter students with a test score greater than 80.

/// 3. Trailing closure syntax is a feature in Swift where if a closure is the last argument of a function, it can be
/// placed outside the parentheses. This enhances code readability. In the code, the filter and sorted functions use
/// trailing closure syntax.

/// 4. The @escaping attribute is used to indicate that a closure passed as a parameter to a function will be stored
/// or outlive the life of that function. It is commonly used in scenarios where asynchronous operations are involved,
/// such as network requests with completion handlers.

/// 5.  Both topStudentFilter and topStudentFilterFunc serve the same purpose of filtering top students. However,
/// the closure syntax is more concise and is suitable for short, one-off operations. The function provides a named,
/// reusable option and is more verbose.

/// 6. Using a closure for filtering can be more concise and expressive, especially for short-lived operations.
/// It promotes cleaner code and is often preferred for simple tasks like filtering an array.

/// 7. The closure syntax { $0.testScore > 80 } is a shorthand way of writing closures in Swift. It represents a
/// closure that takes a Student as an argument and returns a boolean based on the test score being greater than 80.
/// The equivalent long-form syntax would be { (student: Student) -> Bool in return student.testScore > 80 }.

/// 8. You might use a closure with the sorted function when you want to customize the sorting order based on a
/// specific property. In the code, the closure { $0.testScore > $1.testScore } is used to sort students in descending
/// order based on their test scores.
