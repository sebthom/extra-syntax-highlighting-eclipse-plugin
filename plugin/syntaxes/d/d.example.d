import std.stdio;
import std.algorithm;
import std.range;
import std.array;
import std.parallelism;
import std.datetime;
import std.conv;

// ---------------------------
// 1. Compile-Time Computation (CTFE)
// ---------------------------
enum fib10 = fib(10); // evaluated at compile time

int fib(int n) {
    return n <= 1 ? n : fib(n - 1) + fib(n - 2);
}

// ---------------------------
// 2. Templates + Constraints
// ---------------------------
T addIfNumeric(T)(T a, T b)
if (isNumeric!T) {
    return a + b;
}

// ---------------------------
// 3. Struct with @safe + methods
// ---------------------------
@safe struct Point {
    double x, y;

    double length() const {
        import std.math : sqrt;
        return sqrt(x * x + y * y);
    }
}

// ---------------------------
// 4. Mixins (code generation)
// ---------------------------
mixin template DebugPrint(T) {
    void debugPrint() const {
        writeln("Debug: ", this);
    }
}

struct User {
    string name;
    int age;

    mixin DebugPrint!User;
}

// ---------------------------
// 5. UFCS + Ranges + Functional style
// ---------------------------
void processData() {
    auto result =
        iota(1, 10)                // range [1..9]
        .map!(x => x * x)         // square
        .filter!(x => x % 2 == 0) // even
        .array;                   // materialize

    writeln("Processed: ", result);
}

// ---------------------------
// 6. Parallelism
// ---------------------------
void parallelExample() {
    auto data = iota(1, 1_000_000).array;

    // Parallel map
    auto squared = taskPool.parallel(data)
        .map!(x => x * x)
        .array;

    writeln("Parallel sum: ", squared.sum);
}

// ---------------------------
// 7. Classes + OOP
// ---------------------------
class Animal {
    void speak() {
        writeln("Some sound");
    }
}

class Dog : Animal {
    override void speak() {
        writeln("Woof");
    }
}

// ---------------------------
// 8. main()
// ---------------------------
void main() {
    writeln("CTFE fib(10): ", fib10);

    // Type inference + templates
    auto sum = addIfNumeric(3, 4);
    writeln("Sum: ", sum);

    // Struct usage
    Point p = Point(3, 4);
    writeln("Length: ", p.length());

    // Mixins
    User u = User("Alice", 30);
    u.debugPrint();

    // Functional pipelines
    processData();

    // Parallel computation
    parallelExample();

    // OOP
    Animal a = new Dog();
    a.speak();

    // UFCS example
    auto text = 123.to!string().writeln; // chaining
}
