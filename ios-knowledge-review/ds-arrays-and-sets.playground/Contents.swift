import UIKit

// MARK: - Arrays & Sets

// Set has much better performance and some really powerful methods to compare different sets (Intersection, Symmetric Difference, Union, Subtract and Disjoint)

// Both are collections
// Arrays can have duplicated values, has the same order (ordered) and keeps it - that's why it is less performant than Sets. If you do any manipulation it has to check every item in the array - Time complexity is O(n) - linear - the larger it gets the longer it will take to do lookups or mutations
// Usage: If the order is important or if it is a small array.

var someArray = ["Hey", "my", "my", "name", "is", "Henrique"]

// Sets, in the other hand, cannot have duplicated values and is unordered - every time I access it, the order is not guaranteed (probably get a different order every time the set is accessed) - Then the time complexity is O(1) - constant. So since everything is unique, the elements has to conform to Hashable - this allows to constant time lookup
// Usage: If you're dealing with really large arrays and you don't care about its order, it better to use Sets instead.

var someSet: Set = ["Hey", "my", "my", "name", "is", "Henrique"] // results in ["Hey", "my", "name", "is", "Henrique"]

// Intersection, Symmetric Difference, Union, Subtract and Disjoint
var swiftUIDevs: Set = ["Henrique", "Fernando"]
var swiftDevs: Set = ["Henrique", "Fernando", "Paulo", "Rafael", "Eric"]
var kotlinDevs: Set = ["Paulo", "Virginia", "Rafael", "HenriqueF", "Maya"]
var experiencedDevs: Set = ["Henrique", "Virginia", "Paulo", "Rafael", "Eric"]

// Intersect - pull out overlap
let experiencedSwiftUIDevs = swiftUIDevs.intersection(experiencedDevs)

// Subtract - pull out difference
let juniorSwiftDev = swiftDevs.subtracting(experiencedDevs) // swiftDevs that's not experienced

// Disjoint - check for overlap
swiftUIDevs.isDisjoint(with: kotlinDevs) // return true - there's no overlap

// Union - combine
swiftUIDevs.union(swiftDevs)

// Exclusive - only in 1 set
let specialists = swiftDevs.symmetricDifference(kotlinDevs)

// Subset
swiftUIDevs.isSubset(of: swiftDevs) // return true - swiftUIDevs is a subset of swiftDevs

// Superset
swiftDevs.isSuperset(of: swiftUIDevs) // return true

// Insert, Delete, Find
swiftDevs.insert("Ray")
swiftDevs.remove("Henrique")
swiftDevs.contains("Henrique")
swiftDevs

// Review
// Array
// - Can have duplicates
// - Ordered
// - Less performance - O(n)

//Set
// - No duplicates
// - Unordered
// - Best performance - O(1)
// - Powerful methods to compare different sets


// MARK: - Conceptual Questions

// Question: What is the key difference between arrays and sets in Swift?

// Question: Explain the time complexity difference between arrays and sets when it comes to lookups or mutations.

// Question: When would you choose to use an array over a set, and vice versa?

// Question: Why does a set require its elements to conform to the `Hashable` protocol?

// Question: What are some characteristics of arrays, and in what scenarios would you find them more suitable?

// Question: How does the order of elements impact the performance of arrays?

// Question: What does it mean for a set to be unordered, and how is it reflected when accessing elements?

// Question: Explain the concept of time complexity in the context of arrays and sets.

// Question: What advantages does a set offer over an array when dealing with large collections of unique elements?

// Question: Can you describe the operations of Intersection, Symmetric Difference, Union, Subtract, and Disjoint in sets?

// MARK: Answers

// Answer: Arrays can have duplicated values and maintain the order of elements, while sets cannot have duplicated values and are unordered.

// Answer: Arrays have a time complexity of O(n) for lookups and mutations, where n is the size of the array. Sets, on the other hand, have a constant time complexity of O(1) for these operations.

// Answer: Arrays are suitable when the order of elements is important, or when dealing with smaller collections. Sets are preferred for larger collections where uniqueness is essential, and the order is not a concern.

// Answer: Sets rely on hashing to achieve constant time complexity for lookups. The `Hashable` protocol ensures that elements can be uniquely identified and compared efficiently.

// Answer: Arrays can have duplicates, maintain order, and are suitable when the order of elements matters or for smaller collections where performance is less critical.

// Answer: The order of elements in arrays introduces a linear time complexity (O(n)) for lookups and mutations. As the array size increases, the time required for these operations also increases.

// Answer: The unordered nature of sets means that the order of elements is not guaranteed when accessing them. Each access may result in a different order.

// Answer: Time complexity measures the efficiency of an algorithm or operation based on the input size. Arrays have a time complexity of O(n) for lookups and mutations, while sets have a constant time complexity of O(1).

// Answer: Sets provide better performance (O(1)) for lookups and mutations, making them more efficient for large collections with unique elements.

// Answer:
// - Intersection: Returns a set containing the common elements between two sets.
// - Symmetric Difference: Returns a set with elements exclusive to each set.
// - Union: Combines two sets, excluding duplicates.
// - Subtract: Returns a set with elements from the first set not present in the second set.
// - Disjoint: Checks if two sets have no common elements and returns a boolean value.

