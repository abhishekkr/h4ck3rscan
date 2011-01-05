/**
 * @author abhishekkr 
 * last_updated_by:  abhishekkr
 */

package sCanR;

//import java.net.ServerSocket;
import java.net.Socket;
import java.io.*;
import java.util.*;



/**
 * just check for a PORT 
 * gets input from a CSV file
 */

/**
 * @author AbhishekKr
 * @category N/W Programming
 */
public class Main{
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String fileCSV=null;
		
		if(args.length == 1){
			fileCSV=args[0];
			System.out.println("\nReading from : " + fileCSV);
		}
		else{
			System.out.println("Error: Wrong Syntax\n");
			System.out.println("Syntax: portChk.jar <CSVFile(mandatory)>");
			System.exit(1);
		}
		
		readCSV(fileCSV);
	}//end of main

	private static void readCSV(String fileCSV){
		try{
			File file = new File(fileCSV);
			BufferedReader bufRedr = new BufferedReader(new FileReader(file));
			String line = null;
			while((line = bufRedr.readLine()) != null){
				StringTokenizer st = new StringTokenizer(line,",");
				int toknNum = 0;
				String ipAddr=null;
				String portNum =null;
				String msg =null;
				while (st.hasMoreTokens()){
					if(toknNum==0)
						ipAddr = st.nextToken();
					else if(toknNum==1)
						portNum = st.nextToken();
					else if(toknNum==2)
						msg = st.nextToken();
					toknNum++;
				}//parsing each ,
				if(checkPort(ipAddr, Integer.parseInt(portNum))==true)
					System.out.println("@" + ipAddr + " :: " + msg);
			}//parsing each line
			bufRedr.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}//end of readCSV
	
	private static boolean checkPort(String ipAddr, int portNum){
		//private static ServerSocket servSock;
		//private static int PORT = 80;
		Socket sok = null;
		System.out.println("\nTrying to open Port# " + portNum);
		try {
			//servSock = new ServerSocket(portNum);
			sok = new Socket(ipAddr, portNum);
			sok.close();
			return true;
		} catch (Exception e) {
			System.out.println("Unable to attach to PORT " + portNum + " @IP: " + ipAddr);
			//System.out.println("\nTraceString: ");//e.printStackTrace();
			//System.exit(-1);
		}
		return false;
	}
}
