package com.copybookdataviewgenerator;

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.io.FileUtils;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import net.sf.cb2xml.Cb2Xml;

public class cb2XML {
	public static void main(String[] args) throws Exception {
		File directory = new File("results");
		if (!directory.exists()) {
			directory.mkdir();
		} else {
			FileUtils.cleanDirectory(directory);
		}

		File filesList[] = new File("data").listFiles();
		for (File file : filesList) {
			if (file.getName().contains(".CPY")) {
				// cb2XMLCommandLine(file.getName());
				cb2XMLDOM(file.getName());
			}
		}
		
		File xmlFilesList[] = new File("results").listFiles();
		for (File file : xmlFilesList) {
			if (file.getName().contains(".xml")) {
				readXMLAndGenerateTxt(file.getName());
			}
		}
	}

	private static void cb2XMLCommandLine(String fileName) throws IOException {
		String commandLine = "java -jar ./libraries/cb2xml-1.01.1.jar -cobol ./data/" + fileName
				+ " -indentXml  -xml ./results/" + fileName + ".xml";
		Runtime.getRuntime().exec(commandLine);
	}

	private static void cb2XMLDOM(String fileName) throws Exception {
		Document cb2doc = Cb2Xml.convertToXMLDOM(new File("./data/" + fileName));
		Transformer transformer = TransformerFactory.newInstance().newTransformer();
		Result output = new StreamResult(new File("results/" + fileName.split("\\.")[0] + ".xml"));
		Source input = new DOMSource(cb2doc);
		transformer.transform(input, output);
		
//		Document var1 = XmlUtils.fileToDom("C:/Users/183466/workspace/EBCDIC/results/CPRCTPCB.xml");
//		Document var2 = XmlUtils.fileToDom("C:/Users/183466/workspace/EBCDIC/data/Json_Input.json");
//		String out = new XmlToMainframe().convert(var1, var2);
//		System.out.println(out);
		
	}

	private static void readXMLAndGenerateTxt(String fileName) throws Exception {
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
			System.out.println(nodeList.getLength());
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
//						System.out.println("Name = " + attrName);
//						System.out.println("Display Length = " + attrLength);
//						System.out.println("Picture = " + attrPicture);
//						
//						jsonParser jData = new jsonParser();
//						String jsonInput = FileUtils.readFileToString(new File(jsonPath), Charset.forName("UTF-8"));
//						String jsonValue = jData.findValues(jsonInput, attrName.replaceAll("-", "_")).replaceAll("\"","");
						
						jsonParser jData = new jsonParser();
						String jsonInput = FileUtils.readFileToString(new File("C:/Users/183466/workspace/EBCDIC/data/Json_Input.json"), Charset.forName("UTF-8"));
						JSONObject jsonObject = new JSONObject(jsonInput);
						String jsonValue = jData.getKey(jsonObject, attrName.replaceAll("-", "_").trim()).replaceAll("\"","");
						
						int attrOccurs = 1;
						if(!(elemNode.getAttributes().getNamedItem("occurs") == null)){
							attrOccurs = Integer.parseInt(nodeMap.getNamedItem("occurs").getNodeValue());
						}

						String[] jsonArrayData = jsonValue.replaceAll("\\[", "").replaceAll("\\]", "").split(",");

						for(int i = 0; i < attrOccurs; i++){
							String resultText = " ";
							switch (attrPicture) {
							case "9":
								if(jsonArrayData[i].isEmpty() || jsonArrayData[i].equalsIgnoreCase("null")){
									resultText = " ";
								}else{
									resultText = String.format("%0" + attrLength + ".0f", Double.parseDouble(jsonArrayData[i]));
								}
								break;
							case "X":
								resultText = String.format("%-" + attrLength + "s", jsonArrayData[i]);
								break;
							case "S9":
								resultText = new String(new char[attrLength-1]).replace("\0", " ").concat("");
								break;
							case "A":
								resultText = String.format("%-" + attrLength + "s", jsonArrayData[i]);
								break;
							case "XX":
								resultText = String.format("%-" + attrLength + "s", jsonArrayData[i]);
								break;
							case "99":
								if(jsonArrayData[i].isEmpty() || jsonArrayData[i].equalsIgnoreCase("null")){
									resultText = " ";
								}else{
									resultText = String.format("%0" + attrLength + ".0f", Double.parseDouble(jsonArrayData[i]));
								}
								break;
							case "999":
								if(jsonArrayData[i].isEmpty() || jsonArrayData[i].equalsIgnoreCase("null")){
									resultText = " ";
								}else{
									resultText = String.format("%0" + attrLength + ".0f", Double.parseDouble(jsonArrayData[i]));
								}
								break;
							case "S9V9":
								resultText = new String(new char[attrLength-1]).replace("\0", " ").concat("");
								break;
							case "S99V999":
								resultText = new String(new char[attrLength-1]).replace("\0", " ").concat("");
								break;
							case "XXX":
								resultText = String.format("%-" + attrLength + "s", jsonArrayData[i]);
								break;
							default:
								resultText = nodeList.item(itr).getAttributes().getNamedItem("name").toString();
							}

							writer.append(resultText);
						}
						
						
						
						
					}
				}
				writer.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
