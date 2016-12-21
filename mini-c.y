%{
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *);
int yylex(void);
%}
%token identifier
%token number
%token INT FLOAT
%token FOR WHILE
%token IF ELSE
%token eq le ge ne lt gt
%right '='
%right then ELSE

%%
Function : Type identifier '(' ArgList ')' CompoundStmt
         ;

ArgList : Arg
        | ArgList ',' Arg
        ;

Arg : Type identifier
    ;

Declaration  : Type IdentList ';'

Type : INT
     | FLOAT
     ;

IdentList : identifier ',' IdentList
          | identifier
          ;

Stmt : ForStmt
      | WhileStmt
      | Expr ';'
      | IfStmt
      | CompoundStmt
      | Declaration
      | ';'
      ;

ForStmt :  FOR '(' Expr ';' OptExpr ';' OptExpr  ')' Stmt
OptExpr  : Expr
          |
          ;

WhileStmt : WHILE '(' Expr  ')' Stmt
          ;

IfStmt : IF '(' Expr ')' Stmt %prec then
       | IF '(' Expr ')' Stmt ELSE Stmt
       ;


CompoundStmt : '{' StmtList  '}'
             ;


StmtList : StmtList Stmt
         |
         ;

Expr : identifier '=' Expr
     | Rvalue
     ;

Rvalue : Rvalue Compare Mag
       | Mag
       ;

Compare : eq
        | lt
        | gt
        | le
        | ge
        | ne
        ;

Mag : Mag '+' Term
    | Mag '-' Term
    | Term
    ;

Term : Term '*' Factor
     | Term '/' Factor
     | Factor
     ;

Factor : '(' Expr  ')'
       | '-' Factor
       | '+' Factor
       | identifier
       | number
       ;
%%
main(){
  yyparse();

}
void yyerror(char *s) {
    printf("%s\n", s);

}

