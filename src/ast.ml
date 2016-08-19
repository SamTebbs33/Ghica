type expr = 
    | Var of string
    | Int of int
    | Add of (expr * expr)
    | Sub of (expr * expr)
    | Mul of (expr * expr)
    | Div of (expr * expr)
;;
type statement = 
    | Declare of (string * expr)
    | Assign of (string * expr)
    | Print of expr
;;
let rec eval_expr = function
    | Var i -> Env.get_val i
    | Int i -> i
    | Add (e, e2) -> (eval_expr e) + (eval_expr e2)
    | Sub (e, e2) -> (eval_expr e) - (eval_expr e2)
    | Mul (e, e2) -> (eval_expr e) * (eval_expr e2)
    | Div (e, e2) -> (eval_expr e) / (eval_expr e2)
;;
let rec eval_stmt = function
    | Declare (x, y) -> Env.set_val x (eval_expr y)
    | Print x -> print_string (string_of_int (eval_expr x))
    | Assign (x, y) -> Env.set_val x (eval_expr y)
;;
let rec str_of_expr = function
    | Var i -> "( Var " ^ i ^ " )"
    | Int i -> "( Int " ^ (string_of_int i) ^ " )"
    | Add (e, e2) -> "( Add " ^ (str_of_expr e) ^ " and " ^ (str_of_expr e2) ^ " )"
    | Sub (e, e2) -> "( Sub " ^ (str_of_expr e) ^ " and " ^ (str_of_expr e2) ^ " )"
    | Mul (e, e2) -> "( Mul " ^ (str_of_expr e) ^ " and " ^ (str_of_expr e2) ^ " )"
    | Div (e, e2) -> "( Div " ^ (str_of_expr e) ^ " and " ^ (str_of_expr e2) ^ " )"
;;
let rec str_of_stmt = function
    | Declare (x, y) -> "( Declare " ^ x ^ " to " ^ (str_of_expr y) ^ " )"
    | Assign (x, y) -> "( Assign " ^ x ^ " to " ^ (str_of_expr y) ^ " )"
    | Print x -> "( Print " ^ (str_of_expr x) ^ " )"
;;
let rec str_of_stmts = function
    | [] -> ""
    | hd :: tl -> (str_of_stmt hd) ^ "\n" ^ (str_of_stmts tl)
;;
let exec_stmt = function
    | Declare (x, y) -> Env.set_val x (eval_expr y)
    | Assign (x, y) -> Env.set_val x (eval_expr y)
    | Print x -> print_endline (string_of_int (eval_expr x) )
;;
