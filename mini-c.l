%{
#include "y.tab.h"
#include <stdlib.h>
#include <stdio.h>
%}
alpha [a-zA-Z]
digit [0-9]
%%
[ \t ]   ;
[ \n ]   { yylineno = yylineno + 1; }
int   return INT;
float return FLOAT;
for   return FOR;
while return WHILE;
if return IF;
else return ELSE;
{digit}+       return number;
{alpha}({alpha}|{digit})* return identifier;
"<="    return le;
">="    return ge;
"=="    return eq;
"!="    return ne;
">"  return gt;
"<"  return lt;
\/\/.* ;
\/\*(.*\n)*.*\*\/ ;
.       return yytext[0];
%%
