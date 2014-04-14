package ast;

public class Node {
	private final Node right;
	private final Node left;
	private String op;

	public Node(String op, Object object) {
		this.op = op;
		this.right = (Node) object ; 
		this.left = null;
	}

	public Node(String op, Object right, Object left) {
		this.op = op;
		this.right = (Node) right;
		this.left = (Node) left;
	}

	public void setTag(String s) {
		this.op = s;
	}
}
