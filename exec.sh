flex rmvcmts.l
gcc lex.yy.c -o out
./out
flex lex.l
bison -d compiler.y
gcc -o out compiler.tab.c lex.yy.c
./out