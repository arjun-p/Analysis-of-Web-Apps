
            
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
      <td align="center" bgcolor="#FFBB55" colspan="2"><font style="font-size: 12pt; color: #FFFFFF; font-family: Arial, Tahoma, Verdana, Helvetica; font-weight: bold">emps</font></td>
     </tr>
     <form method="get" action="EmpsRecord.jsp" name="emps">
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Name</font></td><td ><input type="text"  name="name" maxlength="100" value="" size="50"></td>
     </tr>
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Title</font></td><td ><input type="text"  name="title" maxlength="50" value="" size="50"></td>
     </tr>
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Login</font></td><td ><input type="text"  name="emp_login" maxlength="20" value="" size="20"></td>
     </tr>
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Password</font></td><td ><input type="password"  name="emp_password" maxlength="20" value="" size="20"></td>
     </tr>
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Level</font></td><td ><select name="emp_level"><option value="0" >None</option><option value="3" >Admin</option></select></td>
     </tr>
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Department</font></td><td ><select name="dep_id"><option value="2" >Administration</option><option value="5" >Finance</option><option value="4" >Marketing</option><option value="1" >Software</option><option value="3" >Support</option></select></td>
     </tr>
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Address</font></td><td ><textarea name="address" cols="50" rows="2"></textarea></td>
     </tr>
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Email</font></td><td ><input type="text"  name="email" maxlength="50" value="" size="50"></td>
     </tr>
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Work Phone</font></td><td ><input type="text"  name="work_phone" maxlength="50" value="" size="50"></td>
     </tr>
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Home Phone</font></td><td ><input type="text"  name="home_phone" maxlength="50" value="" size="50"></td>
     </tr>
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Cell Phone</font></td><td ><input type="text"  name="cell_phone" maxlength="50" value="" size="50"></td>
     </tr>
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Man of the Month</font></td><td ><input type="checkbox" name="manmonth" value="1"></td>
     </tr>
     <tr>
      <td bgcolor="#FFDD00"><font style="font-size: 10pt; color: #000000; font-family: Arial, Tahoma, Verdana, Helvetica">Picture</font></td><td ><input type="text"  name="picture" maxlength="100" value="" size="50"></td>
     </tr>
     <tr>
      <td colspan="2" align="right"><input type="submit" value="Insert" onclick="document.emps.FormAction.value = 'insert';"><input type="submit" value="Cancel" onclick="document.emps.FormAction.value = 'cancel';"><input type="hidden" name="FormName" value="emps"><input type="hidden" value="insert" name="FormAction"><input type="hidden" name="emp_id" value=""><input type="hidden" name="PK_emp_id" value=""/></td>
     </tr>
     </form>
    </table>

    <SCRIPT Language="JavaScript">
if (document.forms["emps"])
  document.emps.onsubmit=delconf;
function delconf() {
if (document.emps.FormAction.value == 'delete')
  return confirm('Delete record?');
}
</SCRIPT>
   </td>
  </tr>
 </table>


<center><font face="Arial"><small>This dynamic site was generated with <a href="http://www.codecharge.com">CodeCharge</a></small></font></center>
</body>
</html>


