package chapter08;

import com.mysql.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class test {
    public static void main(String args[]){
        try{
            String user_id = "1";
            System.out.println(user_id);
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/db01?serverTimezone=GMT%2B8","root","root");
            String sql = "select * from user where user_id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,user_id);
            ResultSet rs = statement.executeQuery();
            if(rs.next()){
                System.out.println("true");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
