HOMEDIR=/home/student/tawa/

# Compile and run
if [ -f /home/student/tawa/DumpServlet.jsp ] 
then
rm /home/student/tawa/DumpServlet.jsp
fi 

echo "Deploy Application"
cd $HOMEDIR
ant undeploy
ant deploy
ant instrument

# Run script to parse interface
cd $HOMEDIR/ICA3
python ICA3parser.py > ICA3wgetFile
chmod +x ICA3wgetFile
./ICA3wgetFile

# Flush Cobertura
wget http://localhost:8080/empldir/DumpServlet.jsp

cd $HOMEDIR
ant report
echo "Report generated"
firefox file:///home/student/tawa/empldir/report/index.html 

# Cleanup
cd $HOMEDIR/ICA3
rm *.jsp.*
rm *.jsp
