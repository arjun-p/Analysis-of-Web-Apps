import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

public class ica9 {

	// HashMap: TestSuite< LineOfCode: <FailedCount>,<PassCount>>
	static TreeMap<Integer, ArrayList<Integer>> mapLogin = new TreeMap<Integer,ArrayList<Integer>>();
	static TreeMap<Integer, ArrayList<Integer>> mapDefault = new TreeMap<Integer,ArrayList<Integer>>();
	static TreeMap<Integer, ArrayList<Integer>> mapOrder = new TreeMap<Integer,ArrayList<Integer>>();
	static  ArrayList<TreeMap<Integer, ArrayList<Integer>>> mapList = new ArrayList<TreeMap<Integer, ArrayList<Integer>>>(); 	
	static Set<String> passTests = new HashSet<String>();
	static Set<String> failTests = new HashSet<String>();
	static Set<Integer> analyzedLines = new HashSet<Integer>();
	static int totalLogin=0;
	static int totalDefault=0;
	static int totalOrder=0;
	static int passLogin=0;
	static int passDefault=0;
	static int passOrder=0;
	static Map<Integer,Double> maxFault = new HashMap<Integer,Double>();
	static String dir;
	static StringBuffer sb = new StringBuffer();

	/*
	 * args[0] - Directory which has all the test case coverage files
	 */
	public static void main(String[] args) {
		ArrayList<String> fileList = new ArrayList<String>();
		ArrayList<String> filePattern = new ArrayList<String>();
		filePattern.add("Login");
		filePattern.add("Default");
		filePattern.add("Order");
		dir = args[0];
		//String dir = "C:\\Users\\Arjun\\Desktop\\ica9";
		String fileName;
		int val = 0;
		
		mapList.add(mapLogin);
		mapList.add(mapDefault);
		mapList.add(mapOrder);
		
	
		try{
			 final File folder = new File(dir);
			 fileList = listFilesForFolder(folder);
 
			// Find out if the test case failed or passed
			// Add it to failTests or passTests
			File passFail = new File(dir + "/failPass.txt");
			//File passFail = new File(dir + "\\failPass.txt");
			FileReader fileReaderPF = new FileReader(passFail);
			BufferedReader bufferedReaderPF = new BufferedReader(fileReaderPF);
			String line;
			while ((line = bufferedReaderPF.readLine()) != null) {
				String testCase= line.split(":")[0];
				String result = line.split(":")[1];
				//System.out.println(testCase);
				if(result.equals("pass")){
					passTests.add(testCase);
					if(testCase.contains("Login")){
						totalLogin++;
						passLogin++;
					 }
					 else if(testCase.contains("Default")){
						 totalDefault++;
						 passDefault++;
					 }
					 else if(testCase.contains("Order")){
						 totalOrder++;
						 passOrder++;
					 }
				}
				else{
					failTests.add(testCase);
					if(testCase.contains("Login")){
						totalLogin++;
						
					 }
					 else if(testCase.contains("Default")){
						 totalDefault++;
						 
					 }
					 else if(testCase.contains("Order")){
						 totalOrder++;	 
					 }
				}
			}

			fileReaderPF.close();
			String testCase;
			for(int j=0;j<fileList.size();j++){ 
				fileName = fileList.get(j);
				if(fileName.contains("Login") && fileName.contains("coberturaCoverage.txt")){
					val = 0;
				 }
				 else if(fileName.contains("Default") && fileName.contains("coberturaCoverage.txt")){
					val = 1;
				 }
				 else if(fileName.contains("Order") && fileName.contains("coberturaCoverage.txt")){
					val = 2;
				 }
				 else{
					 continue;
				 }	 
				//System.out.println("File Name: " + fileName);
				File file = new File(dir + "/" + fileName);
				//File file = new File(dir + "\\" + fileName);
				FileReader fileReader = new FileReader(file);
				BufferedReader bufferedReader = new BufferedReader(fileReader);
				// Don't increment if same lines multiple occurrences in same type of file (Eg. Login)
				analyzedLines.clear();
				testCase = fileName.split("_")[0];
				System.out.println(testCase);
				while ((line = bufferedReader.readLine()) != null) {
					String loc=line.split(":")[1].trim();
					int iLoc = Integer.parseInt(loc);
					// Check whether the line number is present in map. Increment the pass or fail count.
					if(!mapList.get(val).containsKey(iLoc)){
						//System.out.println("1: " + testCase +":" + iLoc);
						ArrayList<Integer> temp = new ArrayList<Integer>();
						temp.add(0);
						temp.add(0);
						if(passTests.contains(testCase)){
							//Pass - Index 0
							if(!analyzedLines.contains(iLoc)){
								//System.out.println("1: Pass: " + testCase +":" + iLoc);
								temp.set(0, temp.get(0) + 1);
								mapList.get(val).put(iLoc, temp);
							}
						}
						else{
							//Fail - Index 1
							if(!analyzedLines.contains(iLoc)){
								//System.out.println("1: Fail: " + testCase +":" + iLoc);
								temp.set(1, temp.get(1) + 1);
								mapList.get(val).put(iLoc, temp);
							}
						}
					}
					else{
						if(passTests.contains(testCase)){	
							if(!analyzedLines.contains(iLoc)){
								//System.out.println("2: Pass: " + testCase +":" + iLoc);
								ArrayList<Integer> temp = mapList.get(val).get(iLoc);
								temp.set(0, temp.get(0) + 1);
								mapList.get(val).put(iLoc, temp);
							}
						}
						else{
							if(!analyzedLines.contains(iLoc)){
								//System.out.println("2: Fail: " + testCase +":" + iLoc);
								ArrayList<Integer> temp = mapList.get(val).get(iLoc);
								temp.set(1, temp.get(1) + 1);
								mapList.get(val).put(iLoc, temp);
							}
						}
					}	
					analyzedLines.add(iLoc);
				}
				fileReader.close();	
/*				for (Map.Entry<Integer, ArrayList<Integer>> entry : mapList.get(1).entrySet())
				{
				    System.out.println(entry.getKey() + ": " + entry.getValue().get(0) + "," + entry.getValue().get(1));
				}*/
			}
			
			int i=0;
			for(TreeMap<Integer, ArrayList<Integer>> map : mapList){
				tarantula(map,i);
				i++;
			}
			
		} catch (IOException e) {
			e.printStackTrace();
	}
	}
	
	//Calculate hue
	public static void tarantula(TreeMap<Integer, ArrayList<Integer>> map, int i){
		double maxHue = 0;
		int faultyLine = 0;
		double pass;
		double fail;	
		double totalFail;
		double totalPass;
		double hue;
		int line;
		String testSuite = "";
		
		if(map.isEmpty()){
			return;
		}
		
		for (Map.Entry<Integer, ArrayList<Integer>> entry : mapList.get(i).entrySet())
		{
			line = entry.getKey();
			pass = entry.getValue().get(0);
			fail = entry.getValue().get(1);			
			totalFail = 0;
			totalPass = 0;

			if(i==0){
				testSuite = "Login";
				totalPass = passLogin;
				totalFail = totalLogin - passLogin;
			 }
			 else if(i==1){
				testSuite = "Default";
				totalPass = passDefault;
				totalFail = totalDefault - passDefault;
			 }
			 else if(i==2){
				testSuite = "OrdersGrid";
				totalPass = passOrder;
				totalFail = totalOrder - passOrder;
			 }
	
			if(totalFail != 0 && totalPass != 0){
				hue = (fail/totalFail)/((pass/totalPass)+ (fail/totalFail));
			}
			else{
				hue = 0;
			}
			// Keep track of the maximum suspicious line
			if(hue > maxHue){
				maxHue = hue;
				faultyLine = line;
			}

			if((testSuite.contains("Login") && line==459) || (testSuite.contains("OrdersGrid") && line==538) || (testSuite.contains("Default") && line==972)){
				System.out.println(testSuite + ": " +  "Line: "+ line + " : Suspiciousness Factor: " + hue);
			}

			sb.append(testSuite + ": " +  " Line: "+ line + " : Suspiciousness Factor " + hue);
			sb.append("\n");

		}
		System.out.println(testSuite + ": MaxSuspiciousness: " +  " Line: "+ faultyLine + " :Factor " + maxHue);
		
		//Write to file
		try {
			  	File file = new File(dir + "/" + testSuite + ".suspiciousness.txt");
	      		BufferedWriter output = new BufferedWriter(new FileWriter(file));
	      		output.write(sb.toString());
	      		output.close();
   	    } 
   	    catch ( IOException e ) {
     		  e.printStackTrace();
    	}
	}
	
	// Get list of test case files in the directory
	public static ArrayList<String> listFilesForFolder(final File folder) {
		ArrayList<String> fileList = new ArrayList<String>(); 
	     for (final File fileEntry : folder.listFiles()) {
	         if (fileEntry.isDirectory()) {
	             listFilesForFolder(fileEntry);
	         } else {
	             //System.out.println(fileEntry.getName());
	        	 fileList.add(fileEntry.getName());
	         }
	     }
		return fileList;
	 }

}
