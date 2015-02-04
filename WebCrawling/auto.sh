sudo ./init4.sh
sleep 5

cd /home/student/webapps
sudo ant instrument
sudo ant undeploy
sudo ant deploy
sleep 2

echo "**********************************************************************************************************************"
echo "**********************************************************************************************************************"

cd /home/student/luna-workspace/crawler
sudo mvn clean install exec:exec

cd /home/student/webapps/ICA5
python parseTomcatLogs.py > useractivity
sleep 2 

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

cd /home/student/webapps/ICA5
rm -rf *.jsp*
rm -rf cookies*
