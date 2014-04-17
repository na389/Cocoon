package ast;

public class NumLeaf extends Node {
	int value;
	
	public NumLeaf(int value) {
		super("NUM LEAF : " + value, null, null);
		this.value = value;
	}
}
