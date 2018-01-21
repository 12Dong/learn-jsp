<%--
  Created by IntelliJ IDEA.
  User: FX50J
  Date: 2018/1/19
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        request.setAttribute("request","保存到Request中的信息");
        session.setAttribute("session","保存到session中的信息");
        session.getId();
        application.setAttribute("application","保存到session中的信息");
    %>
    <jsp:forward page="next.jsp"></jsp:forward>
</body>
</html>
