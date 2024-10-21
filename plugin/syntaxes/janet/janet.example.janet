# Janet Example File Demonstrating Major Features

# 1. Variables
(def x 10)
(def name "Janet")
(def pi 3.14159)

# 2. Functions
(defn add [a b]
  (+ a b))

(print "Addition result: " (add 10 20))  # Output: 30

# 3. Conditionals
(defn check-age [age]
  (if (> age 18)
    (print "Adult")
    (print "Minor")))

(check-age 20)  # Output: Adult

# 4. Loops
(def items [1 2 3 4 5])

# for loop
(each item items
  (print "Item: " item))

# while loop
(var i 0)
(while (< i 5)
  (print "i is " i)
  (++ i))

# 5. Error Handling (try/catch)
(defn divide [a b]
  (try
    (/ a b)
  (catch e
    (print "Error: Division by zero"))))

(divide 10 0)  # Output: Error: Division by zero

# 6. Data Structures

# Arrays
(def arr [1 2 3 4])
(print "Array: " arr)

# Tables (similar to hash maps or dictionaries)
(def table {:name "Janet" :age 3})
(print "Table: " table)
(print "Name: " (get table :name))

# Structs (immutable tables)
(def s (struct {:name "Immutable Janet" :age 1}))
(print "Struct: " s)

# Buffers (mutable byte arrays)
(def buf (buffer))
(buffer-push buf 97)  # Push ASCII 'a'
(print "Buffer: " buf)

# 7. Macros (code generation)
(defmacro unless [cond body]
  `(if (not ,cond)
     ,body))

(unless false
  (print "This will print because condition is false"))

# 8. Modules and Importing
# Importing other files or libraries is done with the `use` keyword.

(use ./my_module)

# 9. Coroutines (asynchronous programming)
(defn count-up []
  (for i 1 5
    (print "Count: " i)
    (yield)))

# Create a coroutine
(var counter (coroutine count-up))

# Resume the coroutine
(counter)
(counter)

# 10. Symbols and Keywords
(def sym 'symbol-name)
(def kw :keyword-name)
(print "Symbol: " sym)
(print "Keyword: " kw)
