// Local variables
local greeting = "Hello";
local name = "World";

// Top-level function
local add(x, y) = x + y;

// Top-level object
{
  // Basic data types
  string: greeting + " " + name + "!",
  integer: 42,
  float: 3.14,
  boolean: true,

  // Arrays
  array: [1, 2, 3, 4],

  // Objects and Nested Objects
  nestedObject: {
    nestedKey: "nestedValue",
    innerObject: {
      innerKey: "innerValue",
    },
  },

  // Conditional Expressions
  conditionalExample: if 5 > 3 then "Five is greater than three" else "Three is greater",

  // Functions
  addExample: add(3, 5),

  // Self-Referencing Objects
  selfReferencing: {
    foo: "foo value",
    bar: self.foo + " and bar value",
  },

  // Array Comprehension
  squares: [x * x for x in std.range(1, 5)],

  // Object Comprehension
  alphabet: { ["letter_" + c]: c for c in "abcdefg" },

  // Imports
  importedFile: import "anotherFile.jsonnet",

  // Mixins (Object Union)
  combinedObject: { a: 1, b: 2 } + { b: 3, c: 4 }, // Result: { a: 1, b: 3, c: 4 }

  // Templating Functions
  greet(name) +:: name + "!",

  // Error handling
  errorExample: error "This is an example error!",

  // External Variables
  externalVar: std.extVar("exampleVar"),

  // Slicing Arrays
  sliceExample: [1, 2, 3, 4, 5][:3], // Result: [1, 2, 3]

  // Accessing Environment Variables (For CLI use)
  envExample: std.getenv("HOME"),

  // Formatting Strings
  formattedString: std.format("Hello, my name is %s and I'm %d years old", ["Alice", 25]),

  // Merge Functions
  mergedObjects: std.mergePatch({name: "Alice", age: 30}, {age: 35, city: "Berlin"}),

  // Manipulating JSON Data
  jsonExample: std.parseJson('{"key": "value"}'),

  // Secret Filtering (ideal for filtering out sensitive information)
  filteredSecret: std.manifestJsonEx({password: "secret"}, "filtered"),
}
