/**
 * @author ajaykg
 * last_updated_by:  abhishekkr 
 */

package netPaket;

import java.io.FileOutputStream;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.channels.SocketChannel;
import java.nio.channels.WritableByteChannel;
import java.nio.charset.Charset;

public class Packet {
	
	public void sendPacket(String ipAddress, int portNo, StringBuffer request){
		CharBuffer requestChars = CharBuffer.wrap(request);
		Charset charset = Charset.forName("ISO-8859-1");
		ByteBuffer requestBytes = charset.encode(requestChars);
		sendPacket(ipAddress, portNo, requestBytes);
	}

	
	public void sendPacket(String ipAddress, int portNo, ByteBuffer request){
		
		SocketChannel server = null;
		FileOutputStream outputStream = null;
		WritableByteChannel destination = null;
		
		SocketAddress serverAddress = new InetSocketAddress(ipAddress, portNo);
		try {
			server = SocketChannel.open(serverAddress);
			server.write(request);
			
			outputStream = new FileOutputStream("response.txt");
		    destination = outputStream.getChannel();
		    ByteBuffer data = ByteBuffer.allocateDirect(32 * 1024);
		      
		    while(server.read(data) != -1) {
		    	  data.flip();
		    	  while(data.hasRemaining())
		    		  destination.write(data);
		    	  data.clear();
		    }
		    destination.write(data);
			
		} catch (IOException e) {
			System.out.println("closed or wrong port");
		}finally {
			try{
				
				if(server != null && server.isOpen())
					server.close();
				
				if(outputStream != null)
					outputStream.close();
			}catch(IOException e){
				
			}
		}
	}

}
