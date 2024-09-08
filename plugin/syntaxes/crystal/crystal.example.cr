# 1. Simple Hello World
puts "Hello, Crystal!"

# 2. Variables and Types
name = "Alice"       # String
age = 30             # Integer
height = 5.7_f32     # Float (32-bit)
is_student = true    # Boolean

# Type annotations can also be added explicitly:
name : String = "Bob"

# 3. Constants
PI = 3.14159

# 4. Arrays and Hashes
numbers = [1, 2, 3, 4]               # Array of integers
people = {"Alice" => 30, "Bob" => 25} # Hash (Dictionary)

# 5. Methods and Return Types
def greet(name : String) : String
  "Hello, #{name}!"
end

puts greet("Crystal")  # Calls the method

# 6. Control Flow and Conditionals
def check_age(age : Int32) : String
  if age < 18
    "Underage"
  elsif age >= 18 && age < 60
    "Adult"
  else
    "Senior"
  end
end

puts check_age(30)

# 7. Loops
# Basic 'for' loop
for i in 0..5
  puts i
end

# 'each' method on arrays
numbers.each do |num|
  puts num * 2
end

# 8. Exception Handling
def safe_divide(a : Int32, b : Int32) : Int32
  begin
    a / b
  rescue DivisionByZero
    puts "Error: Division by zero"
    0
  end
end

puts safe_divide(10, 2)
puts safe_divide(10, 0)

# 9. Classes and Objects
class Person
  property name : String
  property age : Int32

  def initialize(name : String, age : Int32)
    @name = name
    @age = age
  end

  def introduce : String
    "My name is #{@name} and I am #{@age} years old."
  end
end

alice = Person.new("Alice", 30)
puts alice.introduce

# 10. Structs
struct Point
  x : Int32
  y : Int32

  def initialize(x : Int32, y : Int32)
    @x = x
    @y = y
  end
end

point = Point.new(10, 20)
puts "Point: #{point.x}, #{point.y}"

# 11. Enums
enum Color
  Red
  Green
  Blue
end

color = Color::Red
puts color

# 12. Macros (for metaprogramming)
macro say_hello(name)
  puts "Hello, #{name}!"
end

say_hello "Crystal"

# 13. Fibers and Concurrency (using `spawn`)
def background_task
  5.times do |i|
    puts "Running task #{i}"
    sleep 1
  end
end

spawn background_task
puts "Main thread continues"
sleep 6  # Give time for the fiber to complete
