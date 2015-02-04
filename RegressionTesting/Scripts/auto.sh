#!/bin/bash -vx

# Set format to capture running time of each test in seconds 
TIMEFORMAT=%R

HOME=/home/student/webapps
COBERTURA_SER=/tmp/cobertura
ICA8=/home/student/webapps/8ICA
TESTCASES=/home/student/webapps/8ICA/test
TESTRESULT=/home/student/webapps/8ICA/testResult
WEBAPP=/home/student/webapps/bookstore-orig
TESTSELENIUM=/home/student/webapps/bookstore-orig/src
REPORT=/home/student/webapps/bookstore-orig/report


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

	files=$(ls $COBERTURA_SER/cobertura-bookstore-orig.ser 2> /dev/null | wc -l)	
	if [ "$files" != "0" ] 
	then
		rm $COBERTURA_SER/cobertura-bookstore-orig.ser 
	fi
}



# Run selenium test case, flush cobertura to get coverage and generate report
function runSelenium {
	TIME=$( { time ant test > /dev/null; } 2>&1 )
	# Sample Output: ++ ant test 2.102
	echo  $TIME | awk  '{print $4}'  >> $TESTRESULT/timeAnalysis.txt
	wget http://localhost:8080/bookstore-orig/DumpServlet.jsp
	ant report
	echo "Report generated"
	mysql --user=root --password=tawa  < /home/student/webapps/bookstore-orig/database/bookstore.sql	
}


################################################
# Part1 - Get Total Coverage of at least 38%
# Running all the test cases together
################################################

cleanUp

# Deploy application
cd $HOME
ant undeploy
ant instrument
ant deploy

# This file holds the time taken by each test case to run
# echo  "TestCase Time" > $TESTRESULT/timeAnalysis.txt

# Make copy of ser file. This file will be replaced after every test
cp ${COBERTURA_SER}/cobertura-bookstore-orig.ser  $ICA8

cp $TESTCASES/*.java $TESTSELENIUM

echo "Total " >> $TESTRESULT/timeAnalysis.txt

runSelenium

# Display Coverage
firefox file:///home/student/webapps/bookstore-orig/report/index.html 2> /dev/null &

# Capture screenshot of the coverage and save it in results folder
scrot -d 2 $TESTRESULT/coverage.png 2> /dev/null &

cp /home/student/webapps/bookstore-orig/selenium-reports/html/junit-noframes.html $TESTRESULT

sleep 3

cleanUp

###############################################
#Part2 - Get the lines covered by each test case
###############################################

echo "Running individual selenium tests"

echo -e "TestCase \t Time" >> $TESTRESULT/timeAnalysis.txt

files=( $TESTCASES/*.java )

for file in "${files[@]}"
do
	# Get basename of file
	filename="${file##*/}"

	# Remove file extension
  	testcase="${filename%.*}"
  		
  	cleanUp

  	# Capture coverage for each test case
	cp $ICA8/cobertura-bookstore-orig.ser /tmp/cobertura/

	chmod 777 /tmp/cobertura/cobertura-bookstore-orig.ser

  	echo "Running test case : $testcase"

  	# Copy test case to selenium source folder
	cp $file $TESTSELENIUM

	echo -n -e "$testcase \t" >> $TESTRESULT/timeAnalysis.txt

	runSelenium  	

	sleep 2
	
	python $ICA8/parser.py  $WEBAPP/report/coverage.xml $TESTRESULT/${testcase}_coberturaCoverage.txt

	sleep 2

	mv $WEBAPP/report/coverage.xml  $TESTRESULT/${testcase}_coverage.xml 

done

#Part 3 - Given the changes, identify test cases to be re-run
#Login_jsp.java {561, 497,505}
#ShoppingCart_jsp.java {502, 623, 732}
#MyInfo_jsp.java {511,658,459}


echo "Test cases to be re-run:" > $TESTRESULT/output.txt
echo >> output.txt

while read line; do
	count=`grep -l $line  $TESTRESULT/*_coberturaCoverage.txt | wc -l`
	if [[ $count -ne 0 ]]; then
		echo "Code Change: " $line >> $TESTRESULT/output.txt
		echo "TestCase:" `grep -l $line  $TESTRESULT/*_coberturaCoverage.txt | awk -F'/' '{print $NF}' | awk -F'_' '{print $1}' ` >> $TESTRESULT/output.txt
		echo -e "\n" >> $TESTRESULT/output.txt
	fi

done < $ICA8/changes.txt

cp $TESTRESULT/timeAnalysis.txt $ICA8/data.tsv

cleanUp
