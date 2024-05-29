/* Comments */
/* This is a comment */

/* Variables */
let x = 10;
let y: int = 20;

/* Constants */
let PI = 3.14;

/* Functions */
let add = (a, b) => a + b;

/* Type Annotations */
let add: (int, int) => int = (a, b) => a + b;

/* Pattern Matching */
let rec factorial = (n) =>
  switch (n) {
  | 0 => 1
  | _ => n * factorial(n - 1)
  };

/* Records */
type person = {
  name: string,
  age: int,
};

let john = {name: "John", age: 30};

/* Arrays */
let numbers = [|1, 2, 3, 4, 5|];

/* Lists */
let fruits = ["apple", "banana", "orange"];

/* Option Types */
let find = (arr, target) =>
  switch (Array.find(x => x == target, arr)) {
  | Some(x) => "Found"
  | None => "Not found"
  };

/* Modules */
module Math = {
  let add = (a, b) => a + b;
  let subtract = (a, b) => a - b;
};

/* Polymorphic Functions */
let identity = (x) => x;

/* Error Handling */
let divide = (a, b) =>
  switch (b) {
  | 0 => Error("Division by zero")
  | _ => Ok(a / b)
  };

/* JSX */
let element = <div>Hello, World!</div>;

/* Promises */
let fetchData = () =>
  Js.Promise.(
    new Promise((resolve, _) => {
      Js.Global.setTimeout(() => resolve("Data loaded"), 1000);
    })
  );

/* Async/Await */
let printData = async () => {
  let data = await fetchData();
  Js.log(data);
};

/* Type Aliases */
type point = (int, int);

/* Variants */
type color =
  | Red
  | Green
  | Blue;

/* GADTs (Generalized Algebraic Data Types) */
type expr<'a> =
  | Value('a)
  | Add(expr<'a>, expr<'a>)
  | Mul(expr<'a>, expr<'a>);

/* Module System */
module MyModule = {
  type t = int;
  let x = 42;
  let f = (x) => x + 1;
};

/* Interfaces */
type printable = {
  stringify: unit => string,
};

module MyModule2 = {
  let makePrintable = (data) => {
    let stringify = () => string_of_int(data);
    {stringify};
  };
};
