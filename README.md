# Ghica
The Ghica programming language.
![](img.jpg)

## Running Ghica
If you use Mac OS X, then you can use the `main.native` file to run the compiler (if you can even call it that). Run the file with the file path after a '<' symbol.
```
./main.native < file_path.ghica
```

If you're runing on some other system, then you will need to compile the compiler.
```
ocamlbuild main.native
```
Then follow the above instructions.

## Declaring variables
The code snippet below declares the variable `a` and assigns it the value `1337`
```
what_we_have_to_be a 1337
```

## Printing
An expression/variable can be printed
```
put_at_ease a
```
where `a` is the expression to print.

## Expressions
A valid expression is an integer, or boolean value. The boolean value false is encoded as `java` (as java is the false programming language) and the boolean value of true is encoded as `ocaml` (as OCaml is the one true programming language).
```
put_at_ease java
```

Arithmetic expressions are also accepted
```
1+1
2*5
4/2
10-7
```
If you attempt to use a variable that has not been declared, you will be shown a friendly and easy to understand error message.

## Assignment
Variables can be reassigned (I know this breaks immuability which is the one true way of programming, but sometimes you have to be mainstream and impure)
```
a = 100
```
