package com.mainframe.conversion;

import java.io.File;
import java.io.IOException;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;

import net.sf.cb2xml.Cb2Xml;

public class Cb2XmlDom {
	public void cb2XMLDOM(String fileName) throws Exception {
		Document cb2doc = Cb2Xml.convertToXMLDOM(new File("data/"+fileName));
		Transformer transformer = TransformerFactory.newInstance().newTransformer();
		Result output = new StreamResult(new File("results/" + fileName.split("\\.")[0] + ".xml"));
		Source input = new DOMSource(cb2doc);
		transformer.transform(input, output);
	}
	
	public void cb2XMLCommandLine(String fileName) throws IOException {
		String commandLine = "java -jar ./libraries/cb2xml-1.01.1.jar -cobol ./data/" + fileName
				+ " -indentXml  -xml ./results/" + fileName + ".xml";
		Runtime.getRuntime().exec(commandLine);
	}
}
