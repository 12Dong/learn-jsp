<%--
  Created by IntelliJ IDEA.
  User: FX50J
  Date: 2018/1/22
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<html>
<head>
    <title>��½ҳ��</title>
</head>
<body>
<form action="mainServlet" method="post">
    <table>
        <caption>�û���¼</caption>
        <tr>
            <td>�û��� :</td>
            <td>
                <input type="text" name="username" size="20"/>
            </td>
        </tr>
        <tr>
            <td>���� :</td>
            <td>
                <input type="password" name="password" size="21"/>
            </td>
        </tr>
    </table>
    <input type="submit" value="��¼"/>
    <input type="reset" value="����"/>
</form>
���û��ע����<a href="register.jsp">����</a>ע��!
</body>
</html>
