import ballerina/io;
import ballerina/config;

// 1. Define configurable variables
configurable string serverHost = ?;
configurable int serverPort = 8080;
configurable float taxRate = 0.15;
configurable boolean debugMode = false;

// 2. Main function
public function main() {
    io:println("Starting server on ", serverHost, ":", serverPort);

    // 3. Accessing configurable values
    io:println("Tax Rate: ", taxRate);
    if (debugMode) {
        io:println("Debug Mode is ON");
    } else {
        io:println("Debug Mode is OFF");
    }

    // 4. Variables and types
    int age = 30;
    string name = "Alice";
    float salary = 75000.50;
    boolean isEmployed = true;

    io:println("Name: ", name, ", Age: ", age, ", Employed: ", isEmployed);

    // 5. Function call
    float result = add(10.5, 20.5);
    io:println("Sum: ", result);

    // 6. Conditional statements
    if age > 18 {
        io:println(name, " is an adult.");
    } else {
        io:println(name, " is a minor.");
    }

    // 7. Error handling
    var output = performDivision(10, 0);
    if (output is error) {
        io:println("Error occurred: ", output);
    } else {
        io:println("Division result: ", output);
    }

    // 8. Concurrency: executing tasks in parallel
    future<int> futureVal1 = start calc(10);
    future<int> futureVal2 = start calc(20);

    int val1 = wait futureVal1;
    int val2 = wait futureVal2;

    io:println("Parallel task results: ", val1, " and ", val2);
}

// 9. Function with parameters and return type
function add(float a, float b) returns float {
    return a + b;
}

// 10. Error handling with `trap`
function performDivision(int a, int b) returns int|error {
    return trap a / b;
}

// 11. Simple concurrent function
function calc(int x) returns int {
    int sum = 0;
    foreach int i in 1...x {
        sum += i;
    }
    return sum;
}

// 12. Record (equivalent to a JSON object)
type Employee record {
    string name;
    int age;
    float salary;
};

public function employeeExample() {
    Employee emp = {name: "John Doe", age: 28, salary: 50000.0};
    io:println("Employee details: ", emp);
}
