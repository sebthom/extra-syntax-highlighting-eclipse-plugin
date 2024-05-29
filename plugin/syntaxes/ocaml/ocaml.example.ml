(* OCaml Sample File *)

(* Variable Declaration *)
let x = 10
let y = 20

(* Function Definition *)
let add a b = a + b

(* Pattern Matching *)
let rec factorial n =
  match n with
  | 0 -> 1
  | _ -> n * factorial (n - 1)

(* Recursive Function *)
let rec fibonacci n =
  match n with
  | 0 -> 0
  | 1 -> 1
  | _ -> fibonacci (n - 1) + fibonacci (n - 2)

(* Records *)
type point = { x_coord : float; y_coord : float }

(* Record Construction *)
let origin = { x_coord = 0.0; y_coord = 0.0 }

(* List *)
let numbers = [1; 2; 3; 4; 5]

(* List Operations *)
let sum_of_list = List.fold_left (fun acc x -> acc + x) 0 numbers

(* Array *)
let names = [| "Alice"; "Bob"; "Charlie" |]

(* Array Operations *)
let second_name = names.(1)

(* Exception Handling *)
let safe_divide a b =
  try
    Some (a / b)
  with
  | Division_by_zero -> None

(* Module *)
module Math = struct
  let pi = 3.14159

  let square x = x * x
end

(* Module Usage *)
let area_of_circle r = Math.pi *. Math.square r

(* Higher Order Functions *)
let apply_twice f x = f (f x)

(* Anonymous Functions *)
let square_all = List.map (fun x -> x * x) numbers

(* Unit Type *)
let print_hello () = print_endline "Hello, OCaml!"

(* Imperative Features *)
let sum_up_to n =
  let result = ref 0 in
  for i = 1 to n do
    result := !result + i
  done;
  !result

(* Printing Results *)
let () =
  print_endline ("x + y = " ^ string_of_int (add x y));
  print_endline ("Factorial of 5 = " ^ string_of_int (factorial 5));
  print_endline ("Fibonacci of 6 = " ^ string_of_int (fibonacci 6));
  print_endline ("Origin: (" ^ string_of_float origin.x_coord ^ ", " ^ string_of_float origin.y_coord ^ ")");
  print_endline ("Sum of List = " ^ string_of_int sum_of_list);
  print_endline ("Second Name = " ^ second_name);
  print_endline ("Area of Circle with radius 5 = " ^ string_of_float (area_of_circle 5.0));
  print_endline ("Apply square twice on 3 = " ^ string_of_int (apply_twice Math.square 3));
  print_endline ("Square of all numbers: " ^ String.concat ", " (List.map string_of_int square_all));
  print_hello ();
  print_endline ("Sum up to 10 = " ^ string_of_int (sum_up_to 10))
