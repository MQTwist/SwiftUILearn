import Foundation

// 1. 可比较协议
struct Person: Comparable, Equatable {
    let name: String
    let age: Int
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.age < rhs.age
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}

// 2. 可哈希协议
struct Book: Hashable {
    let title: String
    let isbn: String
}

// 3. 可编码协议
struct User: Codable {
    let name: String
    let email: String
}

// 4. 可迭代协议
class ShoppingCart: Sequence {
    var items = ["Apple", "Banana", "Orange"]
    
    func makeIterator() -> IndexingIterator<[String]> {
        return items.makeIterator()
    }
}

// 5. 可自定义字符串描述协议
struct Point: CustomStringConvertible {
    let x: Int
    let y: Int
    
    var description: String {
        return "(x: \(x), y: \(y))"
    }
}

// 6. 可错误协议
enum NetworkError: Error {
    case timeout
    case serverError(code: Int)
}

// 使用示例
func demonstrateProtocols() {
    // Comparable & Equatable
    let alice = Person(name: "Alice", age: 25)
    let bob = Person(name: "Bob", age: 30)
    print(alice < bob) // true
    print(alice == bob) // false
    
    // Hashable
    let book1 = Book(title: "Swift", isbn: "123")
    let book2 = Book(title: "iOS", isbn: "456")
    let bookSet: Set<Book> = [book1, book2]
    print(bookSet.count) // 2
    
    // Codable
    let user = User(name: "Charlie", email: "charlie@example.com")
    if let data = try? JSONEncoder().encode(user) {
        print(String(data: data, encoding: .utf8)!)
    }
    
    // Sequence
    let cart = ShoppingCart()
    for item in cart {
        print("Cart item: \(item)")
    }
    
    // CustomStringConvertible
    let point = Point(x: 10, y: 20)
    print("Point is \(point)")
    
    // Error
    func fetchData() throws {
        throw NetworkError.serverError(code: 500)
    }
    
    do {
        try fetchData()
    } catch {
        print("Error: \(error)")
    }
}
