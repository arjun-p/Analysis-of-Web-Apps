#!/usr/bin/python

import sys
from bs4 import BeautifulSoup
fname = '''/home/student/tawa/empldir/analysis/interfaces/empldir-wamai-pda-interfaces.xml'''

login = 'admin'
pwd = 'admin'

def add_param_to_list(plist, key, value):
	
	value = value.strip()
	nlist = []
	if not plist:
		nlist.append(key+'='+value)
		return nlist

	for pstring in plist:
		nlist.append(pstring+'&'+key+'='+value)
	return nlist

		
url_loggedout = []
url_loggedout_noval = []
url_loggedin = []
val_list = []

cookie_fname = 'cookies.txt'
save_cookies = '--save-cookies ' + cookie_fname
load_cookies = '--load-cookies ' + cookie_fname
keep_session = '--keep-session-cookies'
post_prefix  = '--post-data'
url_prefix   = 'http://localhost:8080/empldir/'
suppress_output = '-q -O /dev/null'
#suppress_output = ''
with open(fname) as fp:
	doc = fp.read();

bs = BeautifulSoup(doc, features='xml')

for C in bs.find_all('component'):
	for I in C.find_all('interface'):
		pname = pname_noval = ''
		url_page = I['target']
		pmap = {}

		for P in I.find_all('parameter'):
			val_list = []

			if not P['values'] == '[]':
				val_list = P['values'][1:-1].split(',')
				pmap[P['name']] = val_list
				#print val_list
			else:
				if P['type'] == 'STRING':
					val = 'foo'
				elif P['type'] == 'INTEGER':
					val = '1'
				elif P['type'] == 'DOUBLE':
					val = '1.0'
				pmap[P['name']] = val


			# pname += P['name'] + '=' + str(val) + '&'
			pname_noval += P['name'] + "=&"
		if pname_noval:
			url_loggedout_noval.append("wget %s %s '%s' %s%s" % (suppress_output, post_prefix, pname_noval, url_prefix, url_page))
		if pmap:
			param_list = []
			pstring = ''
			new_param_list = []
			for key in pmap:
				if isinstance(pmap[key], list):
					for ele in pmap[key]:
						new_param_list += add_param_to_list(param_list, key, ele)
					param_list = new_param_list
				else:
					param_list = add_param_to_list(param_list, key, pmap[key])
		#print '\n'.join(param_list)
		for pname in param_list:
			url_loggedout.append("wget %s %s '%s' %s%s" % (suppress_output, post_prefix, pname, url_prefix, url_page))
			url_loggedin.append("wget %s %s %s %s '%s' %s%s" % (suppress_output, load_cookies, keep_session, post_prefix, pname, url_prefix, url_page))


for str in url_loggedout_noval:
	print str

for str in url_loggedout:
	print str

print '''wget -q -O /dev/null --save-cookies cookies.txt --keep-session-cookies --post-data 'FormName=Login&Login=admin&Password=admin&FormAction=login&ret_page=&querystring='  http://localhost:8080/empldir/Login.jsp'''

for str in url_loggedin:
	print str