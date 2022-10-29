%option noyywrap
%{
    /*
    * You will need to comment this line in lab5.
    */
    #define ONLY_FOR_LEX
    
    #ifdef ONLY_FOR_LEX
    #else
    #define YYSTYPE void *
    #include "parser.h"
    #endif

    #define YY_NO_UNPUT
    #define YY_NO_INPUT
    #ifdef ONLY_FOR_LEX
    #include <ostream>
    #include <fstream>
    #include <iostream>
    #include <string>
    #include <vector>
    #include <cmath>
    using namespace std;
    extern FILE *yyin; 
    extern FILE *yyout;

    void DEBUG_FOR_LAB4(std::string s){
        std::string DEBUG_INFO = "[DEBUG LAB4]: \t" + s + "\n";
        fputs(DEBUG_INFO.c_str(), yyout);
    }
    #endif
%}
%{
    
    class Node{
    public:
        string idname;//ID
        int scope_num;//符号作用域
    };
    int l_num = 0;//左括号序号
    int r_num = 0;//右括号序号
    int id_count = 0;//层数
    int scope_num = 0;//作用域数
    vector<int> a;//作用域维护
    
    Node table[1000];//符号表
    
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

%x BLOCKCOMMENT

%%
{linecomment} {
    #ifdef ONLY_FOR_LEX
        string a = yytext;
    #else 
        return linecomment;
    #endif
}

{commentbegin} {
    #ifdef ONLY_FOR_LEX
        BEGIN BLOCKCOMMENT;
        string a = yytext;
        if(a.find('\n') != a.npos)yylineno++;
    #else 
        return commentbegin;
    #endif
}

<BLOCKCOMMENT>{commentend} {
    #ifdef ONLY_FOR_LEX
        string a = yytext;
         if(a.find("\n") != a.npos)yylineno++;
        BEGIN INITIAL;
    #else 
        return commentend;
    #endif
}

<BLOCKCOMMENT>{commentelement} {
    #ifdef ONLY_FOR_LEX
        string a = yytext;
        if(a.find("\n") != a.npos)yylineno++;
    #else 
        return commentelement;
    #endif
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
        return FLOAT;
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
        return CHAR;
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
        return FOR;
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
        return UNEQUAL;
    #endif
}
"!" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("AGAINST\t!\t"+to_string(yylineno));
    #else
        return AGAINST;
    #endif
}
"&&" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LOGICAND\t!\t"+to_string(yylineno));
    #else
        return LOGICAND;
    #endif
}
"||" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("LOGICOR\t!\t"+to_string(yylineno));
    #else
        return LOGICOR;
    #endif
}
">" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("MORE\t>\t"+to_string(yylineno));
    #else
        return MORE;
    #endif
}
">=" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("GTE\t>=\t"+to_string(yylineno));
    #else
        return GTE;
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
        return LTE;
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
        return COLON;
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
        return QUOTATION;
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
        return LSQUARE;
    #endif 
}
"]" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("RSQUARE\t]\t"+to_string(yylineno));
    #else
        return RSQUARE;
    #endif 
}
"#" {
    #ifdef ONLY_FOR_LEX
        DEBUG_FOR_LAB4("POUND\t#\t"+to_string(yylineno));
    #else
        return POUND;
    #endif 
}

{OCT} {
    #ifdef ONLY_FOR_LEX
        string a  = yytext;
        int len = a.length() - 1;
        int all = 0;
        for(int i = 0; i < len; i++)
        {
            int temp1 = (pow(8, (len - i - 1)));
            int temp2 = (a[i + 1] - '0');
            all = all + temp1 * temp2;         
        }
        DEBUG_FOR_LAB4("OCT\t" + to_string(all) + "(DEC)" + "\t" + to_string(yylineno));
    #else 
        return OCT;
    #endif
} 

{DECIMIAL} {
    #ifdef ONLY_FOR_LEX
        string a = yytext;
        DEBUG_FOR_LAB4("DECIMIAL\t" + a + "\t" + to_string(yylineno));
    #else 
        return DECIMIAL;
    #endif
}

{HEX} {
    #ifdef ONLY_FOR_LEX
        string a  = yytext;
        int len = a.length() - 2;
        int all = 0;
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
        DEBUG_FOR_LAB4("HEX\t" + to_string(all) + "(DEC)" + "\t" + to_string(yylineno));
    #else 
        return HEX;
    #endif
}

{ID} {
    #ifdef ONLY_FOR_LEX
        string m = yytext;//ID
        int idnum = 0;//ID所在域
        bool flag = 0;//是否出现
        //在符号表上遍历
        for(int i = 0; i < id_count; i++)
        {
            //若表中出现过&&表中作用域=目前作用域
            if(table[i].idname == yytext && table[i].scope_num == a.back())
            {
                //层数变化
                idnum = i + 1;
                flag = 1;
                break;
            }
        }
        //未出现
        if(flag == 0)
        {
            table[id_count].idname = yytext;
            if(a.size() != 0){
                table[id_count].scope_num = a.back();
            }
            id_count++;
            idnum = id_count;
        }
        DEBUG_FOR_LAB4("ID\t" + m + "\t" + to_string(yylineno) + "\t" + to_string(idnum));
    #else 
        return ID;
    #endif
}

{char} {
    #ifdef ONLY_FOR_LEX
        string a = yytext;
        DEBUG_FOR_LAB4("CHARACTER\t" + a + "\t" + to_string(yylineno));
    #else 
        return CHARACTER;
    #endif
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