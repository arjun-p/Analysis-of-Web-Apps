
            
<html>
<head>
<title>Employee Directory</title>
<meta name="GENERATOR" content="YesSoftware CodeCharge v.1.2.0 / JSP.ccp build 05/21/01"/>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body text="#000000" link="#000080" vlink="#000080" alink="#000080">


 <table>
  <tr>
   <td valign="top">
    <table border="0" cellspacing="2" cellpadding="0">
     <tr>
      <td ><a href="Default.jsp"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica"><img border="0" src="images/logo.gif" width="434" height="90"></font></a></td>
      <td ><a href="Default.jsp"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica"><center><img border="0" src="images/home.gif" width="77" height="77"><br>Home</center></font></a></td>
      <td ><a href="AdminMenu.jsp"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica"><center><img border="0" src="images/admin.gif" width="77" height="77"><br>Administration</center></font></a></td>
     </tr>
    </table>
   
   </td>
  </tr>
 </table>


 <table>
  <tr>
   
   <td valign="top">
    <table border="0" cellspacing="2" cellpadding="0">
     <tr>
      <td align="center" bgcolor="#FFBB55" colspan="7"><a name="Search"><font style="font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">Search</font></a></td>
     </tr>
     <form method="get" action="EmpsGrid.jsp" name="Search">
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Login</font></td>
      <td ><input type="text"  name="emp_login" maxlength="20" value="" size="10"></td>
     </tr>
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Name</font></td>
      <td ><input type="text"  name="name" maxlength="100" value="" size="10"></td>
     </tr>
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Man of the Month</font></td>
      <td ><select name="manmonth"><option value="" SELECTED>All</option><option value="0" >No</option><option value="1" >Yes</option></select></td>
     </tr>
     <tr>
      <td align="right" colspan="3"><input type="submit" value="Search"/></td>
     </tr>
     </form>
    </table>


    
   </td>
  </tr>
 </table>
 <table>
  <tr>
   <td valign="top">
    <table border="0" cellspacing="2" cellpadding="0">
     <tr>
      <td align="center" bgcolor="#FFBB55" colspan="5"><a name="emps"><font style="font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">Employees</font></a></td>
     </tr>
     <tr>
      <td bgcolor="#000000"><a &"><font style="font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">Edit</font></a></td>
      <td bgcolor="#000000"><a href="EmpsGrid.jsp?emp_login=&name=&manmonth=&Formemps_Sorting=1&Formemps_Sorted=&"><font style="font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">Login</font></a></td>
      <td bgcolor="#000000"><a href="EmpsGrid.jsp?emp_login=&name=&manmonth=&Formemps_Sorting=2&Formemps_Sorted=&"><font style="font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">Name</font></a></td>
      <td bgcolor="#000000"><a href="EmpsGrid.jsp?emp_login=&name=&manmonth=&Formemps_Sorting=3&Formemps_Sorted=&"><font style="font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">Level</font></a></td>
      <td bgcolor="#000000"><a href="EmpsGrid.jsp?emp_login=&name=&manmonth=&Formemps_Sorting=4&Formemps_Sorted=&"><font style="font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">Man of the Month</font></a></td>
     </tr>
     <tr>
      <td ><a href="EmpsRecord.jsp?emp_login=&name=&manmonth=&emp_id=7&"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Edit</font></a></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">admin&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Bob Kuch&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Admin&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">&nbsp;</font></td>
     </tr>
     <tr>
      <td ><a href="EmpsRecord.jsp?emp_login=&name=&manmonth=&emp_id=4&"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Edit</font></a></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">davids&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">David Snyder&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">&nbsp;</font></td>
     </tr>
     <tr>
      <td ><a href="EmpsRecord.jsp?emp_login=&name=&manmonth=&emp_id=1&"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Edit</font></a></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">johns&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">John Smith&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">&nbsp;</font></td>
     </tr>
     <tr>
      <td ><a href="EmpsRecord.jsp?emp_login=&name=&manmonth=&emp_id=2&"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Edit</font></a></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">lij&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Li Jang&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Yes&nbsp;</font></td>
     </tr>
     <tr>
      <td ><a href="EmpsRecord.jsp?emp_login=&name=&manmonth=&emp_id=5&"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Edit</font></a></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">pablos&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Pablo Sanchez&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">&nbsp;</font></td>
     </tr>
     <tr>
      <td ><a href="EmpsRecord.jsp?emp_login=&name=&manmonth=&emp_id=3&"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Edit</font></a></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">robd&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Rob McDonald&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">&nbsp;</font></td>
     </tr>
     <tr>
      <td ><a href="EmpsRecord.jsp?emp_login=&name=&manmonth=&emp_id=6&"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Edit</font></a></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">stefanf&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Stefan Fey&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">&nbsp;</font></td>
     </tr>
     <tr>
      <td ><a href="EmpsRecord.jsp?emp_login=&name=&manmonth=&emp_id=8&"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Edit</font></a></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">timl&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Tim Leist&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">&nbsp;</font></td>
     </tr>
     <tr>
      <td colspan="5" bgcolor="#000000">
       <font style="font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">
        <a href="EmpsRecord.jsp?emp_login=&name=&manmonth=&"><font style="font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">Insert</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </td>
     </tr>
    </table>

    
   </td>
  </tr>
 </table>


<center><font face="Arial"><small>This dynamic site was generated with <a href="http://www.codecharge.com">CodeCharge</a></small></font></center>
</body>
</html>


