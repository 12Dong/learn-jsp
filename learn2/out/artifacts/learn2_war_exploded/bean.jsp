<%--
  Created by IntelliJ IDEA.
  User: FX50J
  Date: 2018/1/18
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>useBean动作元素的应用</title>
</head>
<body>
    <jsp:useBean id="test" scope="page" class="test.TestBean"/>
    <%
        test.setString("南京师范大学");
        String str = test.getStringValue();
        out.println(str);
    %>
</body>
</html>
