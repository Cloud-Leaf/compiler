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
#include <string.h>
#ifndef YYSTYPE
#define YYSTYPE char*
#endif
char idStr[50];
char numStr[50];
int yylex ();
extern int yyparse();
FILE* yyin ;
void yyerror(const char* s );
%}
%token ADD
%token SUB
%token MUL
%token DEV
%token LPA
%token RPA
%token INT
%token ID
%left ADD SUB
%left MUL DEV
%right UMINUS

%%


lines : lines expr ';' { printf("%s\n", $2); }
      | lines ';'
      |
      ;

expr : expr ADD expr { $$ = (char*)malloc(50*sizeof(char)); strcpy($$,$1); strcat($$,$3); strcat($$,"+ "); }
     | expr SUB expr { $$ = (char*)malloc(50*sizeof(char)); strcpy($$,$1); strcat($$,$3); strcat($$,"- "); }
     | expr MUL expr { $$ = (char*)malloc(50*sizeof(char)); strcpy($$,$1); strcat($$,$3); strcat($$,"* "); }
     | expr DEV expr { $$ = (char*)malloc(50*sizeof(char)); strcpy($$,$1); strcat($$,$3); strcat($$,"/ "); }
     | LPA expr RPA { $$ = (char*)malloc(50*sizeof(char)); strcpy($$,$2); }
     | SUB expr %prec UMINUS { $$ = (char*)malloc(50*sizeof(char)); strcpy($$,"-"); strcat($$,$2); }
     | INT { $$ = (char*)malloc(50*sizeof(char)); strcpy($$,$1); strcat($$," "); }
     | ID  { $$ = (char*)malloc(50*sizeof(char)); strcpy($$,$1); strcat($$," "); }
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
        else if(t>='0' && t<='9'){
            int ti=0;
            while(t>='0' && t<='9'){
                numStr[ti]=t;
                t=getchar();
                ti++;
            }
            numStr[ti]=0;
            yylval=numStr;
            ungetc(t,stdin);
            return INT;
        }
        else if((t>='a' && t<='z')||(t>='A' && t<='Z')||(t=='_')){
            int ti=0;
            while((t>='a' && t<='z')||(t>='A' && t<='Z')||(t=='_')||(t>='0' && t<='9')){
                numStr[ti]=t;
                t=getchar();
                ti++;
            }
            numStr[ti]=0;
            yylval=numStr;
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