type token =
  | INT of (int)
  | ID of (string)
  | PRINT
  | DECLARE
  | EOF
  | ADD
  | SUB
  | MUL
  | DIV
  | EQUALS
  | TRUE
  | FALSE

val top :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.statement list
