package ast;

public class NumLeaf extends Node {
	int value;
	
	public NumLeaf(int value) {
		super("NUM", null, null);
		this.value = value;
	}
	
	int getValue() {
		return value;
	}
}
