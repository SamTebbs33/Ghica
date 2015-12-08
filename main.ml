exception Error of string
let a = Grammar.top Lexer.read (Lexing.from_channel stdin);;
List.for_all (fun x -> Ast.exec_stmt x; true) a;;
