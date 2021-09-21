package com.copybookdataviewgenerator;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.LinkedHashSet;

public class readCopyBook {

	private static BufferedReader br;

	public static void main(String[] args) throws Exception {
		LinkedHashSet<LinkedHashSet<String> > contentCopyBook = new LinkedHashSet<LinkedHashSet<String> >();
		File file = new File("C:\\Users\\183466\\Desktop\\CPRCTPCB.CPY");

		br = new BufferedReader(new FileReader(file));

		String st;
		while ((st = br.readLine()) != null) {
			if (st.contains("PIC")){
				String[] copybookLine = st.replaceAll("\\s+", " ").split("\\s+");
				LinkedHashSet<String> tempList = new LinkedHashSet<String>();
				for (String result : copybookLine){
					tempList.add(result);
				}
				contentCopyBook.add(tempList);
			}
		}

		System.out.println("END");
	}

}
