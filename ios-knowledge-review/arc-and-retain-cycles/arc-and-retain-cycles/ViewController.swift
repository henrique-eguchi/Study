//
//  ViewController.swift
//  arc-and-retain-cycles
//
//  Created by Henrique Akiyoshi Eguchi on 04/12/23.
//

import UIKit

/// ARC (Automatic Reference Counting), Apple's way of handling memory management of objects.
/// It holds a count for every strong reference an object has, when it goes to 0, it got deallocated from memory. When there are two objects pointing each other with strong references, the reference count for each object never reaches zero, which causes retain cycle and potentially can lead to a memory leak, in cases the objects are no longer needed.

// MARK: - Code with retain cycle

/// Strong reference between two objects
/// var sean                            var matilda
///      || strong                          || strong
///      \/                                 \/
/// Person instance    <-- strong --   Macbook instance
///  macbook: matilda   -- strong ->    owner: sean

//final class ViewController: UIViewController {
//
//    var sean: Person?
//    var matilda: Macbook?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        createObjects()
//        assignProperties()
//        unassignProperties()
//    }
//
//    func createObjects() {
//        sean = Person(name: "Sean")
//        matilda = Macbook(name: "Matilda")
//    }
//
//    func assignProperties() {
//        sean?.macbook = matilda
//        matilda?.owner = sean
//    }
//
//    func unassignProperties() {
//        sean = nil
//        matilda = nil
//    }
//}
//
//final class Person {
//    let name: String
//    var macbook: Macbook?
//
//    init(name: String, macbook: Macbook? = nil) {
//        self.name = name
//        self.macbook = macbook
//    }
//
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//final class Macbook {
//    let name: String
//    var owner : Person?
//
//    init(name: String, owner: Person? = nil) {
//        self.name = name
//        self.owner = owner
//    }
//
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}


// MARK: - Retain cycle resolved

/// One of the objects has a weak reference to the other object
/// var sean                            var matilda
///      || strong                          || strong
///      \/                                 \/
/// Person instance    <-- weak --   Macbook instance
///  macbook: matilda   -- strong ->    owner: sean

final class ViewController: UIViewController {

    var sean: Person?
    var matilda: Macbook?

    override func viewDidLoad() {
        super.viewDidLoad()

        createObjects()
        assignProperties()
        unassignProperties()
    }

    func createObjects() {
        sean = Person(name: "Sean")
        matilda = Macbook(name: "Matilda")
    }

    func assignProperties() {
        sean?.macbook = matilda
        matilda?.owner = sean
    }

    func unassignProperties() {
        sean = nil
        matilda = nil
    }
}

final class Person {
    let name: String
    var macbook: Macbook?

    init(name: String, macbook: Macbook? = nil) {
        self.name = name
        self.macbook = macbook
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

final class Macbook {
    let name: String
    weak var owner : Person?

    init(name: String, owner: Person? = nil) {
        self.name = name
        self.owner = owner
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}


// MARK: - Review / Questions

/// 1. What is ARC in Swift, and why is it used for memory management?

/// 2. Describe the concept of a retain cycle and how it can lead to memory leaks.

/// 3. In the provided code with a retain cycle, explain why it causes a memory leak.

/// 4. What happens when the reference count of an object becomes zero in the context of ARC?

/// 5. How does a strong reference differ from a weak reference in Swift?

/// 6. Why is it important to break retain cycles in your code, and how can it be achieved?

/// 7. What does the `deinit` keyword represent in Swift, and when is it called?

// MARK: - Answers

/// 1. ARC is a memory management mechanism in Swift that automatically tracks and manages the references to objects.
/// It counts the number of strong references an object has, and when the count drops to zero, the object is deallocated
/// from memory. ARC helps ensures efficient memory usage.

/// 2. A retain cycle occurs when two or more objects hold strong references to each other, creating a cycle.
/// In this situation, the reference count for each object never reaches zero, leading to a memory leak. Since each object
/// retains the other, they both remain in memory indefinitely, even if they are no longer needed.

/// 3. In the provided code, the `Person` instance (`sean`) holds a strong reference to the `Macbook` instance (`matilda`),
/// and vice versa. When the `unassignProperties` method is called, setting both references to `nil`, the reference count
/// does not drop to zero because each object still has a strong reference from the other, causing a retain cycle and a
/// potential memory leak.

/// 4. When the reference count of an object becomes zero, it means there are no more strong references to that object.
/// In the context of ARC, the object is deallocated, and its memory is freed up for reuse. This is an automatic process managed by the Swift runtime.

/// 5. A strong reference increases the reference count of an object, preventing it from being deallocated as long as
/// the reference exists. In contrast, a weak reference does not increase the reference count. If the last strong reference
/// to an object is removed and only weak references remain, the object is deallocated, preventing retain cycles and memory leaks.

/// 6. It is crucial to break retain cycles to avoid memory leaks and ensure efficient memory management. 
/// Retain cycles prevent objects from being deallocated, leading to increased memory usage over time. 
/// Breaking retain cycles can be achieved by using weak or unowned references for relationships that should not keep objects alive indefinitely.

/// 7. The `deinit` keyword is used to define a deinitializer in Swift, which is called when an object is deallocated.
/// It provides an opportunity to perform cleanup or release any resources held by the object before it is removed from memory.
/// The `deinit` method is automatically invoked when the reference count of an object drops to zero.
