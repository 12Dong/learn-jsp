package org.easybooks.test.servlet;

import org.easybooks.test.jdbc.SqlSrvDBConn;
import org.easybooks.test.model.vo.UserTable;
import org.easybooks.test.model.vo.lyTable;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Date;

public class AddServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response)
        throws ServletException,IOException {
        //设置编码 否则会出现乱码
        request.setCharacterEncoding("gb2312");
        //获取liuyan.jsp所发送的信息
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        //获得session对象
        HttpSession session = request.getSession();
        UserTable userTable = (UserTable) session.getAttribute("userTable");
        //建立lyTable信息
        Integer userId = userTable.getId();
        lyTable ly = new lyTable();
        ly.setUserId(userId);
        ly.setDate( new java.sql.Date(new java.util.Date().getTime()));
        if(title!=null)System.out.println(title);
        ly.setTitle(title);
        ly.setContent(content);
        //新添加的留言要保存一份到会话中 这种刷新主页时就无须每次都去查询数据库留言表了
        ArrayList al =  (ArrayList)session.getAttribute("al");
        al.add(ly);
        //没有放回去 也能 在main.jsp上看到
//        session.setAttribute("al",al);
        PreparedStatement pstmt = null;
        SqlSrvDBConn sqlSrvDBConn = new SqlSrvDBConn();
        Connection conn = sqlSrvDBConn.getConn();
        try{
            pstmt = conn.prepareStatement("insert into lytable values(?,?,?,?,?)");
            pstmt.setInt(1,1);
            pstmt.setInt(2,ly.getUserId());
            pstmt.setDate(3,ly.getDate());
            pstmt.setString(4,ly.getTitle());
            pstmt.setString(5,ly.getContent());
            pstmt.executeUpdate();
            response.sendRedirect("main.jsp");
        }catch(SQLException e){
            e.printStackTrace();
            response.sendRedirect("liuyan.jsp");
            System.out.println("error");
        }
        sqlSrvDBConn.closeConn();
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
        doGet(request,response);
    }
}
