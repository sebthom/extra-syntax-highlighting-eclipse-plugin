#!/usr/bin/env fish
# example.fish
# An example Fish script demonstrating various language features

# ====================================================
# 1. Variables and Data Types
# ====================================================

# Assigning variables (no need for 'export' unless needed globally)
set name "Alice"
set age 30
set is_student true

# Display variable values
echo "Name: $name"
echo "Age: $age"
echo "Is Student: $is_student"

# ====================================================
# 2. Functions
# ====================================================

# Define a simple function to greet
function greet
    echo "Hello, $name! Welcome to Fish Shell."
end

# Call the function
greet

# Function with parameters
function add_numbers
    set -l a $argv[1]
    set -l b $argv[2]
    set -l sum (math "$a + $b")
    echo "Sum of $a and $b is $sum"
end

# Call the function with arguments
add_numbers 5 7

# ====================================================
# 3. Control Structures
# ====================================================

# 3.a. If-Else Statement
if test $age -ge 18
    echo "$name is an adult."
else
    echo "$name is a minor."
end

# 3.b. Switch Statement
switch $is_student
    case true
        echo "$name is currently a student."
    case false
        echo "$name is not a student."
    case '*'
        echo "Unknown student status."
end

# ====================================================
# 4. Loops
# ====================================================

# 4.a. For Loop
echo "\n=== For Loop Example ==="
for i in 1 2 3 4 5
    echo "Iteration $i"
end

# 4.b. While Loop
echo "\n=== While Loop Example ==="
set count 1
while test $count -le 3
    echo "Count is $count"
    set count (math "$count + 1")
end

# ====================================================
# 5. Arrays and Lists
# ====================================================

# Define an array of fruits
set fruits "Apple" "Banana" "Cherry" "Date"

# Iterate over the array
echo "\n=== Fruits List ==="
for fruit in $fruits
    echo "I like $fruit."
end

# Accessing array elements
echo "\nSecond fruit in the list: $fruits[2]"

# ====================================================
# 6. String Manipulation
# ====================================================

# Concatenation
set greeting "Hello"
set full_greeting "$greeting, $name!"
echo "\nGreeting: $full_greeting"

# Substrings
set substring (string sub $full_greeting 1 5)
echo "Substring (first 5 chars): $substring"

# Replace
set modified_greeting (string replace "Alice" "Bob" $full_greeting)
echo "Modified Greeting: $modified_greeting"

# ====================================================
# 7. Command Substitution
# ====================================================

# Get current directory
set current_dir (pwd)
echo "\nCurrent Directory: $current_dir"

# List files and count them
set file_list (ls)
set file_count (count $file_list)
echo "Number of files in $current_dir: $file_count"

# ====================================================
# 8. Error Handling
# ====================================================

# Attempt to create a directory that already exists
echo "\n=== Error Handling Example ==="
mkdir existing_dir 2>/dev/null
if mkdir existing_dir
    echo "Directory 'existing_dir' created successfully."
else
    echo "Failed to create 'existing_dir'. It may already exist."
end

# ====================================================
# 9. Scripting Best Practices
# ====================================================

# Using 'set -lx' to export variables if needed
# set -lx PATH /usr/local/bin $PATH

# Using comments to explain code
# Functions should be named descriptively
# Keep scripts modular by using functions

# End of script
