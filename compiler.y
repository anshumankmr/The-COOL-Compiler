%{
	#include <stdio.h>
	#include <stdlib.h>
	int yylex();
	int yyerror();
	extern FILE *yyin;
%}
   
%token TRUE FALSE STRING INTEGER OB CB NOT EQ LET LT COMP DIV

%% 
stmt : program NL; #let's stick to using the augmented grammar
expr : TRUE | FALSE | STRING | INTEGER | ID | OB expr CB |NOT expr | expr EQ | expr LET expr | expr LT expr | COMP expr | expr DIV expr ;
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
