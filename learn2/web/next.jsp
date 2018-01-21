<%--
  Created by IntelliJ IDEA.
  User: FX50J
  Date: 2018/1/19
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        out.println("request:"+(String)request.getAttribute("request")+"<br>");
        out.println("session:"+(String)session.getAttribute("session")+"<br>");
        out.println("sessiionId:"+session.getId()+"<br>");
        out.println("application"+(String)application.getAttribute("application")+"<br>");
    %>
</body>
</html>
