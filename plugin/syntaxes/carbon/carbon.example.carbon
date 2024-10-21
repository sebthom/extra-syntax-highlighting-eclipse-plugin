// Import statement for using external packages
import Math;

// 1. Variables and Constants
fn main() -> i32 {
  // Variable declaration
  var counter: i32 = 0;

  // Constant declaration
  let pi: f64 = 3.14159;

  // Variable reassignment
  counter = 10;

  // 2. Functions and Return Types
  var result: (i32, bool) = SmallestFactor(15);
  if (result[1]) {
    Print("15 is prime.");
  } else {
    Print("Smallest factor of 15: {0}", result[0]);
  }

  // 3. Loops and Control Flow
  for (var i: i32 in 0..counter) {
    if (i % 2 == 0) {
      Print("Even: {0}", i);
    } else {
      continue;  // Skips to the next iteration
    }
  }
  return 0;
}

// 4. Function Definition with Return Types
fn SmallestFactor(n: i32) -> (i32, bool) {
  let limit: i32 = Math.Sqrt(n) as i32;
  var i: i32 = 2;

  while (i <= limit) {
    if (n % i == 0) {
      return (i, false);
    }
    if (i == 2) {
      i = 3;
    } else {
      i += 2;  // Skip even numbers
    }
  }
  return (n, true);  // n is prime
}

// 5. Generics Example
template<T:! Comparable>
fn max(a: T, b: T) -> T {
  if (a > b) {
    return a;
  } else {
    return b;
  }
}

// 6. Class Definition with Methods
class Circle {
  var radius: f64;

  // Constructor
  fn init(radius: f64) {
    this.radius = radius;
  }

  // Method to calculate area
  fn Area(self) -> f64 {
    return pi * this.radius * this.radius;
  }
}

// 7. Pattern Matching (Provisional)
fn classify_num(n: i32) {
  match (n) {
    case 0: Print("Zero");
    case 1..10: Print("Single digit number");
    case _: Print("Other number");
  }
}
