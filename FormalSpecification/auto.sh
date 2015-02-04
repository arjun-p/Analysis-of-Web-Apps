cd /home/student/webapps 
sudo ant undeploy 
sudo ant instrument
sudo ant deploy
cd /home/student/webapps/ICA7/bookstore
mysql --user=root --password=tawa  < /home/student/webapps/bookstore/database/bookstore.sql
sleep 1
cucumber
mysql --user=root --password=tawa  < /home/student/webapps/bookstore/database/bookstore.sql
sleep 1
cucumber
sudo wget http://localhost:8080/bookstore/DumpServlet.jsp
cd /home/student/webapps
sudo ant report
xdg-open bookstore/report/index.html 
