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
        request.setCharacterEncoding("gb2312"); //�����������
        String user = request.getParameter("username"); //��ȡ�ύ���û���
        String pwd = request.getParameter("password"); //��ȡ�ύ������
        System.out.println("user:"+user);
        System.out.println("pwd:"+pwd);
        boolean validated = false; //��֤�ɹ���ʶ
        //��ѯuserTable���еļ�¼
        String sql = "select * from usertable";
        sqlSrvDB.executeQuery(sql);
        ResultSet rs = sqlSrvDB.rs;//ȡ�ý����
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
            //��֤�ɹ���תmain.jsp
            %>
            <jsp:forward page="main.jsp"/>
            <%
        }
        else{
            //��֤ʧ����ת��error.jsp
            %>
             <jsp:forward page="error.jsp"/>
    <%
        }
    %>
</body>
</html>
