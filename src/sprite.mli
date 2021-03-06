type t
type sheet

val dummy_sheet : sheet

val dummy : t

val make_sheet : image:string -> frames:int -> dt:int -> origin:int * int
  -> sheet

val make: sheet -> t

val sheet : t -> sheet

val sheet_dims : sheet -> int * int

val frame_dims : sheet -> int * int

val origin : sheet -> int * int

val advance : int -> t -> t

val draw : View.t -> int * int -> t -> unit