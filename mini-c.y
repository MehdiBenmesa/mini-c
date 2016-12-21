%{
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
%}
%token identifier
%token number
%token int float
%token for while
%token if else
%token eq le ge ne lt gt
%right '='
%right then else

%%
Function : Type identifier '(' ArgList ')' CompoundStmt
         ;

ArgList : Arg
        | ArgList ',' Arg
        ;

Arg : Type identifier
    ;

Declaration  : Type IdentList ';'

Type : int
     | float
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

ForStmt :  for '(' Expr ';' OptExpr ';' OptExpr  ')' Stmt
OptExpr  : Expr
          |
          ;

WhileStmt : while '(' Expr  ')' Stmt
          ;

IfStmt : if '(' Expr ')' Stmt %prec then
       | if '(' Expr ')' Stmt else Stmt
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
#include "lex.yy.c"
main(){
  yyparse();

}
yyerror(char *s) {
  printf("%d : %s %s\n", yylineno, s, yytext );
}
/*yylex(){
    int c;
    c = getchar();
    if (isdigit(c)) {
      yylval = c – '0';
      return chiffre ;
    }
    return (c);
}

yyerror(){}
*/
