exception Error of string
let a = Grammar.top Lexer.read (Lexing.from_string (Sys.argv.(1) ^ "\n"));;
List.for_all (fun x -> Ast.exec_stmt x; true) a;;
