%{
 import ast.Node;
 import ast.NumLeaf;
 import ast.IDLeaf;
 import java.io.*;
%}
      
%token MAIN IMG GREYSCALE SYSOUT
%token <ival> NUM
%token <sval> ID
%type <obj> stmts stmt decl assignment s_call expr id num 
      
%%

program	:
	MAIN '{' stmts '}' 		{root = (Node) $3;
					 ((Node)root).setTag("root"); }
	;

stmts	: stmt				{$$ = $1;}
	| stmt stmts			{$$ = new Node("STMT", $1, $2);					 }
	; 

stmt	: 
	decl				{$$ = $1;}
	| assignment 			{$$ = $1;}
	| s_call			{$$ = $1;}
	;

decl	:
	IMG id ';'			{
					$$ = new Node("DECL",$2);
					System.out.println("After DECL");}
	;

assignment
	: 
	id '=' expr ';'			{$$ = new Node("=", $1, $3);} 
	;

expr 	: 
	id				{$$ = $1;} 
	| id '[' num ']'		{$$ = new Node("ARRAY", $1, $3);
					 System.out.println("ARRAY");}
	| GREYSCALE '(' id ')'		{$$ = new Node("GREYSCALE", $3); 				
					 System.out.println("GREYSCALE");}
	;

s_call  :
	SYSOUT '(' id ')' ';'		{$$ = new Node("SYSOUT", $3);
					 System.out.println("sysout");}
	;

id :
	ID				{$$ = new IDLeaf($1);
					 System.out.println("id = " + $1); }
	;

num	:
	NUM				{System.out.println("num =" + $1);
					 $$ = new NumLeaf($1);}
	;


%%
  /* reference to lexer object */
  private Yylex lexer;
  private Node root;

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
  public Parser(Reader r) {
    lexer = new Yylex(r, this);
  }

  public static void main(String args[]) throws IOException {
    System.out.println("Cocoon Parsing");
    Parser yyparser = new Parser(new FileReader(args[0]));
    yyparser.yyparse();
    yyparser. root.getTag(); 
    inOrderTraversal(yyparser.root);
  }

  public static Node inOrderTraversal(Node root) {
	 if(root == null){
		 return null;
	 }else{
		 inOrderTraversal(root.getLeft());
		 root.getTag();		
		 inOrderTraversal(root.getRight());
	 }
	 return root;
   }

