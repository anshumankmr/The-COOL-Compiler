%{
	#include<stdio.h>
	#include<stdlib.h>
	#include "compiler.tab.h"
%}

%%
"+" {return ADD;}
"-" {return MINUS;}
"*" {return MUL;}
"/" {return DIV;}
"`" {return COMP;}
"<" {return LT;}
"<=" {return LTE;}
"=" {return EQ;}
"not" {return NOT;}
"ID" {return ID;}
[0-9]+ {return INTEGER;}
"true" {return TRUE;}
"false" {return FALSE;}
"isvoid" {return ISVOID;}
"new" {return NEW;}
"TYPE" {return TYPE;}
"case" {return CASE;}
"of" {return OF;}
":" {return COL;}
"=>" {return TYPEOF;}
";" {return SS;}
"esac" {return ESAC;}
"let" {return LET;}
"[" {return OSB;}
"<-" {return ASSIGN;}
"]" {return CSB;}
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

%%


int yywrap()
{
	return 1;
}



