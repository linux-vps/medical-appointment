package HealthCare;

import java.sql.*;
import java.util.*;

public class ConnectionPoolImpl implements ConnectionPool {

	// Trình điều khiển làm việc với MySQL
	private String driver;
	
	// Đường dẫn thực thi
	private String url;
	
	// Tài khoản làm việc
	private String username;
	private String userpass;
	
	// Đối tượng lưu trữ kết nối
	private Stack<Connection> pool = new Stack<>();
	
	public ConnectionPoolImpl() {
		// Xác định trình điều khiển
		this.driver = "com.mysql.cj.jdbc.Driver";
		
		// Nạp trình điều khiển
		try {
			Class.forName(this.driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// Xác định đường dẫn 
		this.url = "jdbc:mysql://localhost:3306/data_HealthCare";
		
		// Xác định tài khoản
		this.username = "nhom19";
		this.userpass = "123456";
		
		// Xác định bộ nhớ
		this.pool = new Stack<>();
	}
	
	@Override
	public Connection getConnectionPool(String objectName) throws SQLException {
		// TODO Auto-generated method stub
		
		if(this.pool.isEmpty()) {
			System.out.println(objectName+" have created a new Connnection.");
			return DriverManager.getConnection(this.url, this.username, this.userpass);
		}else {
			System.out.println(objectName+" have popped the Connection.");
			return this.pool.pop();
		}
		
	}

	@Override
	public void releaseConnection(Connection con, String objectName) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println(objectName+" have pushed a new Connnection.");
		this.pool.push(con);
	}
	
	protected void finalize() throws Throwable{
		// Loại bỏ các kết nối trong Pool
		this.pool.clear();
		this.pool = null;
		System.out.println("ConnnectionPool is Closed.");
	}
}


