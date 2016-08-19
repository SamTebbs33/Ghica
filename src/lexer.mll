{
open Lexing
open Grammar
}

let int = ['0'-'9']+
let bool_true = "ocaml"
let bool_false = "java"
let id = ['a' - 'z']+
let white = [' ' '\t']+
let print = "put_at_ease"
let declare = "what_we_have_to_be"
let newline = '\n'
let add = '+'
let sub = '-'
let mul = '*'
let div = '/'
let equals = '='

rule read = 
    parse
    | newline { read lexbuf }
    | white { read lexbuf }
    | declare { DECLARE }
    | print { PRINT }
    | bool_true { TRUE }
    | bool_false { FALSE }
    | equals { EQUALS }
    | id { ID (Lexing.lexeme lexbuf) }
    | int { INT (int_of_string (Lexing.lexeme lexbuf)) }
    | add { ADD }
    | sub { SUB }
    | mul { MUL }
    | div { DIV }
    | eof { EOF }
