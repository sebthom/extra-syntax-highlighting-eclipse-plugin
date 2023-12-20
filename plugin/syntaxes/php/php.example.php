<?php
// Example.php

// Function to greet the user
function greetUser($name) {
    echo "Hello, $name!\n";
}

// Variables
$number1 = 5;
$number2 = 10;

// Arithmetic operations
$sum = $number1 + $number2;
$product = $number1 * $number2;

// Display results
echo "Sum: $sum\n";
echo "Product: $product\n";

// Conditional statement
$temperature = 28;
if ($temperature > 25) {
    echo "It's a warm day!\n";
} else {
    echo "It's a moderate or cool day.\n";
}

// Calling the function
greetUser("John");
?>
