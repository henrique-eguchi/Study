import UIKit

// REST API
// Representational State Transfer (REST) Application Programming Interface (API) conforming to REST architectural style in order to connect & communicate to RESTful web services.
// It transfer a representation of the state of the resource - this information is delivered in one of several formats via HTTP (JSON, HTML, XLT, PYTHON, PHP or plain text).
// JSON is the most generally popular file format because it's language agnostic, as well as readable by both humans and machines.
// JSON - JavaScript Object Notation
// {
//   username: "henrique-eguchi",
//   bio: "My bio"
// }
//
// REST API is considered easier, faster and more lightweight (with increased scalablity) to use than other protocols such as SOAP (Simple Object Access Protocol) - which has specific requirements like XML messaging and built-in security and transaction that make it slower and heavier. This makes REST API perfect for IoT and mobile app development.

// GitHub Open API
// curl https://api.github.com/users/henrique-eguchi

// MARK: - Basic closure network call implementation

// MARK: - Domain Model

struct User {
    let username: String
    let avatarUrl: String
    let bio: String
}

// MARK: - Service

enum NetworkServiceError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case decodingError
}

protocol UserQueryService {
    func getUser(with username: String, completion: @escaping (Result<User, NetworkServiceError>) -> Void)
}

final class NetworkUserQueryService: UserQueryService {
    func getUser(with username: String, completion: @escaping (Result<User, NetworkServiceError>) -> Void) {
        // URL build
        let endpoint = "https://api.github.com/users/\(username)"

        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidURL))
            return
        }

        // Networking - URLSession
        URLSession.shared.dataTask(with: url) { (data, response, _) in
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data else {
                completion(.failure(.invalidData))
                return
            }

            // Decoding
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let githubUser = try decoder.decode(GitHubUser.self, from: data)
                completion(.success(githubUser.user))
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}

struct GitHubUser: Decodable {
    let login: String
    let avatarUrl: String
    let bio: String

    // MARK: - Mapping to Domain Model

    var user: User {
        User(
            username: login,
            avatarUrl: avatarUrl,
            bio: bio
        )
    }
}


// MARK: - Async/Await network call implementation

protocol AsyncAwaitUserQueryService {
    func getUser(with username: String) async throws -> User
}

final class AsyncAwaitNetworkUserQueryService: AsyncAwaitUserQueryService {
    func getUser(with username: String) async throws -> User {
        // URL build
        let endpoint = "https://api.github.com/users/\(username)"

        guard let url = URL(string: endpoint) else {
            throw NetworkServiceError.invalidURL
        }

        // Networking - URLSession
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NetworkServiceError.invalidResponse
        }

        // Decoding
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let githubUser = try decoder.decode(GitHubUser.self, from: data)
            return githubUser.user
        } catch {
            throw NetworkServiceError.decodingError
        }
    }
}


// MARK: - Test

//let userQueryService: UserQueryService = NetworkUserQueryService()
//userQueryService.getUser(with: "henrique-eguchi") { result in
//    switch result {
//    case .success(let user):
//        print("AvatarUrl: \(user.avatarUrl) - Username: \(user.username) - Bio: \(user.bio)")
//    case .failure:
//        print("Failure")
//    }
//}

let userQueryService: AsyncAwaitUserQueryService = AsyncAwaitNetworkUserQueryService()
let task = Task {
    do {
        let user = try await userQueryService.getUser(with: "henrique-eguchi")
        print("AvatarUrl: \(user.avatarUrl) - Username: \(user.username) - Bio: \(user.bio)")
    } catch {
        print("Failure")
    }
}


// MARK: - RESTful APIs in Swift Q&A

// Questions

// Question 1: What does REST stand for, and what is the purpose of a RESTful API?
// Question 2: Why is JSON the preferred format for data exchange in RESTful APIs?
// Question 3: How does a RESTful API compare to other protocols like SOAP, and why is it considered preferable for mobile app development?
// Question 4: Explain the basic structure of a REST API call using the GitHub Open API example provided.
// Question 5: Describe the purpose of the closure-based network call implementation in the provided Swift code.
// Question 6: What is the purpose of the `Async/Await` network call implementation in the Swift code, and how does it differ from the closure-based approach?
// Question 7: Explain the role of the `UserQueryService` and its implementations in the Swift code.
// Question 8: In the Swift code, how is the GitHub API response mapped to the `User` domain model?
// Question 9: How is error handling implemented in the Swift code when making network requests?
// Question 10: Provide an example of how to use the `UserQueryService` in the Swift code to fetch user data and print the result.

// Answers

// Answer 1: REST stands for Representational State Transfer. A RESTful API is designed to conform to the principles of REST architecture, transferring a representation of the state of a resource over HTTP. It allows communication with web services using various formats, with JSON being a commonly used language-agnostic choice.
// Answer 2: JSON, or JavaScript Object Notation, is a popular and widely supported file format in RESTful APIs due to its language-agnostic nature, readability for both humans and machines, and simplicity. It facilitates easy data exchange between different systems.
// Answer 3: RESTful APIs are considered easier, faster, and more lightweight compared to other protocols like SOAP (Simple Object Access Protocol). REST is preferred for mobile app development and IoT due to its simplicity, scalability, and efficiency in handling smaller data transfers.
// Answer 4: A basic REST API call to the GitHub Open API involves sending an HTTP GET request to the endpoint "https://api.github.com/users/henrique-eguchi". The response contains a representation of the user's data, typically in JSON format.
// Answer 5: The closure-based network call implementation is designed to fetch user data from the GitHub API asynchronously. It uses the URLSession to perform the network request and a closure to handle the result asynchronously, providing a callback mechanism for handling success or failure.
// Answer 6: The `Async/Await` network call implementation is an alternative approach that leverages Swift's concurrency model. It allows writing asynchronous code in a more synchronous and readable manner using the `async` and `await` keywords. This approach simplifies error handling and improves code readability compared to the closure-based approach.
// Answer 7: The `UserQueryService` protocol defines a contract for fetching user data, and it has two implementations: `NetworkUserQueryService` using closure-based networking and `AsyncAwaitNetworkUserQueryService` using the `Async/Await` approach. Both implementations conform to the protocol and provide a way to fetch user data from the GitHub API.
// Answer 8: The GitHub API response is initially decoded into a `GitHubUser` struct using `Decodable`. The `GitHubUser` struct contains properties like `login`, `avatarUrl`, and `bio`. The `user` computed property in `GitHubUser` is then used to map the response to the `User` domain model.
// Answer 9: Error handling is implemented using the `Result` type and an associated `NetworkServiceError` enum. The completion handler in both closure-based and `Async/Await` approaches returns a `Result` with either a success containing the fetched user data or a failure with a specific error from the `NetworkServiceError` enum.
// Answer 10: The provided example demonstrates using the `Async/Await` approach to fetch user data. The `getUser` function is called with a username, and the result is obtained within an asynchronous task. The user data is then printed if the request is successful, and an error message is printed otherwise.
