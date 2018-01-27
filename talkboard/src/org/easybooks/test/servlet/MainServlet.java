package org.easybooks.test.servlet;

import javax.servlet.http.HttpServlet;
import java.sql.*;
import java.io.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;
import org.easybooks.test.jdbc.SqlSrvDBConn;
import org.easybooks.test.model.vo.*;

public class MainServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response)
        throws ServletException,IOException{
        request.setCharacterEncoding("gb2312");
        String username = request.getParameter("username");
        String pwd = request.getParameter("password");
        boolean validated = false;
        SqlSrvDBConn sqlSrvDBConn = new SqlSrvDBConn();
        HttpSession session = request.getSession();
        UserTable userTable = null;
        userTable = (UserTable)session.getAttribute("userTable");
        if(userTable==null){

            String sql = "select * from usertable";
            ResultSet rs = sqlSrvDBConn.executeQuery(sql);
            try{
                while(rs.next()){
                    if(rs.getString("username").trim().compareTo(username)==0 && rs.getString("password").trim().compareTo(pwd)==0){
                        userTable = new UserTable();
                        userTable.setUsername(rs.getString("username"));
                        userTable.setPassword(rs.getString("password"));
                        userTable.setId(rs.getInt("id"));
                        session.setAttribute("userTable",userTable);
                        validated = true;
                    }
                }
                rs.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
            sqlSrvDBConn.closeStmt();
        }
        else{
            validated = true;
        }
        if(validated==true){
            ArrayList al = new ArrayList();
            String sql = "select * from lyTable";
            ResultSet rs = sqlSrvDBConn.executeQuery(sql);
            try{
                //从数据库lyTable中获取留言信息
                while(rs.next()){
                    lyTable ly = new lyTable();
                    ly.setId(rs.getInt("id"));
                    ly.setUserId(rs.getInt("userId"));
                    ly.setDate(rs.getDate("date"));
                    ly.setTitle(rs.getString("title"));
                    ly.setContent(rs.getString("content"));
                    al.add(ly);
                }
                rs.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
            sqlSrvDBConn.closeStmt();
            //留言存入会话
            session.setAttribute("al",al);
            response.sendRedirect("main.jsp");
        }
        else{
            //登录失败
            response.sendRedirect("error.jsp");
        }
        sqlSrvDBConn.closeConn();
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        doGet(request,response);
    }
//    public void doPost(HttpServletRequest request,HttpServletResponse response)
//            throws ServletException,IOException{
//        doGet(request,response);
//    }
}
