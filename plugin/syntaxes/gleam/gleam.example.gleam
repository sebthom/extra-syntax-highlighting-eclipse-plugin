// A simple module declaration
pub fn hello() -> String {
  "Hello, Gleam!"
}

// 1. Variables and Basic Types
pub fn basic_types() {
  let an_integer = 42
  let a_float = 3.14
  let a_string = "Gleam is great!"
  let a_boolean = true

  // Printing values (requires a string to be returned or used in the IO system)
  io.print(an_integer)
  io.print(a_float)
  io.print(a_string)
  io.print(a_boolean)
}

// 2. Custom Types (Enums)
pub type Status {
  Ok
  Error(String)
}

// Pattern matching with custom types
pub fn check_status(status: Status) -> String {
  case status {
    Ok -> "All good!"
    Error(message) -> "Something went wrong: " ++ message
  }
}

// 3. Functions and Pattern Matching
pub fn add(a: Int, b: Int) -> Int {
  a + b
}

// Recursive function to calculate factorial
pub fn factorial(n: Int) -> Int {
  case n {
    0 -> 1
    _ -> n * factorial(n - 1)
  }
}

// 4. Tuples
pub fn get_user_info() -> #(String, Int) {
  #("Gleam_User", 100)
}

// Pattern matching with tuples
pub fn show_user_info() -> String {
  let #(name, score) = get_user_info()
  name ++ " has a score of " ++ Int.to_string(score)
}

// 5. Lists and Iteration
pub fn double_numbers(numbers: List(Int)) -> List(Int) {
  numbers |> List.map(fn(num) { num * 2 })
}

// Using pattern matching on lists
pub fn sum_list(numbers: List(Int)) -> Int {
  case numbers {
    [] -> 0
    [head | tail] -> head + sum_list(tail)
  }
}

// 6. Concurrency (using Erlang's process model)
import gleam/otp

pub fn start_worker() {
  let pid = otp.spawn(fn(_) {
    io.print("Worker process running")
  })

  otp.send(pid, "Hello, worker!")
}

// Handling messages in a process (actor-based model)
pub fn process_messages() {
  let pid = otp.spawn(fn(state) {
    case otp.receive() {
      "Hello, worker!" -> io.print("Worker received a message")
      _ -> io.print("Unknown message")
    }
  })

  otp.send(pid, "Hello, worker!")
}

// 7. Error Handling with Result
pub fn divide(a: Float, b: Float) -> Result(Float, String) {
  if b == 0.0 {
    Error("Cannot divide by zero!")
  } else {
    Ok(a / b)
  }
}

// Using the divide function with pattern matching
pub fn safe_divide(a: Float, b: Float) -> String {
  case divide(a, b) {
    Ok(result) -> "Result: " ++ Float.to_string(result)
    Error(message) -> "Error: " ++ message
  }
}

// 8. Records (Structs)
pub type User {
  User {
    name: String,
    age: Int,
    email: String,
  }
}

// Using records
pub fn create_user() -> User {
  User {
    name: "Alice".to_string(),
    age: 30,
    email: "alice@example.com".to_string(),
  }
}

// Accessing record fields
pub fn show_user(user: User) -> String {
  user.name ++ " is " ++ Int.to_string(user.age) ++ " years old."
}
