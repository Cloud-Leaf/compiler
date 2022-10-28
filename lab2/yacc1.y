%{
/************************************************************************
expr1.y
YACC file
Date: xxxx/xx/xx
xxxxx <xxxxx@nbjl.nankai.edu.cn>
************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#ifndef YYSTYPE
#define YYSTYPE double
#endif
int yylex ();
extern int yyparse();
FILE* yyin ;
void yyerror(const char* s );
%}
%token ADD
%token SUB
%token MUL
%token DEV
%token INT
%token LPA
%token RPA
%left ADD SUB
%left MUL DEV
%right UMINUS

%%


lines : lines expr ';' { printf("%f\n", $2); }
      | lines ';'
      |
      ;

expr : expr ADD expr { $$ = $1 + $3; }
     | expr SUB expr { $$ = $1 - $3; }
     | expr MUL expr { $$ = $1 * $3; }
     | expr DEV expr { $$ = $1 / $3; }
     | LPA expr RPA { $$ = $2; }
     | SUB expr %prec UMINUS { $$ = -$2; }
     | INT { $$=$1; }
     ;


%%

// programs section

int yylex()
{
    // place your token retrieving code here
    int t;
    while(1){
        t = getchar ();
        if (t == ' ' || t== '\t' || t == '\n'){}
        else if(isdigit(t)){
            yylval=0;
            while(isdigit(t)){
                yylval=yylval*10+t-'0';
                t=getchar();
            }
            ungetc(t,stdin);
            return INT;
        }
        else{
            switch(t){
                    case '+':return ADD;
                    case '-':return SUB;
                    case '*':return MUL;
                    case '/':return DEV;
                    case '(':return LPA;
                    case ')':return RPA;
                    default:return t;
            }
        }
    }
}

int main(void)
{
    yyin = stdin;
    do {
    yyparse();
    } while (!feof (yyin));
    return 0;
}
void yyerror(const char* s) {
    fprintf (stderr , "Parse error : %s\n", s );
    exit (1);
}