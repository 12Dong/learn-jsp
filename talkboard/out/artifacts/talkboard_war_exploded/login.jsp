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
    <title>登陆页面</title>
</head>
<body>
<form action="mainServlet" method="post">
    <table>
        <caption>用户登录</caption>
        <tr>
            <td>用户名 :</td>
            <td>
                <input type="text" name="username" size="20"/>
            </td>
        </tr>
        <tr>
            <td>密码 :</td>
            <td>
                <input type="password" name="password" size="21"/>
            </td>
        </tr>
    </table>
    <input type="submit" value="登录"/>
    <input type="reset" value="重置"/>
</form>
如果没有注册点击<a href="register.jsp">这里</a>注册!
</body>
</html>
