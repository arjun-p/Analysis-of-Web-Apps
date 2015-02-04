import sys
import os
import xml.etree.cElementTree as ET
import requests
from HTMLParser import HTMLParser
root = ET.Element("root")
count = 0

class MLStripper(HTMLParser):
    def __init__(self):
        self.reset()
        self.fed = []
    def handle_data(self, d):
        self.fed.append(d)
    def get_data(self):
        return ''.join(self.fed)

def strip_tags(html):
    s = MLStripper()
    s.feed(html)
    return s.get_data()

def writeCoveredLineNumbers(classvar):
	filename = classvar.get('filename')
	
	for methods in classvar.findall('methods'):
		for method in methods.findall('method'):
			for lines in method.findall('lines'):
				for line in lines.findall('line'):
					hits = line.get("hits")
					if(int(hits) > 0):
						fileobj.write(os.path.basename(filename).split("_", 1)[0] + ":" + line.get("number")+"\n")
					
	
	for lines in classvar.findall('lines'):
		for line in lines.findall('line'):
				hits = line.get("hits")
				if(int(hits) > 0):
					fileobj.write(os.path.basename(filename).split("_", 1)[0] + ":" + line.get("number")+"\n")
			

#filepath = "/home/student/webapps/bookstore-orig/report/coverage.xml"
filepath = sys.argv[1]
fileout = sys.argv[2]
tree = ET.parse(filepath)
root = tree.getroot()
#fileobj = open("/home/student/webapps/8ICA/coberturaCoverage.txt","a")

fileobj = open(fileout,"a")
for packages in root.findall('packages'):
	for package in packages.findall('package'):
		for classes in package.findall('classes'):
			for classvar in classes.findall('class'):
				writeCoveredLineNumbers(classvar)
	





		
		
	

		
