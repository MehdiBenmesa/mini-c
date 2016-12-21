alpha [a-zA-Z]
digit [0-9]

%%
[ \t ]   ;
[ \n ]   { yylineno = yylineno + 1; }
int  return int;
float return float;
for  return for;
while  return while;
if return if;
else return else;
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
