<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: FX50J
  Date: 2018/1/17
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="gb2312"  %>
<jsp:useBean id = "sqlSrvDB" scope="page" class="org.easybooks.test.jdbc.SqlSrvDBConn" />
<html>
<head>
    <meta http-equiv="Content-Type" context="text/html;charset=gb2312">
</head>
<body>
    <%
        request.setCharacterEncoding("gb2312"); //设置请求编码
        String user = request.getParameter("username"); //获取提交的用户名
        String pwd = request.getParameter("password"); //获取提交的密码
        System.out.println("user:"+user);
        System.out.println("pwd:"+pwd);
        boolean validated = false; //验证成功标识
        //查询userTable表中的记录
        String sql = "select * from usertable";
        sqlSrvDB.executeQuery(sql);
        ResultSet rs = sqlSrvDB.rs;//取得结果集
        while(rs.next()){
            if((rs.getString("username").trim().compareTo(user)==0)&&(rs.getString("password").compareTo(pwd)==0))
            {
                validated = true;
            }
        }
        rs.close();
        sqlSrvDB.closeStmt();
        sqlSrvDB.closeConn();
        if(validated){
            //验证成功跳转main.jsp
            %>
            <jsp:forward page="main.jsp"/>
            <%
        }
        else{
            //验证失败跳转到error.jsp
            %>
             <jsp:forward page="error.jsp"/>
    <%
        }
    %>
</body>
</html>
