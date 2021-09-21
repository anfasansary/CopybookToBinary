package convert.stringtoebcdic;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;

public class stringToEBCDIC_2 {
	public static void main(String[] args) throws Exception {
        String[] names = {
                "IBM037", "IBM038", "IBM274", "IBM275", "IBM277",
                "IBM278", "IBM280", "IBM281", "IBM285", "IBM290",
                "IBM297", "IBM420", "IBM423", "IBM424", "IBM500","Cp037"
        };
        for (String charset : names) {
            System.out.println("charset " + charset + " supported: " + Charset.isSupported(charset));
        }
        System.out.println("");
        final String convertThis = "a   A  B  b";
        // write out the original data
        System.out.println("Original: " + convertThis);
        // print out the ascii bytes in hex to verify
        byte[] bytes = convertThis.getBytes();
        System.out.print("ASCII bytes: ");
        for (int i = 0; i < bytes.length; i++) {
//            System.out.print("0x");
            System.out.print(Integer.toString(bytes[i] & 0xff, 16).toUpperCase());
//            System.out.print(",");
        }
        System.out.println("");
        // convert it to EBCDIC charset IBM037
        ByteArrayOutputStream array = new ByteArrayOutputStream(convertThis.length());
        OutputStreamWriter out = new OutputStreamWriter(array, Charset.forName("Cp037"));
        out.write(convertThis);
        out.close();
        
        // print out the EBCDIC bytes in hex to verify
        bytes = array.toByteArray();
        System.out.print("EBCDIC bytes: ");
        for (int i = 0; i < bytes.length; i++) {
//            System.out.print("0x");
            System.out.print(Integer.toString(bytes[i] & 0xff, 16).toUpperCase());
//            System.out.print(",");
        }
//        System.out.println("");
//        // convert the EBCDIC data back to int
//        ByteArrayInputStream byteIn = new ByteArrayInputStream(bytes);
//        InputStreamReader in = new InputStreamReader(byteIn, Charset.forName("Cp037"));
//        BufferedReader bufIn = new BufferedReader(in);
//        String line = null;
//        while ((line = bufIn.readLine()) != null) {
//            System.out.println("Converted: " + line);
//        }
//        bufIn.close();
    }
}
