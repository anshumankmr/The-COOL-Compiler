%{
	#include <stdio.h>
	#include <stdlib.h>
	int yylex();
	int yyerror();
	extern FILE *yyin;
%}
   
%token TRUE FALSE STRING INTEGER OB CB NOT EQ LET LT COMP DIV OSB CSB OCB CCB SS COMMA COL ASSIGN AT DOT IF THEN ELSE FI WHILE LOOP POOL IN CASE OF TYPEOF ESAC NEW ISVOID SUB ADD MUL CLASS INHERITS 

%% 
stmt : program NL; #let's stick to using the augmented grammar
features: feature SS features 
		|
		;
classes: class SS classes1
		;
classes1: class SS classes1
		|
		;
formals: COMMA formal formals
		|
		;
exprs: COMMA expr exprs
		|
		;
program: classes
		;
class: CLASS TYPE OSB INHERITS TYPE CSB OCB features CCB
		;
feature: ID OB OSB formal formals CSB CB COL TYPE OCB expr CCB
		| ID COL TYPE OSB ASSIGN expr CSB
		;
formal: ID COL TYPE
		;

expressplus: expr SS expressplus | ;

express: COMMA ID COL TYPE OSB ASSIGN expr CSB express|
	;


cases: ID COL TYPE TYPEOF expr SS cases1;

cases1: ID COL TYPE TYPEOF expr SS cases1 | ;

expr : TRUE | FALSE | STRING | INTEGER | ID | OB expr CB |NOT expr | expr EQ | expr LET expr | expr LT expr | COMP expr | expr DIV expr | expr MUL expr | expr SUB expr | expr ADD expr | ISVOID expr | NEW TYPE | CASE expr OF OSB cases ESAC| LET ID COL TYPE OSB ASSIGN expr CSB express in expr| OCB expressplus CCB| WHILE expr LOOP expr POOL| IF expr THEN expr ELSE expr FI | ID ASSIGN expr | expr OSB AT TYPE CSB DOT ID OB OSB expr exprs CSB CB | ID OB OSB expr exprs CSB CB;
%%

int yyerror(char *msg)
{
	printf("invalid expression\n");
	return 1; 
}

void main()
{
	printf("Enter the expression\n");
	yyin=fopen("q2in.txt", "r");
	do 
	{
	 if(yyparse())
	 {
	  printf("\n Failure");
	  exit(0);
	 }
	} while (!feof(yyin));
	printf("Success");
}
