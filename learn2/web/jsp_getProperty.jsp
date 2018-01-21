<%--
  Created by IntelliJ IDEA.
  User: FX50J
  Date: 2018/1/18
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
    <jsp:useBean id="test" scope="page" class="test.TestBean"/>
    <jsp:setProperty name="test" property="stringValue" value="上海大学"/>
    <h1>Get of String:<jsp:getProperty name="test" property="stringValue"/></h1>
</body>
</html>
