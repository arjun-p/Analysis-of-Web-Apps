sudo ./init4.sh
sleep 5
cd /home/student/webapps
sudo ant instrument
sudo ant undeploy
sudo ant deploy
echo "**********************************************************************************************************************"
echo "**********************************************************************************************************************"
cd /home/student/webapps/ICA4
chmod +x user_actions
./user_actions
sleep 2
echo "**********************************************************************************************************************"
echo "**********************************************************************************************************************"
python parseTomcatLogs.py > useractivity
sleep 5 
mysql --user=root --password=tawa  < /home/student/tawa/empldir/database/empldir.sql
sleep 2
echo "**********************************************************************************************************************"
echo "**********************************************************************************************************************"
truncate -s0 difflog
i=1
while read line
do
    echo $i $line
    $line
    if [ $i -eq 2 ]
    then
      echo $line | awk '{print $NF}' >> difflog
      dos2unix old* new*
      diff --suppress-common-lines old* new* >> difflog 
      echo "INSIDE IF"
      mv --backup=numbered *.jsp back/
      #rm *.jsp
      i=0
      echo --------------------------------EOF----------------------- >> difflog
    fi

    ((i++))
done < "useractivity"
echo "**********************************************************************************************************************"
echo "**********************************************************************************************************************"

sudo wget http://localhost:8080/empldir/DumpServlet.jsp
cd /home/student/webapps
sudo ant report
xdg-open empldir/report/index.html 
cd /home/student/webapps/ICA4
rm -rf *.jsp*
rm -rf cookies.txt
