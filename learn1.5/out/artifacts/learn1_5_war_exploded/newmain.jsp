<%--
  Created by IntelliJ IDEA.
  User: FX50J
  Date: 2018/1/20
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" import="org.easybooks.test.model.vo.UserTable"%>
<html>
<head>
    <title>аТят╟Епео╒</title>
</head>
<body>
    <%
//        UserTable user = (UserTable)session.getAttribute("User");
//        String username = user.getUsername();
        String username="error";
        UserTable testUser = (UserTable)session.getAttribute("User");
        if(testUser.getUsername()==null) out.println("There is error");
        else username = testUser.getUsername();
    %>
    <%=username%>,дЗ╨ц!╩╤с╜╣гб╫аТят╟Е.
</body>
</html>
