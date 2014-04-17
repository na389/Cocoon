package st;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Stack;


public class SymbolTable {
	Stack<HashMap<Id, Token>> stStack;
	Reserved reserved;
	public SymbolTable(){
		stStack = new Stack<HashMap<Id,Token>>();				
		reserved = new Reserved();
		if(stStack!=null){
			stStack.push(insertReserved());
		}
	}
	
/*	public boolean insert(ArrayList<Node> stEntry){
		
		
	}
	
	public boolean lookUp(Stack<HashMap<Id,Token>> stEntry ){
		
	}
*/	
	/**
	 * Insert the provided keyword into the symbol table
	 * */
	
	public HashMap<Id, Token> insertReserved(){
		//Create HashMap entry for the reserved words		
		HashMap<Id, Token> reservedST = new HashMap<Id, Token>();
		ArrayList<String> list = reserved.getKeywordList();
		for(String keyword: list){
			Id identifier = new Id();
			identifier.setId(keyword);
			Token token = new Token();
			token.setReserved(true);
			reservedST.put(identifier,token);
		}
		return reservedST;
	}
}
