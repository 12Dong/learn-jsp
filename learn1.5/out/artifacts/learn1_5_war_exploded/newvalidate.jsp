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
        request.setCharacterEncoding("gb2312"); //�����������
        String user = request.getParameter("username");
        String pwd = request.getParameter("password");
        boolean validated = false;
        UserTable User = null; //�ɻ�
        //�Ȼ��UserTable���� ����ǵ�һ�η��ʸ�ҳ �û�����϶�Ϊ�� ������ǵڶ��������ǵ����� ��ֱ�ӵ�½��ҳ�������ظ���֤�û���Ϣ
        User =(UserTable)session.getAttribute("User");
        //��� �û��ǵ�һ�ν��� �Ự����δ�洢User�־û������� ��Ϊnull
        if(session.getAttribute("User")==null) System.out.println("Now the problem is solved");
        if(User==null){
            //��ѯuserTable���еļ�¼
            String sql = "select * from usertable";
            ResultSet rs = SqlSrvDB.executeQuery(sql);
            System.out.println(user+"   "+pwd);
            while(rs.next()){
                System.out.println(rs.getString("username")+"  "+rs.getString("password"));
                if(rs.getString("username").trim().compareTo(user)==0 && rs.getString("password").trim().compareTo(pwd)==0){
                    validated = true;
                    User = new UserTable();   //�����־û���JavaBean����user
                    User.setId(rs.getInt("id"));
                    User.setUsername(rs.getString("username"));
                    System.out.println(User.getUsername());
                    User.setPassword(rs.getString("password"));
                    System.out.println(User.getPassword());
                    session.setAttribute("User",User);   //��user����洢�ڻỰ��
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
