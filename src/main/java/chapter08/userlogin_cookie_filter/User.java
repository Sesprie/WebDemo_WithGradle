package chapter08.userlogin_cookie_filter;

public class User {
    private String username;
    private String password;

    public User(String name, String pwd){
        this.username = name;
        this.password = pwd;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
