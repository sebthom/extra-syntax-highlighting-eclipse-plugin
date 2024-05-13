const std = @import("std");

pub fn main() !void {
    // Declarations
    const name: []const u8 = "Zig";
    var age: u8 = 5;

    // Print statements
    std.debug.print("Hello, {}!\n", .{name});
    std.debug.print("I am {} years old.\n", .{age});

    // Control flow
    if (age >= 18) {
        std.debug.print("I am an adult.\n");
    } else {
        std.debug.print("I am still a child.\n");
    }

    // Looping
    var i: u8 = 0;
    while (i < 5) : (i += 1) {
        std.debug.print("Counting: {}\n", .{i});
    }

    // Function definition
    fn add(x: i32, y: i32) i32 {
        return x + y;
    }

    // Function call
    const sum = add(3, 5);
    std.debug.print("The sum is: {}\n", .{sum});

    // Error handling
    const result = divide(10, 0);
    try std.debug.print("Result: {}\n", .{result});
    catch |err| {
        std.debug.print("Error: {}\n", .{err});
    }
}

fn divide(x: i32, y: i32) !i32 {
    if (y == 0) {
        return std.zig.err.InvalidInteger("Division by zero");
    }
    return x / y;
}
