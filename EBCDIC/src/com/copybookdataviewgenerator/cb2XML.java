package com.copybookdataviewgenerator;

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
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
				readXML(file.getName());
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
	}

	private static void readXML(String fileName) {
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
			System.out.println("Root element: " + doc.getDocumentElement().getNodeName());
			NodeList nodeList = doc.getElementsByTagName("item");
			for (int itr = 0; itr < nodeList.getLength(); itr++) {
				Node elemNode = nodeList.item(itr);
				if (elemNode.getNodeType() == Node.ELEMENT_NODE) {
					System.out.println("\nNode Name =" + elemNode.getNodeName() + " [OPEN]");

					if (elemNode.hasAttributes() && !(elemNode.getAttributes().getNamedItem("picture") == null)) {
						NamedNodeMap nodeMap = elemNode.getAttributes();
						String attrName = nodeMap.getNamedItem("name").getNodeValue();
						String attrLength = nodeMap.getNamedItem("display-length").getNodeValue();
						String attrPicture = nodeMap.getNamedItem("picture").getNodeValue().split("\\(")[0];
						System.out.println("Name = " + attrName);
						System.out.println("Display Length = " + attrLength);
						System.out.println("Picture = " + attrPicture);
						
						String resultText = null;
						switch (attrPicture) {
						case "9":
							resultText = String.format("%0" + attrLength + "d", Integer.parseInt("0"));
							break;
						case "X":
							resultText = String.format("%-" + attrLength + "s", "X");
							break;
						case "S9":
							break;
						case "A":
							resultText = String.format("%-" + attrLength + "s", "A");
							break;
						case "XX":
							resultText = String.format("%-" + attrLength + "s", "XX");
							break;
						case "99":
							break;
						default:
						}

						writer.append(resultText);
						writer.flush();
					}
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
