<%--
  Created by IntelliJ IDEA.
  User: FX50J
  Date: 2018/1/20
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" pageEncoding="gb2312" import="java.sql.*,org.easybooks.test.model.vo.UserTable" %>
<jsp:useBean id="SqlSrvDB" scope="page" class="org.easybooks.test.jdbc.SqlSrvDBConn"/>
<html>
<head>
    <title>newValidate</title>
</head>
<body>
    <%
        request.setCharacterEncoding("gb2312"); //设置请求编码
        String user = request.getParameter("username");
        String pwd = request.getParameter("password");
        boolean validated = false;
        UserTable User = null; //疑惑
        //先获得UserTable对象 如果是第一次访问该页 用户对象肯定为空 但如果是第二次甚至是第三次 就直接登陆主页而无须重复验证用户信息
        User =(UserTable)session.getAttribute("User");
        //如果 用户是第一次进入 会话中尚未存储User持久化啊对象 故为null
        if(session.getAttribute("User")==null) System.out.println("Now the problem is solved");
        if(User==null){
            //查询userTable表中的记录
            String sql = "select * from usertable";
            ResultSet rs = SqlSrvDB.executeQuery(sql);
            System.out.println(user+"   "+pwd);
            while(rs.next()){
                System.out.println(rs.getString("username")+"  "+rs.getString("password"));
                if(rs.getString("username").trim().compareTo(user)==0 && rs.getString("password").trim().compareTo(pwd)==0){
                    validated = true;
                    User = new UserTable();   //创建持久化的JavaBean对象user
                    User.setId(rs.getInt("id"));
                    User.setUsername(rs.getString("username"));
                    System.out.println(User.getUsername());
                    User.setPassword(rs.getString("password"));
                    System.out.println(User.getPassword());
                    session.setAttribute("User",User);   //把user对象存储在会话中
                    UserTable testUser = (UserTable)session.getAttribute("User");
                    if(testUser==null) System.out.println("Error");
                    else System.out.println("There is no error");

                }
            }
            rs.close();
            SqlSrvDB.closeStmt();
            SqlSrvDB.closeConn();
        }
        else{
            validated = true;
            System.out.println("revies validate");
        }
        System.out.println(validated);
        if(validated){
            %>
        <jsp:forward page="newmain.jsp" />
    <%
        }
        else{
            %>
    <jsp:forward page="error.jsp"/>
    <%
        }
    %>
</body>
</html>
