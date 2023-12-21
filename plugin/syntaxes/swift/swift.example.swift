import Foundation

// Define a function to greet the user
func greetUser(name: String) {
    print("Hello, \(name)!")
}

// Define a structure representing a person
struct Person {
    var name: String
    var age: Int

    // Computed property
    var description: String {
        return "\(name), \(age) years old"
    }

    // Method
    func sayHello() {
        print("Hello from \(name)!")
    }
}

// Create an instance of the Person structure
var person1 = Person(name: "Alice", age: 25)

// Access properties and call methods
print(person1.description)
person1.sayHello()

// Conditional statement
let temperature = 28
if temperature > 25 {
    print("It's a warm day!")
} else {
    print("It's a moderate or cool day.")
}
