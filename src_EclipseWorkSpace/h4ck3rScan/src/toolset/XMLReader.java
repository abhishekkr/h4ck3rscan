/**
 * @author ajaykg
 * last_updated_by:  abhishekkr 
 */

package toolset;

import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XMLReader {
	
	public static StringBuffer parsePacketData(String XMLFileName){
		File file = new File(XMLFileName);
		StringBuffer buffer = new StringBuffer();
		DocumentBuilderFactory  dbf = DocumentBuilderFactory.newInstance();
		try {
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(file);
			doc.getDocumentElement().normalize();
			//System.out.println("root element: " + doc.getDocumentElement().getNodeName());
			NodeList nodeList = doc.getElementsByTagName("line");
						
			for(int count=0; count < nodeList.getLength(); count++){
				Node node = nodeList.item(count);
				if(node.getNodeType() == Node.ELEMENT_NODE){
					Element element = (Element) node;
					NodeList fstNmElmntLst = element.getElementsByTagName("linevalue");
				    Element fstNmElmnt = (Element) fstNmElmntLst.item(0);
				    NodeList fstNm = fstNmElmnt.getChildNodes();
				    //System.out.println(((Node) fstNm.item(0)).getNodeValue());
				    buffer.append(((Node) fstNm.item(0)).getNodeValue());
				    buffer.append("\r\n");
				}
			}
			buffer.append("\r\n");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(buffer);
		return buffer;
	}

}
