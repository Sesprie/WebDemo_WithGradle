package chapter01.shopping_cart.example;
import java.io.Serializable;

public class Product implements Serializable {
	private String id;// 产品标识
	private String name;// 产品名称
	private String description;// 产品描述
	private double price;// 产品价格
    private int  number;//产品数量
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	
}