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
[(][*][^*]*[*]+([^*/][^*]*[*]+)*[)] {};
%%

int yywrap()
{
return 1;
}

int main()
{
yyin=fopen("primes.cl","r");
yyout=fopen("yehdekh.txt","w");
yylex();
return 0;
}
