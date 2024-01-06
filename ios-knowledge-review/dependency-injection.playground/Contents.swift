import UIKit

// MARK: - Dependency Injection playground

// Dependency Injection (DI) is a software design pattern that promotes the passing of dependencies (services or objects that a class relies on) into the class that needs them, rather than allowing the class to create or manage its own dependencies.
 // The primary goal of dependency injection is to achieve Inversion of Control (IoC), where the control flow of a program is inverted. Instead of a class controlling the creation and management of its dependencies, it receives them from an external source.

 // Benefits of Dependency Injection:
 // 1. Testability: DI facilitates easier unit testing by allowing the injection of test doubles (mocks, stubs, spies) for dependencies. This ensures that classes can be tested in isolation without relying on concrete implementations.
 // 2. Flexibility: DI enables the swapping of components and services without modifying the dependent classes. This flexibility is crucial for adapting to changing requirements and maintaining a modular codebase.
 // 3. Separation of Concerns (SoC): DI helps achieve SoC by separating the responsibility of managing dependencies from the core logic of a class. Each class focuses on its primary purpose, making the codebase more maintainable.


// Without Dependency Injection

final class SomeConcreteService {
    func someOperation() { }
}

final class WODIViewModel {
    private let someService = SomeConcreteService()

    func someFunc() {
        someService.someOperation()
    }
}

// Tight-coupled with SomeConcreteService
// WODIViewModel is responsible for also creating/managing the dependencies
// Not testable since we can't inject the service for testing


// Dependency Injection

protocol SomeService {
    func someOperation()
}

protocol SomeOtherService {
    func someOperation()
}

protocol SomeDelegate: AnyObject { }

final class SomeViewModel {
    private let someService: SomeService

    weak var someDelegate: SomeDelegate? // Property injection

    // Initializer injection
    init(someService: SomeService) {
        self.someService = someService
    }

    func someFunc() {
        someService.someOperation()
    }

    // Method injection
    func someFuncWithDependency(service: SomeOtherService) {
        service.someOperation()
    }
}

// Simplify data flow
// Help Separation of Concerns while removing the responsibility of the ViewModel to create its own dependencies
// It is easier to swap components & tests
// It may be tight-coupled with some concrete implementation but in this example we're depending on abstractions so we have eliminated this


// MARK: - Q&As

// 1. What is Dependency Injection (DI)?
// 2. Why is Dependency Injection important?
// 3. How does Dependency Injection achieve testability?
// 4. What is Inversion of Control (IoC)?
// 5. What are the benefits of Dependency Injection in terms of flexibility?
// 6. How does Dependency Injection contribute to the separation of concerns?
// 7. Explain the concept of "tight coupling" and how Dependency Injection addresses it.
// 8. What are the common approaches to Dependency Injection in Swift?
// 9. How does Dependency Injection simplify data flow in an application?
// 10. Can you give an example of Dependency Injection in practice?

// MARK: - Answers

// 1. Dependency Injection is a software design pattern that promotes passing dependencies into a class rather than allowing the class to create or manage its own dependencies.
// 2. Dependency Injection is crucial for testability, flexibility, and separation of concerns. It makes unit testing easier, enables the swapping of components without modifying dependent classes, and helps achieve a separation of concerns by focusing on each class's primary purpose.
// 3. Dependency Injection allows the injection of test doubles (mocks, stubs) for dependencies, making it possible to test classes in isolation without relying on concrete implementations.
// 4. Inversion of Control is a design principle where the control flow of a program is inverted. In the context of Dependency Injection, IoC means that a class receives its dependencies from an external source instead of creating or managing them.
// 5. Dependency Injection enables the swapping of components and services without modifying dependent classes. This flexibility is essential for adapting to changing requirements and maintaining a modular codebase.
// 6. Dependency Injection helps achieve separation of concerns by separating the responsibility of managing dependencies from the core logic of a class. Each class can focus on its primary purpose, leading to a more maintainable codebase.
// 7. Tight coupling refers to strong dependencies between classes or components, making them interdependent. Dependency Injection addresses tight coupling by allowing dependencies to be injected from an external source, reducing the direct dependencies a class has on concrete implementations.
// 8. Common approaches to Dependency Injection in Swift include initializer injection, property injection, and method injection. These approaches provide flexibility in injecting dependencies at different points in the object's lifecycle.
// 9. Dependency Injection simplifies data flow by clearly defining and injecting dependencies where they are needed. This helps in understanding and visualizing the flow of data and actions in an application.
// 10. In the provided example, the `SomeViewModel` class uses dependency injection to receive a `SomeService` instance. Concrete implementations, such as `ConcreteServiceA` and `ConcreteServiceB`, can be injected based on the application's requirements.
