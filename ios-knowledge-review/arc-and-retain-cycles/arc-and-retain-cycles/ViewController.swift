//
//  ViewController.swift
//  arc-and-retain-cycles
//
//  Created by Henrique Akiyoshi Eguchi on 04/12/23.
//

import UIKit

/// ARC (Automatic Reference Counting), Apple's way of handling memory management of objects.
/// It holds a count for every strong reference an object has, when it goes to 0, it got deallocated from memory. When there are two objects pointing each other with strong references, if one is removed from the memory, the other will still be there since the reference is strong.

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
