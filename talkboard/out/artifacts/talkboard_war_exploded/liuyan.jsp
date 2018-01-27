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
    <title>留言板</title>
</head>
<body>
<form action="addServlet" method="post">
    <table border="1">
        <caption>填写留言信息</caption>
        <tr>
            <td>留言标题</td>
            <td><input type="text" name="title" size="20"/></td>
        </tr>
        <tr>
            <td>留言内容</td>
            <td><textarea name="content" rows="5" cols="35"></textarea></td>
        </tr>
    </table>
    <input type="submit" value="提交"/>
    <intpt type="reset" value="重置"/>
</form>
</body>
</html>
