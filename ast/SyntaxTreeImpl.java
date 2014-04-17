package com.im4;

import java.util.ArrayList;

public class SyntaxTreeImpl {
	private ArrayList<Node> root;
	
	public SyntaxTreeImpl(){
		root = new ArrayList<Node>();
	}
	
	private void insert(Node astNode){
		if(root!=null){
			root.add(astNode);
		}
	} 
	
}
