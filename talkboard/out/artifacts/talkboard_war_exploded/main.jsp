<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="org.easybooks.test.jdbc.SqlSrvDBConn" %>
<%@ page import="org.easybooks.test.model.vo.lyTable" %><%--
  Created by IntelliJ IDEA.
  User: FX50J
  Date: 2018/1/22
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<html>
<head>
    <title>留言版</title>
</head>
<body>
<form action="liuyan.jsp" method="post">
    <table border="1">
        <caption>所有留言信息</caption>
        <tr>
            <th>留言人姓名</th><th>留言时间</th><th>留言标题</th><th>留言内容</th>
        </tr>
        <%
            PreparedStatement pstmt = null;
            SqlSrvDBConn sqlSrvDBConn = new SqlSrvDBConn();
            Connection conn = sqlSrvDBConn.getConn();
            ArrayList al = (ArrayList) session.getAttribute("al");
            Iterator iter = al.iterator();
            while(iter.hasNext()){
                lyTable ly = (lyTable)iter.next();
                String username = null;
                try{
                    pstmt = conn.prepareStatement("select username from userTable where id = ?");
                    pstmt.setInt(1,ly.getUserId());
                    ResultSet rs = pstmt.executeQuery();
                    while(rs.next()){
                        username = rs.getString("username");
                    }
                }catch(SQLException e){
                    e.printStackTrace();
                }
        %>
        <tr>
            <td><%=username%></td>
            <td><%=ly.getDate()%></td>
            <td><%=ly.getTitle()%></td>
            <td><%=ly.getContent()%></td>
        </tr>
        <%
            }
        %>
    </table>
    <input type = "submit"  value="留言"/>
</form>
</body>
</html>
