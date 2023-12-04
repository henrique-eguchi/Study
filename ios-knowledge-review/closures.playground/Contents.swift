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
