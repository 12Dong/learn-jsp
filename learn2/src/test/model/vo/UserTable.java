package test.model.vo;

public class UserTable {
    //属性
    private Integer id;
    private String username;
    private String password;

    //属性id 的 get/set方法
    public Integer getId(){
        return this.id;
    }
    public void setId(Integer id){
        this.id = id;
    }
    //属性username的set/get方法
    public String getUsername(){
        return username;
    }
    public void setUsername(String username){
        this.username = username;
    }
    //属性password的set/get方法
    public String getPassword(){
        return this.password;
    }
    public void setPassword(String password){
        this.password = password;
    }
}
