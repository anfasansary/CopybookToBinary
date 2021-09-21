package convert.stringtoebcdic;

import java.io.StringWriter;

import com.legstar.coxb.transform.AbstractHostToJsonTransformer;
import com.legstar.coxb.transform.HostTransformException;
import com.legstar.coxb.util.*;
import com.legstar.coxb.common.*;
import com.legstar.coxb.transform.*;
import com.legstar.coxb.convert.*;
import com.legstar.coxb.host.*;

public class copybookTOXML {

	public static void main(String[] args) {
		
	}
	
	public void hostToJsonTransform(final byte[] hostBytes)
			 throws HostTransformException {
//			 DfhcommareaJsonTransformers transformers =
//			 new DfhcommareaJsonTransformers();
			 StringWriter writer = new StringWriter();
//			 transformers.toJson(hostBytes, writer);
	}
}
