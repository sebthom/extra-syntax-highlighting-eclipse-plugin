(* This is an example OCaml interface file *)

(** Module representing a simple stack data structure *)
module type Stack = sig
  (** Type of elements stored in the stack *)
  type 'a t

  (** [empty ()] creates an empty stack *)
  val empty : unit -> 'a t

  (** [is_empty s] checks if the stack [s] is empty *)
  val is_empty : 'a t -> bool

  (** [push x s] pushes element [x] onto stack [s] *)
  val push : 'a -> 'a t -> 'a t

  (** [pop s] removes and returns the top element of stack [s] *)
  val pop : 'a t -> 'a option

  (** [top s] returns the top element of stack [s] without removing it *)
  val top : 'a t -> 'a option

  (** [size s] returns the number of elements in stack [s] *)
  val size : 'a t -> int
end
