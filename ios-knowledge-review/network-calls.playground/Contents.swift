import UIKit

// MARK: - Basic closure implementation

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


// MARK: - Async/Await implementation

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
