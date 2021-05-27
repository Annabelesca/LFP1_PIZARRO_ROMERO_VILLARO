%option noyywrap
%option caseless


/* Definicions */

%{
	#include <stdbool.h>
	int nEstats = 0;
	bool estat = false;
%}

/*Numero*/
num ([^-+][0-9]+)
/*Alfabet*/
simbol ([0-9]|[a-zA-Z])



/* Reglas */
/* Automata finit */
%%
[Aa][Ll][Ff][Aa][Bb][Ee][Tt][Oo]			{printf(" ALFABETO ");} /*Per llegir minusula o majuscula*/
[Ee][Ss][Tt][Aa][Dd][Oo][Ss]				{printf(" ESTADOS "); estat = true;}
[Tt][Rr][Aa][Nn][Ss][Ii][Cc][Ii][Oo][Nn][Ee][Ss]	{printf(" TRANSICIONES ");}
[Ii][Nn][Ii][Cc][Ii][Aa][Ll]				{printf(" INICIAL ");}
[Ff][Ii][Nn][Aa][Ll]					{printf(" FINAL ");}
{num}		{printf(" NUM ");
			if(estat) { 
				nEstats += atoi(yytext);
				/*Si hi ha un estat que correspon, lanalitzador lèxic el posa dins de yytext*/
				estat=false;
			}
		}
"{"		{printf(" ABRIR ");}
"}"		{printf(" CERRAR ");}
"{simbol}"	{printf(" SIMBOLO ");}
[ \t\r]*"("[ \t\r]*{num}[ \t\r]*","[ \t\r]*{simbol}[ \t\r]*";"[ \t\r]*{num}[ \t\r]*")"	{printf(" TRANSICIO ");} // ( num , simbol ; num )
("%".*\n)*	//Ignora les linies que comencin amb comentari
.("%".*\n)	{ printf( "\n" );} //Ignora els comentaris que estiguin a final de linea
[ \t\r]+	{ printf( " " );}
[ \t\r]+$
[ \n]+		{ printf( "\n" ); 
			estat = false;  }
.		{ printf("%s", yytext); }



%% /*Main*/
int main(argc, argv)
int argc;
char **argv;
{
if(argc > 1) {
	if(!(yyin = fopen(argv[1], "r"))) {
		perror(argv[1]);
		return (1);
	}
}
yylex();
printf("\nNumber of states: %i\n", nEstats);
}
