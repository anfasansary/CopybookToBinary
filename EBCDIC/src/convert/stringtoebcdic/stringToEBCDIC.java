package convert.stringtoebcdic;

public class stringToEBCDIC {
	public static void main(String[] args) throws java.io.UnsupportedEncodingException {
		String sEbcdic = "this is a comment";
		
		try {
			String convEbcdic = new String(sEbcdic.getBytes(),"Cp037");
			///String convEbcdic = new String(sEbcdic.getBytes(),"Cp1047");
			System.out.println("EBCDIC : " + convEbcdic);
			}
			catch (java.io.UnsupportedEncodingException use)
			{
			System.out.println("e = " + use);
			}
	}
}
