import UIKit

// MARK: - Delegates and Protocols


/// Delegates and Protocols are like messengers that help different parts of a Swift program talk to each other. They're especially handy in iOS development for making different parts of an app work together.
/// A protocol is like a contract that defines what methods and properties an object should have. It's a way to make sure different types of objects follow the same rules, promoting consistency in the code.
/// A delegate, on the other hand, is an object that acts on behalf of, or in coordination with, another object. It is a way for one object to delegate certain responsibilities or tasks to another object. Delegates are crucial for achieving the Separation of Concerns principle, as they allow objects to communicate without being tightly coupled.
/// In the delegate pattern, a delegating object (the boss) defines a protocol, and a delegate (the intern) conforms to that protocol. The delegating object then invokes methods on the delegate to notify it of specific events or to request specific actions.
/// Using weak references for delegates is a common practice to prevent strong reference cycles (retain cycles), where objects reference each other strongly, leading to memory leaks.


// MARK: - Protocol Definition

protocol ProductSelectionDelegate: AnyObject {
    func didSelectProduct(name: String, imageName: String)
}

// MARK: - Boss (ProductSelectionViewController)

class ProductSelectionViewController {
    weak var delegate: ProductSelectionDelegate?

    func simulateButtonTap(productName: String, imageName: String) {
        // Simulating a button tap and informing the delegate
        delegate?.didSelectProduct(name: productName, imageName: imageName)
    }
}

// MARK: - Intern (MainViewController)

class MainViewController: ProductSelectionDelegate {
    let productLabel = UILabel()
    let productImageView = UIImageView()

    func didSelectProduct(name: String, imageName: String) {
        // Intern (MainViewController) receives instructions from the boss (ProductSelectionViewController)
        productLabel.text = name
        productImageView.image = UIImage(named: imageName)
        print("MainViewController updated with \(name) and \(imageName)")
    }
}

// MARK: - Usage

let mainVC = MainViewController()
let productSelectionVC = ProductSelectionViewController()
productSelectionVC.delegate = mainVC

// Simulate button taps
productSelectionVC.simulateButtonTap(productName: "iPhone 14", imageName: "iPhone")
productSelectionVC.simulateButtonTap(productName: "iPad Air", imageName: "iPad")
productSelectionVC.simulateButtonTap(productName: "MacBook", imageName: "Mac")


// MARK: - Q&As

// Q1:
// What is a protocol in Swift?
// A1: A protocol defines a blueprint of methods, properties, and other requirements. It is a way to define a set of rules or functionality that conforming types must implement.

// Q2:
// What is a delegate in Swift?
// A2: A delegate is a design pattern in Swift where one object passes its responsibility (or part of it) to another object.

// Q3:
// How are protocols used in Swift?
// A3: Protocols are used to define a set of methods and properties that a conforming type must implement. They provide a way to achieve polymorphism in Swift.

// Q4:
// What is the role of the delegate in the delegate pattern?
// A4: The delegate is responsible for handling specific tasks or events on behalf of another object. It acts as an intermediary between objects, allowing them to communicate without being directly connected.

// Q5:
// Can a class conform to multiple protocols in Swift?
// A5: Yes, a class can conform to multiple protocols in Swift, providing a way to adopt different sets of behaviors.

// Q6:
// How does the delegate pattern promote loose coupling between objects?
// A6: The delegate pattern allows objects to communicate without having direct references to each other, promoting loose coupling. The delegate acts as an intermediary, and changes in one object don't necessarily affect the other.

// Q7:
// Why use weak references when declaring a delegate in Swift?
// A7: Using weak references helps prevent strong reference cycles, also known as retain cycles, where objects hold strong references to each other and prevent each other from being deallocated.

// Q8:
// Can a protocol have optional methods in Swift?
// A8: Yes, a protocol can define optional methods using the `@objc` attribute. Conforming types can choose whether to implement optional methods.

// Q9:
// How can you check if an object conforms to a protocol in Swift?
// A9: You can use the `is` keyword or the `as?` keyword to check if an object conforms to a protocol in Swift.

// Q10:
// What is the difference between a delegate and a data source?
// A10: While a delegate is responsible for handling specific tasks or events, a data source is responsible for providing data to a control, such as a table view or collection view.
