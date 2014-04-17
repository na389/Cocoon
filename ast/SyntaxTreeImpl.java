package ast;

import java.util.ArrayList;

public class SyntaxTreeImpl {
	private ArrayList<Node> root;
	
	public SyntaxTreeImpl(){
		root = new ArrayList<Node>();
	}
	
	public void insert(Node astNode){
		if(root!=null){
			root.add(astNode);
		}
	}

	public void traversal() {
		for (Node stmt : root) {
			traversal(stmt);
		}
	} 

	private Node traversal(Node node) {
		if (node == null) {
			return null;
		}		
		else {
			node.getTag();
			traversal(node.getLeft());
			traversal(node.getRight());
		}
		return node;
		
		
	}
	
}
