let vars = ref [];;
let get_val (x : string) = 
    let rec get_val' (l : (string * int) list) = match l with
        | [] -> failwith "uh oh"
        | (a, b) :: tl when a = x -> b
        | _ :: tl -> get_val' tl
    in get_val' !vars
;;
let set_val (x : string) (v : int) = 
    let rec set_val' = function
        | [] -> (x, v) :: []
        | (a, _) :: tl when a = x -> (a, v) :: tl
        | hd :: tl -> hd :: (set_val' tl)
    in vars := set_val' !vars;
;;
