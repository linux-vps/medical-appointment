package HealthCare;

import java.sql.*;


public interface ConnectionPool {
	// Xin kết nối để làm việc 
	public Connection getConnectionPool(String objectName)throws SQLException;
	
	// Yêu cầu trả về kết nối
	public void releaseConnection(Connection con, String obJectName) throws SQLException;
}

