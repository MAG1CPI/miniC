%option noyywrap
%option nounput
%option noinput
%option yylineno

%{
#include <cstdlib>
#include <string>

// include Bison 生成的头文件
#include "parser.tab.hpp"

using namespace std;
%}

BlankChar           [ \t\n\r]*
LineComment         "//".*
BlockCommentBegin   \/\*
BlockCommentEnd     \*\/

Ident               [a-zA-Z_][a-zA-Z0-9_]*

DecInt              [1-9][0-9]*|0
OctInt              0[oO]?[0-7]+
HexInt              0[xX][0-9A-Fa-f]+

%x BLOCKCOMMENT

%%
{BlankChar} {
    /* do nothing */
}
{LineComment} {
    /* do nothing */
}
{BlockCommentBegin} {
    BEGIN BLOCKCOMMENT;
}
<BLOCKCOMMENT>{BlockCommentEnd} {
    BEGIN INITIAL;
}
<BLOCKCOMMENT>. {
    /*do nothing*/
}

"int" {
    return INT;
}

"return" {
    return RETURN;
}

{Ident} {
    yylval.str_val = new string(yytext);
    return IDENT;
}

{DecInt} {
    yylval.int_val = strtol(yytext, nullptr, 0);
    return INT_CONST;
}
{OctInt} {
    yylval.int_val = strtol(yytext, nullptr, 0);
    return INT_CONST;
}
{HexInt} {
    yylval.int_val = strtol(yytext, nullptr, 0);
    return INT_CONST;
}

. {
    return yytext[0];
}

%%
