%{
	#include<stdio.h>
	#include<stdlib.h>
	#include "compiler.tab.h"
%}

%%
\(\*(.*\n)*.*\*\) {};
\-\-(.*) {};

"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
"~" {return COMP;}
"<" {return LT;}
"<=" {return LTE;}
"=" {return EQ;}
"not" {return NOT;}
[0-9]+ {return INTEGER;}
"true" {return TRUE;}
"false" {return FALSE;}
"isvoid" {return ISVOID;}
"new" {return NEW;}
"case" {return CASE;}
"of" {return OF;}
":" {return COL;}
"=>" {return TYPEOF;}
";" {return SS;}
"esac" {return ESAC;}
"let" {return LET;}
"<-" {return ASSIGN;}
"," {return COMMA;}
"in" {return IN;}
"{" {return OCB;}
"}" {return CCB;}
"while" {return WHILE;}
"loop" {return LOOP;}
"pool" {return POOL;}
"if" {return IF;}
"then" {return THEN;}
"else" {return ELSE;}
"fi" {return FI;}
"(" {return OB;}
")" {return CB;}
"@" {return AT;}
"." {return DOT;}
"class" {return CLASS;}
"inherits" {return INHERITS;}
[A-Z][_a-zA-Z0-9]* {return TYPE;}
[_a-z][_a-zA-Z0-9]* {printf("%s -- ", yytext); return ID;}
\"(.)*\"	{return STRING;}
%%


int yywrap()
{
	return 1;
}



