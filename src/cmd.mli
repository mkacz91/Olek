open Core.Std

type t =
  | Message of Sexp.t * Env.handle
  | Spawn of string option * string * (int * int) * Sexp.t
  | Remove of Env.handle
  | RemoveMe
  | AlterContext of (Context.t -> Context.t)
  | SetRoom of string
  | Print of string
  | Focus
  | Save
  | Quit

type 's chain

val nop : 's chain

val get_cmds : ?cmds:t list -> 's chain -> t list
val get_state : 's chain -> 's option
val get_body : 's chain -> Body.t option

val ( >> ) : 's chain -> 's chain -> 's chain

val set_state : 's -> 's chain
val set_body : Body.t -> 's chain
val set : 's -> Body.t -> 's chain

val send : Sexp.t -> Env.handle -> 's chain
val spawn : ?name:string
         -> ?pos:float * float
         -> ?init:Sexp.t
         -> string
         -> 's chain
val remove : Env.handle -> 's chain
val remove_me : 's chain
val alter_context : (Context.t -> Context.t) -> 's chain
val set_room : string -> 's chain
val print : string -> 's chain
val focus : 's chain
val save : 's chain
val quit : 's chain