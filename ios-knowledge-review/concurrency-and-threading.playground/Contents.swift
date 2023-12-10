import UIKit

// MARK: - Concurrency and Threading

// Concurrency is doing multiple tasks at same time. Apple's multi-core processors allows us to do this.

// Threading is a fundamental approach to achieving concurrency. Threads are lightweight units of execution that enable different code to run simultaneously. Threading is like a highway with multiple lanes, each lane represent a thread while each car on that lane represent a task.

// Main thread is the fastest lane and background is the slower lanes.

// Main thread is clean, speedy, where de UI is done and where the heavy tasks should be avoided since it's going to freeze the UI.

// Background thread is where heavy tasks are made

// GCD - Grand Central Dispatch, NSOperationQueue & async await

// GCD and NSOperationQueue is an API that manages threading for us so we can only deal with queues and tasks
// It comes with 1 main thread and 4 background threads (separated by qos: quality of service - priority)
// You can create custom backgorund threads but the built-ins are more than enough

// Queue (people lining up for a rock show - for instance) - queues has two different types: Serial & Concurrent
// - It is FIFO (First In First Out)

// Serial queues
// - Ordered and tasks are executed following a order and dependency

// Concurrent queues
// - Every task starts in order but each of them does not wait for other tasks to be completed
// - The order of completion is unpredictable

// MARK: -  Pros & Cons

// Serial
// - Predictable execution order
// - Prevent race conditions
// - Slower (tasks needs to wait the preceding to be executed)

// Concurrent
// - Faster
// - Unpredictable execution order
// - Can lead to race condition if the resources are not well managed


// MARK: -  Usage

// Serial
// - When the order is important

// Concurrent
// - When order is not important and you want speed


// MARK: -  Implementation

DispatchQueue.main.async {
    // self.tableView.reloadData()
}

DispatchQueue.global(qos: .background).async {
    // code to run in background queue
}

// Operation framework provides a higher-level approach to concurrency - it allows us to encapsulate tasks as operation objects, offering features like dependency, priority and cancellations. OperationQueue is built on top of GCD, and it manages the execution of these operations

// MARK: -  Implementation

let operationQueue = OperationQueue()

let op1 = BlockOperation {
    print("op1")
}

let op2 = BlockOperation {
    print("op2")
}

op1.addDependency(op2) // op2 will execute first

operationQueue.addOperations([op1, op2], waitUntilFinished: false)


// MARK: - Conceptual Questions

// Question: What is concurrency, and why is it essential in modern software development?
// Answer: Concurrency is the execution of multiple tasks in overlapping time intervals. It is essential in modern software development to improve performance, responsiveness, and resource utilization by allowing multiple tasks to progress simultaneously.

// Question: What is the difference between concurrency and parallelism?
// Answer: Concurrency is the execution of multiple tasks that may start, overlap, and finish at different times. Parallelism is the simultaneous execution of multiple tasks, focusing on simultaneous execution rather than the order of execution.

// Question: In Swift, what is the Grand Central Dispatch (GCD), and how does it facilitate concurrent programming?
// Answer: GCD is a powerful API in Swift for concurrent programming. It abstracts away thread management complexities, allowing developers to dispatch tasks to queues with control over concurrent or serial execution.

// Question: What is a thread, and how does it relate to concurrency in Swift?
// Answer: A thread is the smallest unit of execution. In Swift, threads are used for concurrent execution. Multiple threads can run in parallel, enabling concurrent execution of different parts of a program.

// Question: Explain the concept of a serial queue and a concurrent queue in GCD.
// Answer: A serial queue executes tasks one at a time in the order they are added. A concurrent queue can execute multiple tasks simultaneously, allowing for overlapping execution and potentially different finishing orders.

// Question: What is the purpose of the `DispatchQueue` class in Swift, and how is it used for scheduling tasks concurrently?
// Answer: `DispatchQueue` manages task execution either concurrently or serially. Developers use it to dispatch tasks to different queues, controlling the order and timing of execution.

// Question: What are the advantages and disadvantages of using threads for concurrency in Swift?
// Answer: Advantages include improved performance and resource utilization. Disadvantages include increased complexity, potential for race conditions, deadlocks, and difficulty managing shared resources.

// Question: Describe the difference between synchronous and asynchronous execution in the context of GCD.
// Answer: Synchronous execution blocks the current thread until a task completes. Asynchronous execution adds tasks to a queue, allowing the program to continue without waiting. Asynchronous tasks are executed in the background, enhancing concurrency.

// Question: What is the significance of the main queue in GCD, and when should you perform UI-related tasks on it?
// Answer: The main queue is a serial queue dedicated to UI updates. UI-related tasks should be performed on the main queue to ensure a smooth and responsive user interface.

// Question: How does Swift's `async/await` model improve upon traditional approaches to concurrency, and what benefits does it bring to code readability and maintainability?
// Answer: Swift's `async/await` simplifies asynchronous code, making it more readable and sequential. It eliminates callback hell, improving code maintainability by expressing concurrency in a manner resembling synchronous code.
