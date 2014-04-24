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

	public ArrayList<Node> traversal() {
		ArrayList<Node> result = new ArrayList<Node>();
		for (Node stmt : root) {
			traversal(stmt, result);
		}	
		return result;
	} 

	private Node traversal(Node node, ArrayList<Node> array) {
		if (node == null) {
			return null;
		}		
		else {
			array.add(node);
			traversal(node.getLeft(), array);
			traversal(node.getRight(), array);
		}
		return node;	
	}
	
}
