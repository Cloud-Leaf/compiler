%option noyywrap
%{
    #include "parser.h"
    #define YY_NO_UNPUT
    #define YY_NO_INPUT

    #include <ostream>
    #include <fstream>
    #include <string>
    #include <cmath>
    using namespace std;

    extern FILE *yyin; 
    extern FILE *yyout;
    extern bool dump_tokens;

    void DEBUG_FOR_LAB4(std::string s){
        std::string DEBUG_INFO = "[DEBUG LAB4]: \t" + s + "\n";
        fputs(DEBUG_INFO.c_str(), yyout);
    }
%}

HEX (0x[1-9|A-F|a-f][0-9|A-F|a-f]*|0x0)
OCT (0[1-7][0-7]*|00)
DECIMIAL ([1-9][0-9]*|0)
ID [[:alpha:]_][[:alpha:][:digit:]_]*
char ('.')
EOL (\r\n|\n|\r)
WHITE [\t ]

linecomment (\/\/.*)
commentbegin "/*"
commentelement .|\n
commentend "*/"
commentline (\r\n|\n|\r)
%x BLOCKCOMMENT

%%
{linecomment} {
    #ifdef ONLY_FOR_LEX
        string a = yytext;
    #else 
        
    #endif
}

{commentbegin} {
    BEGIN BLOCKCOMMENT;
    #ifdef ONLY_FOR_LEX
        string a = yytext;
        if(a.find('\n') != a.npos)yylineno++;
    #else 
        
    #endif
}

<BLOCKCOMMENT>{commentend} {
    BEGIN INITIAL;
    #ifdef ONLY_FOR_LEX
        string a = yytext;
         if(a.find("\n") != a.npos)yylineno++;
    #else 
        
    #endif
}

<BLOCKCOMMENT>{commentelement} {
    #ifdef ONLY_FOR_LEX
        string a = yytext;
        if(a.find("\n") != a.npos)yylineno++;
    #else 
        
    #endif
}

<BLOCKCOMMENT>{commentline} {
    yylineno++;
}

"int" {
    /*
    * Questions: 
    *   Q1: Why we need to return INT in further labs?
    *   Q2: What is "INT" actually?
    */
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("INT\t\tint\t\t"+to_string(yylineno));
    #else
        return INT;
    #endif
}
"float" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("FLOAT\t\tfloat\t\t"+to_string(yylineno));
    #else
        //return FLOAT;
    #endif 
}
"const" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("CONST\t\tconst\t\t"+to_string(yylineno));
    #else
        return CONST;
    #endif 
}
"void" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("VOID\t\tvoid\t\t"+to_string(yylineno));
    #else
        return VOID;
    #endif 
}
"char" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("CHAR\t\tchar\t\t"+to_string(yylineno));
    #else
        //return CHAR;
    #endif 
}
"while" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("WHILE\twhile\t"+to_string(yylineno));
    #else
        return WHILE;
    #endif 
}
"for" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("FOR\tfor\t"+to_string(yylineno));
    #else
        //return FOR;
    #endif 
}
"break" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("BREAK\tbreak\t"+to_string(yylineno));
    #else
        return BREAK;
    #endif 
}
"continue" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("CONTINUE\tcontinue\t"+to_string(yylineno));
    #else
        return CONTINUE;
    #endif 
}
"if" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("IF\tif\t"+to_string(yylineno));
    #else
        return IF;
    #endif
};
"else" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ELSE\telse\t"+to_string(yylineno));
    #else
        return ELSE;
    #endif
};
"return" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RETURN\treturn\t"+to_string(yylineno));
    #else
        return RETURN;
    #endif
}
"==" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("EQUAL\t==\t"+to_string(yylineno));
    #else
        return EQUAL;
    #endif
}
"!=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("UNEQUAL\t!=\t"+to_string(yylineno));
    #else
        return NOTEQUAL;
    #endif
}
"!" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("AGAINST\t!\t"+to_string(yylineno));
    #else
        return NOT;
    #endif
}
"&&" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LOGICAND\t!\t"+to_string(yylineno));
    #else
        return AND;
    #endif
}
"||" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LOGICOR\t!\t"+to_string(yylineno));
    #else
        return OR;
    #endif
}
">" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("MORE\t>\t"+to_string(yylineno));
    #else
        return GREATER;
    #endif
}
">=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("GTE\t>=\t"+to_string(yylineno));
    #else
        return GREATEQUAL;
    #endif
}
"=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ASSIGN\t=\t"+to_string(yylineno));
    #else
        return ASSIGN;
    #endif
}
"<=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LTE\t<=\t"+to_string(yylineno));
    #else
        return LESSEQUAL;
    #endif
}
"<" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LESS\t<\t"+to_string(yylineno));
    #else
        return LESS;
    #endif
}
"+" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("ADD\t+\t"+to_string(yylineno));
    #else
        return ADD;
    #endif
}
"-" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("SUB\t-\t"+to_string(yylineno));
    #else
        return SUB;
    #endif
}
"*" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("MUL\t*\t"+to_string(yylineno));
    #else
        return MUL;
    #endif
}
"/" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("DIV\t/\t"+to_string(yylineno));
    #else
        return DIV;
    #endif
}
"%" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("MOD\t%\t"+to_string(yylineno));
    #else
        return MOD;
    #endif
}
";" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("SEMICOLON\t;\t"+to_string(yylineno));
    #else
        return SEMICOLON;
    #endif
}
":" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("COLON\t:\t"+to_string(yylineno));
    #else
        //return COLON;
    #endif
}
"," {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("COMMA\t,\t"+to_string(yylineno));
    #else
        return COMMA;
    #endif
}
"'" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("QUOTATION\t;\t"+to_string(yylineno));
    #else
        //return QUOTATION;
    #endif
}
"(" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LPAREN\t(\t"+to_string(yylineno));
    #else
        return LPAREN;
    #endif
}
")" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RPAREN\t)\t"+to_string(yylineno));
    #else
    return RPAREN;
    #endif
}
"{" {
    #ifdef ONLY_FOR_LEX
        scope_num++;
        a.push_back(scope_num);
        l_num++;
        string temp = "LBRACE\t{\tlinenum:" + to_string(yylineno);
        DEBUG_FOR_LAB4("LBRACE\t{\t"+to_string(yylineno));
    #else
        return LBRACE;
    #endif
}
"}" {
    #ifdef ONLY_FOR_LEX
        a.pop_back();
        r_num++;
        DEBUG_FOR_LAB4("RBRACE\t}\t"+to_string(yylineno));
    #else
        return RBRACE;
    #endif
}
"[" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LSQUARE\t[\t"+to_string(yylineno));
    #else
        //return LSQUARE;
    #endif 
}
"]" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RSQUARE\t]\t"+to_string(yylineno));
    #else
        //return RSQUARE;
    #endif 
}
"#" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("POUND\t#\t"+to_string(yylineno));
    #else
        //return POUND;
    #endif 
}

{DECIMIAL} {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    yylval.itype = atoi(yytext);
    return INTEGER;
}

{HEX} {
    if(dump_tokens)  
        DEBUG_FOR_LAB4(yytext);
    int all = 0;
    string a  = yytext;
    int len = a.length() - 2;
    for(int i = 0; i < len; i++)
    {
        int temp1 = (pow(16, (len - i - 1)));
        int temp2;
        if(a[i + 2] >= '0' && a[i + 2] <= '9'){
            temp2 = (a[i + 2] - '0');
        }
        else if(a[i + 2] >= 'A' && a[i + 2] <= 'F'){
            temp2 = a[i + 2] - 'A' + 10;
        }
        else if(a[i + 2] >= 'a' && a[i + 2] <= 'f'){
            temp2 = a[i + 2] - 'a' + 10;
        }
        all = all + temp1 * temp2;         
    }
    yylval.itype = all;
    return INTEGER;
}

{OCT} {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    string a  = yytext;
    int len = a.length() - 1;
    int all = 0;
    for(int i = 0; i < len; i++)
    {
        //cout << i << ":" << (pow(8, (len - i - 1))) << ' ' << (a[i + 1] - '0') << endl;
        int temp1 = (pow(8, (len - i - 1)));
        int temp2 = (a[i + 1] - '0');
        all = all + temp1 * temp2;         
    }
    yylval.itype = all;
    return INTEGER;
} 

{ID} {
    if(dump_tokens)
        DEBUG_FOR_LAB4(yytext);
    char *lexeme;
    lexeme = new char[strlen(yytext) + 1];
    strcpy(lexeme, yytext);
    yylval.strtype = lexeme;
    return ID;
}
{EOL} yylineno++;
{WHITE}
%%

#ifdef ONLY_FOR_LEX
int main(int argc, char **argv){
    
    if(argc != 5){
        fprintf(stderr, "Argument Not Enough");
        exit(EXIT_FAILURE);
    }

    if(!(yyin = fopen(argv[1], "r"))){
        fprintf(stderr, "No such file or directory: %s", argv[1]);
        exit(EXIT_FAILURE);
    }

    if(!(yyout = fopen(argv[3], "w"))){
        fprintf(stderr, "No such file or directory: %s", argv[3]);
        exit(EXIT_FAILURE);
    }
    fprintf(yyout,"[DEBUG LAB4]: 	%-12s%-12s%-12s%-12s\n","token","lexeme","lineno","idnum");
    yylex();
    return 0;
}
#endif