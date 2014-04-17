package st;

import java.util.ArrayList;

public class Reserved {
	private static ArrayList<String> reservedList;
	// import, return , img, filter, int, batch, pipe, string
	// color, fan-out, main, copy, sysout, bool, if, else
	private static String IMPORT = "import";
	private static String RETURN = "return";
	private static String IMG = "img";
	private static String FILTER = "filter";
	private static String INTEGER = "int";
	private static String BATCH = "batch";
	private static String PIPE = "pipe";
	private static String STR = "string";
	private static String COLOR = "color";
	private static String FAN_OUT = "fan-out";
	private static String MAIN = "main";
	private static String COPY = "copy";
	private static String SYSOUT = "sysout";
	private static String BOOL = "bool";
	private static String IF = "if";
	private static String ELSE = "else";

	
	public  Reserved() {
		reservedList = new ArrayList<String>();
	}

	private void createList() {
		if (reservedList != null) {
			reservedList.add(Reserved.IMPORT);			
			reservedList.add(Reserved.RETURN);
			reservedList.add(Reserved.IMG);
			reservedList.add(Reserved.FILTER);
			reservedList.add(Reserved.INTEGER);
			reservedList.add(Reserved.BATCH);
			reservedList.add(Reserved.PIPE);
			reservedList.add(Reserved.STR);
			reservedList.add(Reserved.COLOR);
			reservedList.add(Reserved.FAN_OUT);
			reservedList.add(Reserved.MAIN);
			reservedList.add(Reserved.COPY);
			reservedList.add(Reserved.SYSOUT);
			reservedList.add(Reserved.BOOL);
			reservedList.add(Reserved.IF);
			reservedList.add(Reserved.ELSE);
		}
	}

	public static ArrayList<String> getKeywordList() {
		if(reservedList != null){
			return reservedList;
		}else{
			return null;
		}
	}
}
