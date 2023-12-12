import UIKit


final class Solution {
    func shortestToChar(_ s: String, _ c: Character) -> [Int] {
        var result = [Int]()
        let enumeratedString = s.enumerated()
        let characterIndices = enumeratedString.compactMap { $1 == c ? $0 : nil }
        for (index, character) in enumeratedString {
            if character == c {
                result.append(0)
            } else {
                result.append(characterIndices.map { abs(index - $0) }.min()!)
            }
        }
        return result
    }

    public func solution(_ A : inout [Int]) -> Int {
        let nonNegativeValues = A.compactMap { $0 > 0 ? $0 : nil }
        if nonNegativeValues.isEmpty {
            return 1
        } else {
            let set = Set(nonNegativeValues)
            var values = Set(1...100_000)
            values.subtract(set)
            return values.min()!
        }
    }
}

print(Solution().shortestToChar("loveleetcode", "e"))
var input = [1, 3, 6, 4, 1, 2]
print(Solution().solution(&input))
