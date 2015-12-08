%token <int> INT
%token <string> ID
%token PRINT DECLARE EOF
%token ADD SUB MUL DIV
%token TRUE FALSE

%start top
%type <Ast.statement list> top
%type <Ast.statement> statement

%%
top:
    | statement { $1 :: [] }
    | statement top { $1 :: $2 }
    ;

statement:
    | PRINT; expr { Ast.Print $2 }
    | DECLARE; ID; expr { Ast.Declare ($2, $3) }
    ;

expr:
    | expr; ADD; expr { Ast.Add ($1, $3) }
    | expr; SUB; expr { Ast.Sub ($1, $3) }
    | expr; MUL; expr { Ast.Mul ($1, $3) }
    | expr; DIV; expr { Ast.Div ($1, $3) }
    | TRUE { Ast.Int 1 }
    | FALSE { Ast.Int 0 }
    | ID { Ast.Var $1 }
    | INT { Ast.Int $1 }
    ;
