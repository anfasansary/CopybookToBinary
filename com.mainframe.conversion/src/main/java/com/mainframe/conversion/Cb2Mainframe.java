package com.mainframe.conversion;

import java.io.File;
import java.nio.charset.Charset;

import org.apache.commons.io.FileUtils;

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
}
