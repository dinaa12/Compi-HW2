%{

/* Declarations section */
#include <stdio.h>
#include "output.hpp"
#include "parser.tab.hpp"

%}

%option yylineno
%option noyywrap
relop												(==|!=|<=|>=|<|>)

%%

void												return VOID;
int													return INT;
byte												return BYTE;
b													return B;
bool												return BOOL;
auto												return AUTO;

and													return AND;
or													return OR;
not													return NOT;
true												return TRUE;
false												return FALSE;

return												return RETURN;
if													return IF;
else												return ELSE;
while												return WHILE;
break												return BREAK;
continue											return CONTINUE;

;													return SC;
,													return COMMA;
\(													return LPAREN;
\)													return RPAREN;
\{													return LBRACE;
\}													return RBRACE;
=													return ASSIGN;

{relop}												return RELOP;
\+  											    return BINOP_ADD;
\-  											    return BINOP_SUB;
\*  											    return BINOP_MUL;
\/  											    return BINOP_DIV;

[a-zA-Z][a-zA-Z0-9]*						        return ID;

0 | [1-9][0-9]*         					        return NUM;
\"([^\n\r\"\\]|\\[rnt"\\])+\"					    return STRING;

\/\/[^\r\n]*[\r|\n|\r\n]?                             ; /* ignore comment */

.													{ output::errorLex(yylineno); exit(0); }

%%