package org.easybooks.test.jdbc;
import java.sql.*;
public class SqlSrvDBConn {
//    public static void main(String[] argv){
//        SqlSrvDBConn sqlSrvDBConn = new SqlSrvDBConn();
//        String sql = "select * from usertable";
//        sqlSrvDBConn.executeQuery(sql);
//        ResultSet rs = sqlSrvDBConn.rs;
//        if(sqlSrvDBConn.conn==null) {
//            System.out.println("Conn is null");
//        }
//        if(rs==null){
//            System.out.println("Error");
//            return ;
//        }
//        try{
//            while(rs.next()){
//                System.out.println(rs.getString("username"));
//            }
//        }catch(SQLException e){
//            System.out.println(e.getMessage());
//        }
//    }
    private Statement stmt;
    private Connection conn;
    public ResultSet rs;
    //在构造方法中创建数据库连接
    public SqlSrvDBConn(){
        stmt = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch(Exception e){
            System.out.println("Class is error");
        }
        try{
            String uri = "jdbc:mysql://localhost:3306/test?useSSL=true";
            String user = "host";
            String password = "HanDong85";
            conn = DriverManager.getConnection(uri,user,password);
        }catch(Exception e){
            System.out.println("Connection happened error");
            e.printStackTrace();
        }
    }

    public ResultSet executeQuery(String sql){
        try{
//            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
        }catch(SQLException e){
            System.out.println("Data.executeQuery:"+e.getMessage());
        }
        return rs;
    }
    //关闭 对象
    public void closeStmt(){
        try{
            stmt.close();
        }catch(SQLException e){
            System.out.println("38行出错啦!!!!");
            System.out.println("Data.executeQuery:"+e.getMessage());
        }
    }

    public void closeConn(){
        try{
            conn.close();
        }catch(SQLException e){
            System.out.println("Data.executeQuery:"+e.getMessage());
        }
    }
}
