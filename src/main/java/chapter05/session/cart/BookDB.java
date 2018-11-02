package chapter05.session.cart;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class BookDB {
    private static Map<String, Book> books = new LinkedHashMap<>();
    static{
        books.put("1",new Book(1,"javaweb开发"));
        books.put("2",new Book(2,"维吉尼亚密码"));
        books.put("3",new Book(3,"栅栏密码"));
        books.put("4",new Book(4,"凯撒密码"));
        books.put("5",new Book(5,"古典密码"));

    }
    public static Collection<Book> getAll(){
        return books.values();
    }

    public static Book getBook(String id){
        return books.get(id);
    }
}
