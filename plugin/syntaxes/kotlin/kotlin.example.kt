// Package declaration
package com.example

// Import statements
import java.util.*

// Class declaration
class Example {

    // Property with getter and setter
    var name: String = "Kotlin"
        get() = field.toUpperCase()
        set(value) {
            field = "Hello, $value!"
        }

    // Nullable type and safe call operator
    fun printLength(str: String?) {
        println("Length: ${str?.length}")
    }

    // Extension function
    fun String.addExclamation(): String {
        return "$this!"
    }

    // Lambda expression
    val add: (Int, Int) -> Int = { a, b -> a + b }

    // Nullable type with elvis operator
    fun greetPerson(person: String?) {
        val name = person ?: "Guest"
        println("Hello, $name!")
    }

    // Range expression
    fun printNumbersInRange(start: Int, end: Int) {
        for (i in start..end) {
            print("$i ")
        }
        println()
    }

    // Data class
    data class User(val id: Int, val username: String)

    // Singleton object
    object Logger {
        fun log(message: String) {
            println("Log: $message")
        }
    }

    // Main function
    fun main() {
        // Creating an instance of the class
        val example = Example()

        // Using properties
        example.name = "World"
        println(example.name)

        // Using nullable types
        example.printLength(null)
        example.printLength("Kotlin")

        // Using extension function
        println("Kotlin".addExclamation())

        // Using lambda expression
        println("Sum: ${add(5, 3)}")

        // Using elvis operator
        example.greetPerson(null)
        example.greetPerson("John")

        // Using range expression
        example.printNumbersInRange(1, 5)

        // Using data class
        val user = User(1, "alice")
        println("User: $user")

        // Using singleton object
        Logger.log("This is a log message")
    }
}

// Top-level function
fun main() {
    // Creating an instance of the class
    val example = Example()

    // Calling the main function
    example.main()
}
