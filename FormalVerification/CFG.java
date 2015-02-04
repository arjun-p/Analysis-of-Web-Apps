import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.SortedMap;
import java.util.TreeMap;

import org.apache.bcel.classfile.ClassParser;
import org.apache.bcel.classfile.JavaClass;
import org.apache.bcel.classfile.Method;
import org.apache.bcel.generic.BranchHandle;
import org.apache.bcel.generic.BranchInstruction;
import org.apache.bcel.generic.ConstantPoolGen;
import org.apache.bcel.generic.GOTO;
import org.apache.bcel.generic.INVOKESTATIC;
import org.apache.bcel.generic.Instruction;
import org.apache.bcel.generic.InstructionHandle;
import org.apache.bcel.generic.InstructionList;
import org.apache.bcel.generic.InstructionTargeter;
import org.apache.bcel.generic.InvokeInstruction;

public class CFG {
	// Static Dotty file strings.
	protected static final String[] dottyFileHeader = new String[] {
			"digraph control_flow_graph {", "",
			"	node [shape = rectangle]; entry exit;",
			"	node [shape = circle];", "" };
	protected static final String[] dottyFileFooter = new String[] { "}" };
	protected static final String dottyEntryNode = "entry";
	protected static final String dottyExitNode = "exit";
	// Dotty file edge templates.
	protected static final int entryIdx = -1;
	protected static int exitIdx;
	protected static final String dottyLineFormat = "	%1$s -> %2$s;%n";
	protected static final String dottyLineLabelFormat = "	%1$s -> %2$s [label = \"%3$s\"];%n";
	private static String graph = "";
	//final ConstantPoolGen cpg=classGen.getConstantPool();

	// Map associating line number with instruction.
	SortedMap<Integer, InstructionHandle> statements = new TreeMap<Integer, InstructionHandle>();
	private TreeMap<Integer, ArrayList<Integer>> outGraph = new TreeMap<Integer, ArrayList<Integer>>();
	private TreeMap<Integer, ArrayList<Integer>> inGraph = new TreeMap<Integer, ArrayList<Integer>>();

	private TreeMap<Integer, HashSet<Integer>> inList = new TreeMap<Integer, HashSet<Integer>>();
	private TreeMap<Integer, HashSet<Integer>> outList = new TreeMap<Integer, HashSet<Integer>>();
	private TreeMap<String, HashSet<Integer>> location = new TreeMap<String, HashSet<Integer>>();
	
	private static ConstantPoolGen cpg;

	/**
	 * Loads an instruction list and creates a new CFG.
	 * 
	 * @param instructions
	 *            Instruction list from the method to create the CFG from.
	 *            
	 *            
	 *  16 = MB
	 *  19 = MA
	 *  22 = MJ
	 *  25 = MG
	 *  28 = ME
	 *  30 = MC
	 *  34 = MD
	 *  43 = MF
	 *  46 = MH
	 *                   
	 */
	public CFG(InstructionList instructions) {
		
		StringBuilder sb = new StringBuilder();
		
		int GoTo = 0;
		
		InstructionHandle[] instha = instructions.getInstructionHandles();
		
		boolean isFirst = true;
		
		
		
		for (InstructionHandle instr : instha) {
			
			GoTo = 0;

			statements.put(instr.getPosition(), instr);

			//Entry Node
			if (isFirst) {
				graph += String.format(dottyLineFormat, dottyEntryNode,
						instr.getPosition());
				// Add edge between entry node and first node(instruction)
				addEdge(entryIdx, instr.getPosition());
				isFirst = false;
			}
			
			
			org.apache.bcel.generic.Instruction inst = instr.getInstruction();
			
			// Method Invocation
			if (inst instanceof org.apache.bcel.generic.INVOKESTATIC){	   
			   
			   INVOKESTATIC invInstr = (INVOKESTATIC) instr.getInstruction();
			   
			   System.out.println("Position: " + instr.getPosition() + " Instr: " + instr.getInstruction().getName() + 
					   " Method: " + invInstr.getMethodName(cpg) + " ***");
			   
			   // Get the method invoked
			   String invokedMethod = invInstr.getMethodName(cpg);
			   
			   // Get the node(instruction) where method was invoked
			   int instrInvokingMethod = instr.getPosition();
			   
			   // Populate location < MethodName, Set<Nodes where the methods are invoked>>
			   if(location.get(invokedMethod) == null){
				   HashSet<Integer> h = new HashSet<Integer>();
				   h.add(instrInvokingMethod);
				   location.put(invokedMethod, h );
			   }
			   else{
				  location.get(invokedMethod).add(instrInvokingMethod);
			   }
			   
			}
			
			//Branch Instruction
			if (instr instanceof BranchHandle) {

				BranchInstruction bi = (BranchInstruction) instr.getInstruction();
				if (bi instanceof GOTO) {
					GoTo = 1;
				}
				
				InstructionHandle ih = bi.getTarget();

				graph += String.format(dottyLineFormat, instr.getPosition(),
						ih.getPosition());
				addEdge(instr.getPosition(), ih.getPosition());

			}

			
			if (GoTo != 1) {
				if (instr.getNext() != null) {
					graph += String.format(dottyLineFormat,
							instr.getPosition(), instr.getNext().getPosition());
					addEdge(instr.getPosition(), instr.getNext().getPosition());
				} else {
					// add edge from last to exit node
					graph += String.format(dottyLineFormat,
							instr.getPosition(), dottyExitNode);
					exitIdx = instr.getPosition() + 1;
					addEdge(instr.getPosition(), exitIdx);

				}
			}

		} 
		
		//Create in and out list
		inAndOutAlgo();
		
		//Reachability Test
		sb.append("\n***Reachability Test***\n\n");
		
		if (location.get("MA") != null && location.get("MB") != null){
			int k = 0;
			for(Integer i : location.get("MA")){
				for(Integer j : location.get("MB")){
					if(outList.get(i).contains(j)){
						sb.append("Reachable from MA to MB: " + i + " -> " + j + "\n");
						k++;
					}
				}
			}
			if(k==0){
				sb.append("Not reachable from MA to MB \n" );
			}
			else{
				sb.append("Number of calls from MA reaching a call to MB: " + k  + "\n\n");
			}
		}
		
		if (location.get("MC") != null && location.get("MG") != null){
			int k = 0;
			for(Integer i : location.get("MC")){
				for(Integer j : location.get("MG")){
					if(outList.get(i).contains(j)){
						sb.append("Reachable from MC to MG: " + i + " -> " + j + "\n");
						k++;
					}
				}
			}
			if(k==0){
				sb.append("Not reachable from MC to MG \n");
			}
			else{
				sb.append("Number of calls from MC reaching a call to MG: " + k + "\n\n");
			}
		}
		
		if (location.get("MF") != null && location.get("MH") != null){
			int k = 0;
			for(Integer i : location.get("MF")){
				for(Integer j : location.get("MH")){
					if(outList.get(i).contains(j)){
						sb.append("Reachable from MF to MH: " + i + " -> " + j  + "\n");	
						k++;
					}
				}
			}
			if(k==0){
				sb.append("Not reachable from MF to MH \n");
			}
			else{
				sb.append("Number of calls from MF reaching a call to MH: " + k + "\n\n");
			}
		}
		
		if (location.get("MJ") != null && location.get("ME") != null){
			int k = 0;
			for(Integer i : location.get("MJ")){
				for(Integer j : location.get("ME")){
					if(outList.get(i).contains(j)){
						sb.append("Reachable from MJ to ME: " + i + " -> " + j + "\n");
						k++;
					}
				}
			}
			if(k==0){
				sb.append("Not reachable from MJ to ME \n");
			}
			else{
				sb.append("Number of calls from MJ reaching a call to ME: " + k  + "\n\n");
			}
		}
		
		
		if (location.get("MD") != null){
			int k = 0;
			int z =0;
			for(Integer i : location.get("MD")){
				for(Integer j : location.get("MD")){
					if(inList.get(i).contains(j)){
						sb.append("Reachable from MD to MD: " + i + " -> " + j + "\n");
						k++;
						if(i==j){
						z=1;

}

					}
					
				}
			}
if(z==1){
				sb.append("Node invoking MD reachable to itself \n");
}
else{
				sb.append("Node invoking MD  not reachable to itself \n");
}
			if(k==0){
				sb.append("No calls from MD reaching a call to MD \n");
			}
			else{
				sb.append("Number of calls from MD reaching a call to MD: " + k  + "\n\n");
			}
		}
		
		out(sb);
	
		

	}
	
	public static void out(StringBuilder text){
		try{
			String outputFileName = "/home/student/webapps/ICA6/test/out.txt";
			File file = new File(outputFileName);
			if(!file.exists())
				file.createNewFile();
			else{
				file.delete();
				file.createNewFile();
			}
			FileOutputStream out = new FileOutputStream(file);
			out.write(text.toString().getBytes());
			out.close();
		}
		catch(Exception e){
			System.out.println("Unable to write output file");
		}
	}

	public void addEdge(int from, int to) {
		if (!outGraph.containsKey(from)) {
			outGraph.put(from, new ArrayList<Integer>());
		}
		outGraph.get(from).add(to);
		if (!inGraph.containsKey(to)) {
			inGraph.put(to, new ArrayList<Integer>());
		}
		inGraph.get(to).add(from);
	}

	public void inAndOutAlgo() {

		for (Integer i : outGraph.keySet()) {
			HashSet<Integer> h = new HashSet<Integer>();
			h.add(i);
			outList.put(i, h);
		}
		
		for (Integer i : outList.keySet()) {
			System.out.println("outList " + i + " "
					+ Arrays.toString(outList.get(i).toArray()));
		}
		
		inGraph.remove(exitIdx);
		boolean hasChanged = true;
		while (hasChanged) {
			hasChanged = false;

			for (Integer i : inGraph.keySet()) {
				HashSet<Integer> tmp = new HashSet<>();
				for (Integer v : inGraph.get(i)) {
					tmp.addAll(outList.get(v));
				}
				if (inList.containsKey(i)) {
					inList.get(i).addAll(tmp);
				} else {
					inList.put(i, tmp);
				}
				HashSet<Integer> otmp = new HashSet<>();
				otmp.addAll(tmp);
				otmp.add(i); // gen
				if (!otmp.equals(outList.get(i))) {
					outList.get(i).addAll(otmp);
					hasChanged = true;
				}

			}
		}
		for (Integer s : outList.keySet()) {
			System.out.println("Node:"+ s);
			System.out.println(Arrays.toString(outList.get(s).toArray()));

		}
		
		for (Integer s : inList.keySet()) {
			System.out.println("IN:"+ s);
			System.out.println(Arrays.toString(inList.get(s).toArray()));}
		
		

	}

	/**
	 * Generates a Dotty file representing the CFG.
	 * 
	 * @param out
	 *            OutputStream to write the dotty file to.
	 */
	public void generateDotty(OutputStream _out) {
		try {

			for (String head : dottyFileHeader) {
				_out.write(head.getBytes(Charset.forName("UTF-8")));
				_out.write(String.format("%n").getBytes());

			}

			String example = "0 -> 2;2 -> 3;3 -> 6;6 -> 9;9 -> 10;";

			_out.write(graph.getBytes(Charset.forName("UTF-8")));
			for (String footer : dottyFileFooter) {
				_out.write(footer.getBytes(Charset.forName("UTF-8")));
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// _out.write(dottyFileHeader);
	}

	/**
	 * Main method. Generate a Dotty file with the CFG representing a given
	 * class file.
	 * 
	 * @param args
	 *            Expects two arguments: <input-class-file> <output-dotty-file>
	 */
	public static void main(String[] args) {
		PrintStream error = System.err;
		PrintStream debug = new PrintStream(new OutputStream() {
			@Override
			public void write(int b) throws IOException {
				// TODO Auto-generated method stub

			}
		});

		// Check arguments.
		if (args.length != 2) {
			error.println("Wrong number of arguments.");
			error.println("Usage: CFG <input-class-file> <output-dotty-file>");
			System.exit(1);
		}
		String inputClassFilename = args[0];
		String outputDottyFilename = args[1];
		
		// Parse class file.
		debug.println("Parsing " + inputClassFilename + ".");
		JavaClass cls = null;
		try {
			cls = (new ClassParser(inputClassFilename)).parse();
			 Method[] methods = cls.getMethods();
			 cpg = new ConstantPoolGen(cls.getConstantPool());
			 	
			
		} catch (IOException e) {
			e.printStackTrace(debug);
			error.println("Error while parsing " + inputClassFilename + ".");
			System.exit(1);
		}

		// Search for main method.
		debug.println("Searching for main method:");
		Method mainMethod = null;
		for (Method m : cls.getMethods()) {
			debug.println("   " + m.getName());
			if ("main".equals(m.getName())) {
				mainMethod = m;
				break;
			}
		}
		if (mainMethod == null) {
			error.println("No main method found in " + inputClassFilename + ".");
			System.exit(1);
		}

		// Create CFG.
		debug.println("Creating CFG object.");
		CFG cfg = new CFG(new InstructionList(mainMethod.getCode().getCode()));

		// Output Dotty file.
		debug.println("Generating Dotty file.");
		try {
			OutputStream output = new FileOutputStream(outputDottyFilename);
			cfg.generateDotty(output);
			output.close();
		} catch (IOException e) {
			e.printStackTrace(debug);
			error.println("Error while writing to " + outputDottyFilename + ".");
			System.exit(1);
		}

		debug.println("Done.");
	}
}
