package com.copybookdataviewgenerator;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;

import net.sf.cb2java.copybook.Copybook;
import net.sf.cb2java.data.Data;
import net.sf.cb2java.data.GroupData;
import net.sf.cb2java.data.Record;

public class cb2Java {
	public static void main(String[] args) throws FileNotFoundException, IOException{
		Copybook document = parse("SAMPLE", new FileReader("data/SAMPLE.CPY"));

		Record documentData = (Record) document.parseData(new FileInputStream("simple.data"));

		recurse(documentData, "");
	}

	private static Copybook parse(String string, FileReader fileReader) {
		// TODO Auto-generated method stub
		return null;
	}

	static void recurse(GroupData group, String indent) {
		for (Iterator i = group.getChildren().iterator(); i.hasNext();) {
			Data data = (Data) i.next();

			System.out.print(indent + data.getName() + ": ");

			if (data.isLeaf()) {
				System.out.println(data.getValue());
			} else {
				System.out.println();
				recurse((GroupData) data, indent + "  ");
			}
		}
	}
}
