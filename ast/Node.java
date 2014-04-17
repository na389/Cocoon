package ast;

public class Node {
	private final Node right;
	private final Node left;
	private String op;

	public Node(String op, Object object) {
		this.op = op;
		this.left = (Node) object; 
		this.right = null;
	}

	public Node(String op, Object left, Object right) {
		this.op = op;
		this.right = (Node) right;
		this.left = (Node) left;
	}

	public void setTag(String s) {
		this.op = s;
	}
	
	public Node getRight(){
		return this.right;
	}
		
	public Node getLeft(){
		return this.left;
	}
		
	public void getTag(){
		System.out.println(this.op);
	}
}
