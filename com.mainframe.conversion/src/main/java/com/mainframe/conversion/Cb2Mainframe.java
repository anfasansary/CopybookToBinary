package com.mainframe.conversion;

import java.io.File;
import java.nio.charset.Charset;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.io.FileUtils;
import org.w3c.dom.Document;

import net.sf.cb2xml.Cb2Xml;

public class Cb2Mainframe {
	public static void main(String[] args) throws Exception {
		Cb2XmlDom cb2XML = new Cb2XmlDom();
		GenerateMainframe generateMainframe = new GenerateMainframe();
		
		//Creating results folder
		File directory = new File("results");
		if (!directory.exists()) {
			directory.mkdir();
		} else {
			FileUtils.cleanDirectory(directory);
		}

		//Generating XML from Copybook
		File filesList[] = new File("data").listFiles();
		for (File file : filesList) {
			if (file.getName().contains(".CPY")) {
				//cb2XMLDOM(file.getName());
				cb2XML.cb2XMLDOM(file.getName());
			}
		}
		
		//Generate text file from copyboox xml and json
		File xmlFilesList[] = new File("results").listFiles();
		String jsonInput = FileUtils.readFileToString(new File("data/Json_Input.json"), Charset.forName("UTF-8"));
		for (File file : xmlFilesList) {
			if (file.getName().contains(".xml")) {
				generateMainframe.readXMLAndGenerateTxt(file.getName(), jsonInput);
			}
		}
	}
	
	private static void cb2XMLDOM(String fileName) throws Exception {
		Document cb2doc = Cb2Xml.convertToXMLDOM(new File("data/" + fileName));
		Transformer transformer = TransformerFactory.newInstance().newTransformer();
		Result output = new StreamResult(new File("results/" + fileName.split("\\.")[0] + ".xml"));
		Source input = new DOMSource(cb2doc);
		transformer.transform(input, output);
		
//		Document var1 = XmlUtils.fileToDom("C:/Users/183466/workspace/EBCDIC/results/CPRCTPCB.xml");
//		Document var2 = XmlUtils.fileToDom("C:/Users/183466/workspace/EBCDIC/data/Json_Input.json");
//		String out = new XmlToMainframe().convert(var1, var2);
//		System.out.println(out);
		
	}
}
