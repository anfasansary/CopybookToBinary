package com.mainframe.conversion;

public class MainframeConstantChecks {
	public String constantChecks(String attrPicture, int attrLength, String jsonArrayData) {
		
		String resultText = " ";
		switch (attrPicture) {
		case "9":
			if(jsonArrayData.isEmpty() || jsonArrayData.equalsIgnoreCase("null")){
				resultText = " ";
			}else{
				resultText = String.format("%0" + attrLength + ".0f", Double.parseDouble(jsonArrayData));
			}
			break;
		case "X":
			resultText = String.format("%-" + attrLength + "s", jsonArrayData);
			break;
		case "S9":
			resultText = new String(new char[attrLength-1]).replace("\0", " ").concat("");
			break;
		case "A":
			resultText = String.format("%-" + attrLength + "s", jsonArrayData);
			break;
		case "XX":
			resultText = String.format("%-" + attrLength + "s", jsonArrayData);
			break;
		case "99":
			if(jsonArrayData.isEmpty() || jsonArrayData.equalsIgnoreCase("null")){
				resultText = " ";
			}else{
				resultText = String.format("%0" + attrLength + ".0f", Double.parseDouble(jsonArrayData));
			}
			break;
		case "999":
			if(jsonArrayData.isEmpty() || jsonArrayData.equalsIgnoreCase("null")){
				resultText = " ";
			}else{
				resultText = String.format("%0" + attrLength + ".0f", Double.parseDouble(jsonArrayData));
			}
			break;
		case "S9V9":
			resultText = new String(new char[attrLength-1]).replace("\0", " ").concat("");
			break;
		case "S99V999":
			resultText = new String(new char[attrLength-1]).replace("\0", " ").concat("");
			break;
		case "XXX":
			resultText = String.format("%-" + attrLength + "s", jsonArrayData);
			break;
		default:
			resultText = "Error - Constant not found";
		}
		
		return resultText;
	}
}
