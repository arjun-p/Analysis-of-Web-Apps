#!/bin/bash -vx

# Set format to capture running time of each test in seconds 
TIMEFORMAT=%R

HOME=/home/student/webapps
COBERTURA_SER=/tmp/cobertura
SER_FILE=cobertura-bkfl.ser 
ICA9=/home/student/webapps/9
TESTCASES=/home/student/webapps/9/testcase
TESTCASESNOASSERT=/home/student/webapps/9/testcase1
TESTRESULT=/home/student/webapps/9/testresult
WEBAPP=/home/student/webapps/bkfl
TESTSELENIUM=/home/student/webapps/bkfl/src
REPORT=/home/student/webapps/bkfl/report


# To Clean up results from previous run
files=$(ls $TESTRESULT 2> /dev/null | wc -l)
if [ "$files" != "0"  ] 
then
	rm $TESTRESULT/*
fi 


# To remove previous test case from the directories while executing all the tests one by one
function cleanUp {
	# Remove selinium test case class file if present
	
	files=$(ls $TESTSELENIUM/classes/*.class 2> /dev/null | wc -l)
	if [ "$files" != "0"  ] 
	then
		rm $TESTSELENIUM/classes/*.class
	fi 

	# Remove selinium test case java file if present
	files=$(ls $TESTSELENIUM/*.java 2> /dev/null | wc -l)	
	if [ "$files" != "0" ] 
	then
		rm $TESTSELENIUM/*.java
	fi 
	
	# Remove Dumpservlet file from previous tests
	files=$(ls $HOME/DumpServlet*.* 2> /dev/null | wc -l)	
	if [ "$files" != "0" ] 
	then
		rm $HOME/DumpServlet*.*
	fi

	files=$(ls $COBERTURA_SER/$SER_FILE 2> /dev/null | wc -l)	
	if [ "$files" != "0" ] 
	then
		rm $COBERTURA_SER/$SER_FILE 
	fi
}



# Run selenium test case, flush cobertura to get coverage and generate report
function runSelenium {
	TIME=$( { time ant test > /dev/null; } 2>&1 )
	echo $TIME >> $TESTRESULT/timeAnalysis.txt
	wget http://localhost:8080/bkfl/DumpServlet.jsp
	ant report
	echo "Report generated"
	mysql --user=root --password=tawa  < /home/student/webapps/bookstore-orig/database/bookstore.sql	
}

################################################
# Part1 - Deploy
################################################

cleanUp

# Deploy application
cd $HOME
ant undeploy
ant instrument
ant deploy
cp $COBERTURA_SER/$SER_FILE  $ICA9/
###############################################
#Part2 - Get the lines covered by each test case
###############################################

echo "Running individual selenium tests"

files=( $TESTCASES/*.java )

for file in "${files[@]}"
do
	# Get basename of file
	filename="${file##*/}"

	# Remove file extension
  	testcase="${filename%.*}"
  		
  	cleanUp

  	# Capture coverage for each test case
	cp $ICA9/$SER_FILE $COBERTURA_SER

	chmod 777 $COBERTURA_SER/$SER_FILE

  	echo "Running test case : $testcase"

  	# Copy test case to selenium source folder
	cp $file $TESTSELENIUM

	ant test >  $TESTRESULT/${testcase}.out
	
	wget http://localhost:8080/bkfl/DumpServlet.jsp

	count=`grep -l "Failures: 0, Errors: 0" $TESTRESULT/${testcase}.out  | wc -l`

	 if [[ $count -ne 1 ]]; then

	 	# This file is used to check whether the test has passed or failed.
	 	echo "$testcase:fail" >> $TESTRESULT/failPass.txt

	 else
		echo "$testcase:pass" >> $TESTRESULT/failPass.txt	 	
	 fi


	rm $TESTRESULT/${testcase}.out

	ant report

	echo "Report generated"

	mysql --user=root --password=tawa  < /home/student/webapps/bookstore-orig/database/bookstore.sql	  	

	sleep 2

	python $ICA9/parser.py  $WEBAPP/report/coverage.xml $TESTRESULT/${testcase}_coberturaCoverage.txt

	sleep 2

	mv $WEBAPP/report/coverage.xml  $TESTRESULT/${testcase}_coverage.xml 
		
done

#Part 3 - Seeded Faults
#1. Login_jsp.java, line 459
#2. OrdersGrid_jsp.java, line 538
#3. Default_jsp.java line 972

javac $ICA9/ica9.java; 
cd $ICA9;
java ica9 $TESTRESULT

cleanUp
