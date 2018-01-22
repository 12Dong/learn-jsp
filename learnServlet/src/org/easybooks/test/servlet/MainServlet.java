package org.easybooks.test.servlet;

import org.easybooks.test.jdbc.SqlSrvDBConn;
import org.easybooks.test.model.vo.UserTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MainServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException,IOException{
        request.setCharacterEncoding("gb2312"); //设置请求编码
        String username = request.getParameter("username"); //获取提交的用户名
        String pwd = request.getParameter("password"); //获取提交的密码
        boolean validated = false;
        SqlSrvDBConn sqlSrvDBConn = new SqlSrvDBConn();
        HttpSession session = request.getSession(); //获得会话对象 用来保存当前登录用户信息
        UserTable userTable = null;
        //先获得UserTable对象 如果是第一次访问该页 用户对象 肯定为null 但如果是第二次甚至是第三次
        //就直接登陆主页而无需再次重复验证该用户信息
        userTable = (UserTable)session.getAttribute("userTable");
        System.out.println(username);
        System.out.println(pwd);
        if(userTable==null){
            String sql = "select * from usertable";
            ResultSet rs = sqlSrvDBConn.executeQuery(sql);
            try{
                while(rs.next()){
                    if(rs.getString("username").trim().compareTo(username)==0 && rs.getString("password").trim().compareTo(pwd)==0){
                        userTable = new UserTable();
                        userTable.setUsername(rs.getString("username"));
                        userTable.setId(rs.getInt("id"));
                        userTable.setPassword(rs.getString("password"));
                        session.setAttribute("userTable",userTable);
                        validated = true;
                    }
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
            sqlSrvDBConn.closeStmt();
            sqlSrvDBConn.closeConn();
        }
        else{
            validated = true;
        }
        if(validated==true){
            //验证成功 转向main页面
            response.sendRedirect("main.jsp");
        }
        else{
            //验证失败 转向error页面
            response.sendRedirect("error.jsp");
        }
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)
        throws ServletException,IOException{
        doGet(request,response);
    }
}
