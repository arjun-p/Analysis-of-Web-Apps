
            
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
      <td align="center" bgcolor="#FFBB55" colspan="1"><a name="EmpMonth"><font style="font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">Man of the Month</font></a></td>
     </tr>

     <tr>
      <td bgcolor="#000000"><font style="font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold"></font> </td></tr><tr><td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica"><img border=0 height=100 width=100 src=images/emps/lij.jpg>&nbsp;</font></td>
     </tr>
     <tr>
      <td bgcolor="#000000"><font style="font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold"></font> </td></tr><tr><td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Li Jang&nbsp;</font></td>
     </tr>
     <tr>
      <td colspan="2" >&nbsp;</td>
     </tr>
    </table>

    
   </td>
   <td valign="top">
    <table border="0" cellspacing="2" cellpadding="0">
     <tr>
      <td align="center" bgcolor="#FFBB55" colspan="7"><a name="Search"><font style="font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">Search</font></a></td>
     </tr>
     <form method="get" action="Default.jsp" name="Search">
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Department</font></td>
      <td ><select name="dep_id"><option value="">All</option><option value="2" >Administration</option><option value="5" >Finance</option><option value="4" >Marketing</option><option value="1" >Software</option><option value="3" >Support</option></select></td>
     </tr>
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Name</font></td>
      <td ><input type="text"  name="name" maxlength="15" value="" size="15"></td>
     </tr>
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Email</font></td>
      <td ><input type="text"  name="email" maxlength="50" value="" size="15"></td>
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
      <td align="center" bgcolor="#FFBB55" colspan="5"><a name="Grid"><font style="font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">Employee Directory</font></a></td>
     </tr>
     <tr>
      <td bgcolor="#000000"><a href="Default.jsp?name=&dep_id=&email=&FormGrid_Sorting=1&FormGrid_Sorted=1&"><font style="font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">Name</font></a></td>
      <td bgcolor="#000000"><a href="Default.jsp?name=&dep_id=&email=&FormGrid_Sorting=2&FormGrid_Sorted=1&"><font style="font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">Title</font></a></td>
      <td bgcolor="#000000"><a href="Default.jsp?name=&dep_id=&email=&FormGrid_Sorting=3&FormGrid_Sorted=1&"><font style="font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">Department</font></a></td>
      <td bgcolor="#000000"><a href="Default.jsp?name=&dep_id=&email=&FormGrid_Sorting=4&FormGrid_Sorted=1&"><font style="font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">Work Phone</font></a></td>
      <td bgcolor="#000000"><a href="Default.jsp?name=&dep_id=&email=&FormGrid_Sorting=5&FormGrid_Sorted=1&"><font style="font-size: 10pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">Email</font></a></td>
     </tr>
     <tr>
      <td ><a href="EmpDetail.jsp?name=&dep_id=&email=&emp_id=7&"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Bob Kuch</font></a></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Developer&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Software&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">(364) 134-5411&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica"><a href=mailto:bobk@company.com>bobk@company.com</a>&nbsp;</font></td>
     </tr>
     <tr>
      <td ><a href="EmpDetail.jsp?name=&dep_id=&email=&emp_id=4&"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">David Snyder</font></a></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Developer&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Software&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">(364) 134-5457&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica"><a href=mailto:davids@company.com>davids@company.com</a>&nbsp;</font></td>
     </tr>
     <tr>
      <td ><a href="EmpDetail.jsp?name=&dep_id=&email=&emp_id=1&"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">John Smith</font></a></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Director&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Administration&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">(364) 134-5455&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica"><a href=mailto:johns@company.com>johns@company.com</a>&nbsp;</font></td>
     </tr>
     <tr>
      <td ><a href="EmpDetail.jsp?name=&dep_id=&email=&emp_id=2&"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Li Jang</font></a></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Developer&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Software&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">(364) 134-5456&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica"><a href=mailto:lij@company.com>lij@company.com</a>&nbsp;</font></td>
     </tr>
     <tr>
      <td ><a href="EmpDetail.jsp?name=&dep_id=&email=&emp_id=5&"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Pablo Sanchez</font></a></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Developer&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Software&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">(364) 134-5458&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica"><a href=mailto:pablos@company.com>pablos@company.com</a>&nbsp;</font></td>
     </tr>
     <tr>
      <td ><a href="EmpDetail.jsp?name=&dep_id=&email=&emp_id=3&"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Rob McDonald</font></a></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Manager&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Finance&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">(364) 134-5456&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica"><a href=mailto:robd@company.com>robd@company.com</a>&nbsp;</font></td>
     </tr>
     <tr>
      <td ><a href="EmpDetail.jsp?name=&dep_id=&email=&emp_id=6&"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Stefan Fey</font></a></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Support&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Support&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">(364) 134-5459&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica"><a href=mailto:stefanf@company.com>stefanf@company.com</a>&nbsp;</font></td>
     </tr>
     <tr>
      <td ><a href="EmpDetail.jsp?name=&dep_id=&email=&emp_id=8&"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Tim Leist</font></a></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Developer&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Software&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">(364) 134-5413&nbsp;</font></td>
      <td ><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica"><a href=mailto:timl@company.com>timl@company.com</a>&nbsp;</font></td>
     </tr>
    </table>

    
   </td>
  </tr>
 </table>


<center><font face="Arial"><small>This dynamic site was generated with <a href="http://www.codecharge.com">CodeCharge</a></small></font></center>
</body>
</html>


