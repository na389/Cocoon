
%%

%unicode
%line
%column
%byaccj

%{
  /* store a reference to the parser object */
  private Parser yyparser;

  /* Constructor taking an additional parser */
  public Yylex(java.io.Reader r, Parser yyparser) {
    this(r);
    this.yyparser = yyparser;
  }

  /* return the current line number (yy line is made private) */
  public int getLine() {
	return yyline;
  }
%}

NUM = [0-9]+
ID = [a-zA-Z]{1,31}
COMMENTS = "/*" [^*] ~"*/" |"/*" "*"+ "/" 
NL = \r | \n | \r\n

%%

/* keywords */

"main"	 	{ //System.out.println("MAIN");
	  	  return Parser.MAIN; }

"img"		{ //System.out.println("IMG");
	   	  return Parser.IMG; }

"greyscale"	{ //System.out.println("GREYSCALE");
	          return Parser.GREYSCALE; }

"sysout"	{ //System.out.println("SYSOUT");
	          return Parser.SYSOUT; }

/* punctuation */ 
"{" 		{ //System.out.println("{");
		  return (int) yycharat(0); }

"}"		{ //System.out.println("}");
		  return (int) yycharat(0); } 

";"		{ //System.out.println(";");
  		  return (int) yycharat(0); }

"[" 		{ //System.out.println("[");
		  return (int) yycharat(0); }

"]"		{ //System.out.println("]");
		  return (int) yycharat(0); }

"("		{ //System.out.println("(");
		  return (int) yycharat(0); }

")"	 	{ //System.out.println(")");
	          return (int) yycharat(0); }

/* operator */
"="		{ //System.out.println("=");
		  return (int) yycharat(0); }


{NUM} 		 { //System.out.println("NUM");
		   yyparser.yylval = new ParserVal(Integer.parseInt(yytext()));
		   return Parser.NUM; }

{ID}		 { //System.out.println("ID");
		   yyparser.yylval = new ParserVal(yytext());	
		   return Parser.ID; }


/* whitespaces */
[ \t]+ 	 	  { /* Do nothing */ }

/* new lines */
{NL} 	 	  { /* Do nothing */  } 

/* comments */ 
{COMMENTS}	  { /* Do nothing */ }

[^]	 	  { System.out.println("Unknown Character!"); } 
