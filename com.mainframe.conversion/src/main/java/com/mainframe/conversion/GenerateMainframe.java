package com.mainframe.conversion;

import java.io.BufferedWriter;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class GenerateMainframe {
	public void readXMLAndGenerateTxt(String fileName, String jsonInput) throws Exception {
		
		MainframeConstantChecks mainframeConstantChecks = new MainframeConstantChecks();
		
		try {
			File resultFile = new File("./results/" + fileName.split("\\.")[0] + ".txt");
			if (!resultFile.exists()) {
				resultFile.createNewFile();
			}

			BufferedWriter writer = Files
					.newBufferedWriter(Paths.get("./results/" + fileName.split("\\.")[0] + ".txt"));

			File file = new File("./results/" + fileName);
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(file);
			doc.getDocumentElement().normalize();
			//System.out.println("Root element: " + doc.getDocumentElement().getNodeName());
			NodeList nodeList = doc.getElementsByTagName("item");
			for (int itr = 0; itr < nodeList.getLength(); itr++) {
				Node elemNode = nodeList.item(itr);
				if (elemNode.getNodeType() == Node.ELEMENT_NODE) {
					if (elemNode.hasAttributes() && !(elemNode.getAttributes().getNamedItem("picture") == null) && (elemNode.getAttributes().getNamedItem("redefined") == null)) {
						NamedNodeMap nodeMap = elemNode.getAttributes();
						
//						if(nodeMap.getNamedItem("name").getNodeValue().equalsIgnoreCase("CTP-R01-MERCHANT-ACCT-NUMB")){
//							
//						}
						
						String attrName = nodeMap.getNamedItem("name").getNodeValue();
						int attrLength = Integer.parseInt(nodeMap.getNamedItem("storage-length").getNodeValue());
						String attrPicture = nodeMap.getNamedItem("picture").getNodeValue().split("\\(")[0];
						
						jsonParser jData = new jsonParser();
						JSONObject jsonObject = new JSONObject(jsonInput);
						String jsonValue = jData.getKey(jsonObject, attrName.replaceAll("-", "_").trim()).replaceAll("\"","");
						
						int attrOccurs = 1;
						if(!(elemNode.getAttributes().getNamedItem("occurs") == null)){
							attrOccurs = Integer.parseInt(nodeMap.getNamedItem("occurs").getNodeValue());
						}

						String[] jsonArrayData = jsonValue.replaceAll("\\[", "").replaceAll("\\]", "").split(",");

						for(int i = 0; i < attrOccurs; i++){
							String resultText = mainframeConstantChecks.constantChecks(attrPicture, attrLength, jsonArrayData[i]);
							writer.append(resultText);
						}	
					}
				}
				writer.flush();
			}
			System.out.println("Success");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
