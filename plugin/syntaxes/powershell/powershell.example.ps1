# Function to greet the user
function Greet-User {
    param(
        [string]$name
    )
    Write-Host "Hello, $name!"
}

# Variables
$number1 = 5
$number2 = 10

# Arithmetic operations
$sum = $number1 + $number2
$product = $number1 * $number2

# Display results
Write-Host "Sum: $sum"
Write-Host "Product: $product"

# Conditional statement
$temperature = 28
if ($temperature -gt 25) {
    Write-Host "It's a warm day!"
} else {
    Write-Host "It's a moderate or cool day."
}

# Calling the function
Greet-User -name "John"
