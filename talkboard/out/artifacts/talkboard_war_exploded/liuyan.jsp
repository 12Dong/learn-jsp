<%--
  Created by IntelliJ IDEA.
  User: FX50J
  Date: 2018/1/23
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<html>
<head>
    <title>���԰�</title>
</head>
<body>
<form action="addServlet" method="post">
    <table border="1">
        <caption>��д������Ϣ</caption>
        <tr>
            <td>���Ա���</td>
            <td><input type="text" name="title" size="20"/></td>
        </tr>
        <tr>
            <td>��������</td>
            <td><textarea name="content" rows="5" cols="35"></textarea></td>
        </tr>
    </table>
    <input type="submit" value="�ύ"/>
    <intpt type="reset" value="����"/>
</form>
</body>
</html>
