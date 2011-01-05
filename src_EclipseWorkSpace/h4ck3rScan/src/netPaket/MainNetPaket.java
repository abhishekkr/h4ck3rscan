/**
 * @author ajaykg
 * last_updated_by:  abhishekkr 
 */

package netPaket;

import toolset.XMLReader;

public class MainNetPaket {

	public boolean paketizr(String[] args){
		if(args.length != 3){
			System.out.println("Wrong no of arguments .... it must be 3 arguments");
			System.exit(0);
		}
		System.out.println(args[0]);
		if(!(args[0].substring(args[0].indexOf('.')+1).equalsIgnoreCase("xml"))) {
			System.out.println("Invalid file type...only XML file will be accepted");
			System.exit(0);
		}
		StringBuffer packetData = new StringBuffer();
		packetData = XMLReader.parsePacketData(args[0]);
		Packet packet = new Packet();
		packet.sendPacket(args[1], Integer.parseInt(args[2]), packetData);
		return true;
	}
}
