// main.odin
package main

import "core:fmt"
import "core:os"
import "core:math"

// Constants and Variables
const (
    PI = 3.141592653589793
)

var (
    global_var: i32 = 10
)

// Enum Example
enum Color {
    Red,
    Green,
    Blue,
}

// Struct Definition
struct Point {
    x: f64,
    y: f64,
}

struct Circle {
    center: Point,
    radius: f64,
}

// Method for Circle
fn (c: Circle) Area() f64 {
    return PI * c.radius * c.radius
}

// Function Definitions
fn add(a: i32, b: i32) -> i32 {
    return a + b
}

fn factorial(n: i64) -> i64 {
    if n == 0 {
        return 1
    }
    return n * factorial(n - 1)
}

// Generic Function
fn swap[T](a: ^T, b: ^T) {
    temp := *a
    *a = *b
    *b = temp
}

// Variadic Function
fn sum_all(numbers: ...i32) -> i32 {
    total := 0
    for num in numbers {
        total += num
    }
    return total
}

// Error Handling Example
fn might_fail(should_fail: bool) -> ! {
    if should_fail {
        panic("An error occurred!")
    }
    fmt.println("Success!")
}

fn main() {
    // Variables
    a: i32 = 5
    b: i32 = 10
    fmt.println("a + b =", add(a, b)) // Function call

    // Control Flow
    if a < b {
        fmt.println("a is less than b")
    } else {
        fmt.println("a is not less than b")
    }

    // Loop Example
    for i in 0..5 {
        fmt.println("i =", i)
    }

    // Switch Example
    color: Color = Color.Green
    switch color {
    Color.Red:
        fmt.println("Color is Red")
    Color.Green:
        fmt.println("Color is Green")
    Color.Blue:
        fmt.println("Color is Blue")
    }

    // Structs and Methods
    p := Point{x: 3.0, y: 4.0}
    fmt.println("Point:", p)

    c := Circle{center: p, radius: 5.0}
    fmt.println("Circle Area:", c.Area())

    // Slices and Arrays
    arr: [5]i32 = {1, 2, 3, 4, 5}
    slice: []i32 = arr[:]
    fmt.println("Slice:", slice)

    // Pointers
    ptr_a: ^i32 = &a
    ptr_b: ^i32 = &b
    fmt.println("Before swap: a =", a, ", b =", b)
    swap(&ptr_a, &ptr_b) // Swapping pointers
    fmt.println("After swap: a =", a, ", b =", b)

    // Generics
    x: f64 = 3.14
    y: f64 = 2.71
    fmt.println("Before generic swap: x =", x, ", y =", y)
    swap(&x, &y)
    fmt.println("After generic swap: x =", x, ", y =", y)

    // Variadic Function
    total := sum_all(1, 2, 3, 4, 5)
    fmt.println("Sum of all numbers:", total)

    // Recursion
    fact := factorial(5)
    fmt.println("Factorial of 5:", fact)

    // Error Handling
    defer fmt.println("This will always run, even if there's a panic.")
    try might_fail(true)
    fmt.println("This line will not execute if there's a panic.")

    // Concurrency
    ch := make(chan i32)
    go func() {
        for i := 0; i < 3; i += 1 {
            ch <- i
            fmt.println("Sent:", i)
        }
        close(ch)
    }()

    for val in ch {
        fmt.println("Received:", val)
    }

    // Exiting the program
    os.exit(0)
}
