package ast;

public class IDLeaf extends Node {
	private String value;
	
	public IDLeaf(String value) {
		super("LEAF", null, null);
		this.value = value;
	}
}
