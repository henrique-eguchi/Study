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
