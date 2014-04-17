package ast;

public class IDLeaf extends Node {
	private String value;
	
	public IDLeaf(String value) {
		super("ID LEAF : " + value, null, null);
		this.value = value;
	}
}
