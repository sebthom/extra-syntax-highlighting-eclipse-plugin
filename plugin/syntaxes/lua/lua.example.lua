-- Function definition
function greet(name)
    print("Hello, " .. name .. "!")
end

-- Table example
local fruits = {"Apple", "Banana", "Orange"}

-- Loop through the table
print("Fruits:")
for i, fruit in ipairs(fruits) do
    print(i, fruit)
end

-- Conditional statement
local temperature = 25
if temperature > 30 then
    print("It's hot outside!")
elseif temperature > 20 then
    print("The weather is pleasant.")
else
    print("It's a bit chilly.")
end

-- Calling the function
greet("Alice")
