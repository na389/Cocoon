package ast;

public class IDLeaf extends Node {
	private String lexeme;
	
	public IDLeaf(String lexeme) {
		super("ID", null, null);
		this.lexeme = lexeme;
	}

	String getLexeme() {
		return lexeme;
	}
}
