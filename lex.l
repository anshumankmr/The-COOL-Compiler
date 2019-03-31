%{
	#include<stdio.h>
	#include<stdlib.h>
	#include "compiler.tab.h"
	int is_commented = 0;
    int comment_count = 0;
%}
%x COMMENT
ALL_CHAR	 .
OPEN_COMMENT	\(\*
CLOSE_COMMENT	\*\)
LINE_COMMENT	--.*
%%
"+" {printf("%s",yytext);return ADD;}
"-" {printf("%s",yytext);return SUB;}
"*" {printf("%s",yytext);return MUL;}
"/" {printf("%s",yytext);return DIV;}
"`" {printf("%s",yytext);return COMP;}
"<" {printf("%s",yytext);return LT;}
"<=" {printf("%s",yytext);return LTE;}
"=" {printf("%s",yytext);return EQ;}
"not" {printf("%s",yytext);return NOT;}
[0-9]+ {printf("%s",yytext);return INTEGER;}
"true" {printf("%s",yytext);return TRUE;}
"false" {printf("%s",yytext);return FALSE;}
"isvoid" {printf("%s",yytext);return ISVOID;}
"new" {printf("%s",yytext);return NEW;}
"case" {printf("%s",yytext);return CASE;}
"of" {printf("%s",yytext);return OF;}
":" {printf("%s",yytext);return COL;}
"=>" {printf("%s",yytext);return TYPEOF;}
";" {printf("%s",yytext);return SS;}
"esac" {printf("%s",yytext);return ESAC;}
"let" {printf("%s",yytext);return LET;}
"<-" {printf("%s",yytext);return ASSIGN;}
"," {printf("%s",yytext);return COMMA;}
"in" {printf("%s",yytext);return IN;}
"{" {printf("%s",yytext);return OCB;}
"}" {printf("%s",yytext);return CCB;}
"while" {printf("%s",yytext);return WHILE;}
"loop" {printf("%s",yytext);return LOOP;}
"pool" {printf("%s",yytext);return POOL;}
"if" {printf("%s",yytext);return IF;}
"then" {printf("%s",yytext);return THEN;}
"else" {printf("%s",yytext);return ELSE;}
"fi" {printf("%s",yytext);return FI;}
"(" {printf("%s",yytext);return OB;}
")" {printf("%s",yytext);return CB;}
"@" {printf("%s",yytext);return AT;}
"." {printf("%s",yytext);return DOT;}
"class" {printf("%s",yytext);return CLASS;}
"inherits" {printf("%s",yytext);return INHERITS;}
[A-Z][_a-zA-Z0-9]* {printf("%s",yytext);return TYPE;}
[_a-z][_a-zA-Z0-9]* {printf("%s",yytext);return ID;}
\"(.)*\"	{printf("%s",yytext);return STRING;}

<INITIAL,COMMENT>{OPEN_COMMENT}		{ comment_count++; is_commented = 1; BEGIN(COMMENT); }
<INITIAL>{CLOSE_COMMENT} { printf("Unmatched *");  }
<COMMENT>{CLOSE_COMMENT}		{ 
			if (comment_count > 0) {
			 comment_count--;
			}
		        if (comment_count == 0) {
			 BEGIN(INITIAL);
			 is_commented = 0; 
			}
			}		 
<COMMENT>{ALL_CHAR} 	{ }
<COMMENT><<EOF>> 	{ printf("EOF in comment."); BEGIN(INITIAL); }

{LINE_COMMENT}		{ }


%%


int yywrap()
{
	return 1;
}



