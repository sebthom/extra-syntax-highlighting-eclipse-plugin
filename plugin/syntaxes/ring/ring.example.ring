load "stdlib.ring"  // Import standard library

// Global variables
var1 = 10
var2 = "Ring Language"

// Print a welcome message
see "Welcome to the Ring Programming Language!" + nl

// Conditional Statements
see "Checking conditions:" + nl
if var1 > 5
    see "var1 is greater than 5" + nl
else
    see "var1 is less than or equal to 5" + nl
ok

// Loops - For loop
see "Using a for loop:" + nl
for x = 1 to 5
    see "Iteration " + x + nl
next

// While loop
see "Using a while loop:" + nl
x = 1
while x <= 5
    see "While iteration " + x + nl
    x += 1
ok

// Functions
see "Demonstrating functions:" + nl
func greet(name)
    see "Hello, " + name + "!" + nl
ok

greet("Alice")

// Function with return value
func add(a, b)
    return a + b
ok

sum = add(10, 20)
see "10 + 20 = " + sum + nl

// Object-Oriented Programming
see "Demonstrating OOP:" + nl

class Person
    private name
    private age

    func init(name, age)
        me.name = name
        me.age = age
    ok

    func greet()
        see "Hello, my name is " + me.name + " and I am " + me.age + " years old." + nl
    ok
end

person1 = new Person("John", 30)
person1.greet()

// Working with lists
see "Working with lists:" + nl
mylist = [1, 2, 3, 4, 5]
see "List: " + mylist + nl

// Adding to a list
mylist + 6
see "List after adding 6: " + mylist + nl

// Iterating over a list
for item in mylist
    see "Item: " + item + nl
next

// File I/O
see "Demonstrating File I/O:" + nl

file = open("example.txt", "w")
file.write("This is an example file.\n")
file.close()

// Reading from a file
file = open("example.txt", "r")
text = file.read()
see "File contents: " + text + nl
file.close()

// Exception handling
see "Demonstrating exception handling:" + nl

func divide(a, b)
    if b == 0
        raise "Cannot divide by zero!"
    else
        return a / b
    ok
ok

try
    result = divide(10, 0)
    see "Result: " + result + nl
catch e
    see "Error: " + e + nl
ok

see "End of the Ring Language example." + nl
