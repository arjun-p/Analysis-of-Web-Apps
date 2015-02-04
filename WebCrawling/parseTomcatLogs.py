#!/usr/bin/python

from subprocess import *
import re
import shutil
import sys

prefix = '/var/log/tomcat7/'
p1 = Popen(["ls", "-r", prefix], stdout=PIPE)
p2 = Popen(["head", "-1"], stdin=p1.stdout, stdout=PIPE)
p1.stdout.close() 
file = prefix + p2.communicate()[0].replace('\n','')

#file='/var/log/tomcat7/localhost_access_log.2014-09-28.txt'
#shutil.copyfile(file,"/home/student/webapps/ICA5/tomcatLog") 
#sys.exit()

url_prefix = "http://localhost:8080"
requests=[]
param=[]
savesession1="--save-cookies cookies1.txt --keep-session-cookies"
loadsession1= "--load-cookies cookies1.txt"
savesession2="--save-cookies cookies2.txt --keep-session-cookies"
loadsession2 = "--load-cookies cookies2.txt"
postsyntax="--post-data"
loggedin=0
with open(file) as log:
	for line in log:
		param=line.split()
		if param[1].endswith("-"):
			param[1]=param[1][:-1]
		if param[1].endswith(".jsp"):
			jspfile = param[1][param[1].rfind('/')+1:]
			if param[0]=='GET':
				if len(param[2])<4:
					param[2]=''
				print "wget %s %s%s%s -O new%s" %(loadsession1,url_prefix,param[1],param[2], jspfile)
				print "wget %s %s%s%s -O old%s" %(loadsession2,url_prefix,param[1].replace('empldir', 'empldir-7'),param[2], jspfile)
			
			elif param[0]=='POST':
				if len(param[4])>2:
					post=param[4][1:-1]
					if param[1].endswith("Login.jsp"):
						print "wget %s %s %s %s%s -O new%s" %(savesession1,postsyntax,post,url_prefix,param[1], jspfile)
						print "wget %s %s %s %s%s -O old%s" %(savesession2,postsyntax,post,url_prefix,param[1].replace('empldir', 'empldir-7'), jspfile)
					else:
						print "wget %s %s %s %s%s -O new%s" %(loadsession1,postsyntax,post,url_prefix,param[1], jspfile)
						print "wget %s %s %s %s%s -O old%s" %(loadsession2,postsyntax,post,url_prefix,param[1].replace('empldir', 'empldir-7'), jspfile)
