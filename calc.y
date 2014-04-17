%{
 import ast.Node;
 import ast.NumLeaf;
 import ast.IDLeaf;
 import ast.SyntaxTreeImpl;
 import java.io.*;
%}
      
%token MAIN IMG GREYSCALE SYSOUT
%token <ival> NUM
%token <sval> ID
%type <obj> stmts stmt decl assignment s_call expr id num 
      
%%

program	:
	MAIN '{' stmts '}' 		{ /* Comment */
					System.out.println("program { stmts }");}
	;

stmts	: 				{System.out.println("stmts -> epsilon");}
	| stmt stmts			{System.out.println("stmts -> stmt stmts");}					 
	; 

stmt	: 
	decl				{AST.insert((Node) $1);
					 System.out.println("stmt -> decl");}
	| assignment 			{AST.insert((Node) $1);
					 System.out.println("stmt -> assignment");}
	| s_call			{AST.insert((Node) $1);
					 System.out.println("stmt -> s_call");}
	;

decl	:
	IMG id ';'			{$$ = new Node("DECL", new IDLeaf("IMG"), $2);
					 System.out.println("decl -> IMG id ;");}
	;

assignment
	: 
	id '=' expr ';'			{$$ = new Node("=", $1, $3);
					 System.out.println("assignment -> id = expr ;");} 
	;

expr 	: 
	id				{$$ = $1;
					 System.out.println("expr -> id");} 
	| id '[' num ']'		{$$ = new Node("BATCH", $1, $3);
					 System.out.println("expr -> id [ num ]");}
	| GREYSCALE '(' id ')'		{$$ = new Node("GREYSCALE", $3); 				
					 System.out.println("expr -> GREYSCALE ( id )");}
	;

s_call  :
	SYSOUT '(' id ')' ';'		{$$ = new Node("SYSOUT", $3);
					 System.out.println("s_call -> SYSOUT ( id ) ;");}
	;

id :
	ID				{$$ = new IDLeaf($1);
					 System.out.println("id = " + $1);}
	;

num	:
	NUM				{$$ = new NumLeaf($1);
					 System.out.println("num =" + $1);}
	;


%%
  /* reference to lexer object */
  private Yylex lexer;
  private SyntaxTreeImpl AST;

  private int yylex () {
    int yyl_return = -1;
    try {
      yylval = new ParserVal(0);
      yyl_return = lexer.yylex();
    }
    catch (IOException e) {
      System.err.println("IO error :"+e);
    }
    return yyl_return;
  }

  /* Error reporting */
  public void yyerror (String error) {
    System.err.println ("Error: " + error);
  }

  /* constructor taking in File input */
  public Parser(Reader r, SyntaxTreeImpl AST) {
    lexer = new Yylex(r, this);
    this.AST = AST;
  }

  public static void main(String args[]) throws IOException {
    System.out.println("Cocoon Parsing");
    SyntaxTreeImpl AST = new SyntaxTreeImpl(); 
    Parser yyparser = new Parser(new FileReader(args[0]), AST);
    yyparser.yyparse();  
    AST.traversal();
  }


