%{
	#include <stdio.h>
	#include <stdlib.h>
	int yylex();
	int yyerror();
	extern FILE *yyin;
	extern FILE *yyout;
%}


%%
"--".* {};					
%%

int yywrap()
{
return 1;
}

int main()
{
yyin=fopen("arith.cl","r");
yyout=fopen("SampleInput.txt","w");
yylex();
return 0;
}
