package org.easybooks.test.jdbc;
import java.sql.*;
public class SqlSrvDBConn {
    private Statement stmt;
    private Connection conn;
    private ResultSet rs;
    public SqlSrvDBConn(){
        stmt = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch(Exception e){
            e.printStackTrace();
        }
        try{
            String uri = "jdbc:mysql://localhost:3306/test?useSSL=true";
            String user = "host";
            String password = "HanDong85";
            conn = DriverManager.getConnection(uri,user,password);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public ResultSet executeQuery(String sql){
        try{
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return rs;
    }
    public Connection getConn(){
        return conn;
    }
    public void closeStmt(){
        try{
            stmt.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
    public void closeConn(){
        try{
            conn.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }
}


