<%@ page import="org.easybooks.test.model.vo.UserTable" %><%--
  Created by IntelliJ IDEA.
  User: FX50J
  Date: 2018/1/17
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言信息板</title>
</head>
<body>
<% UserTable userTable = (UserTable)session.getAttribute("userTable");
        String username = userTable.getUsername();
        %>
    <%=username%>,您好 欢迎登陆留言板!
</body>
</html>
