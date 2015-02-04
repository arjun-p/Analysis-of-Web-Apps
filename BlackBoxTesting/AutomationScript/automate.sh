# Compile and run
cd /home/student/webapps

# Delete Dump servlet previously generated
if [ -f /home/student/webapps/DumpServlet.jsp ] 
then
rm /home/student/webapps/DumpServlet.jsp
fi 

echo "Running selenium tests"

ant test

wget http://localhost:8080/events/DumpServlet.jsp

ant report

echo "Report generated"

# Open Report
firefox file:///home/student/tawa/events/selenium-reports/html/junit-noframes.html 
firefox file:///home/student/tawa/events/report/index.html 