type t =
  | Print of string
  | Focus

type 's chain

val nop : 's chain

val get_cmds : ?cmds:t list -> 's chain -> t list
val get_state : 's chain -> 's option
val get_body : 's chain -> Body.t option

val ( >> ) : 's chain -> 's chain -> 's chain

val set_state : 's -> 's chain
val set_body : Body.t -> 's chain
val set : 's -> Body.t -> 's chain

val print : string -> 's chain
val focus : 's chain