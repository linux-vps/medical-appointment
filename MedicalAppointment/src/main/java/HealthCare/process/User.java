package HealthCare.process;

import java.util.*;

import java.sql.*;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import HealthCare.ConnectionPool;
import HealthCare.ConnectionPoolImpl;
import HealthCare.objects.UserObject;


public class User {
	//Ket noi de lam viec voi csdl
	private Connection con;
	//Bộ quản lý kết nối của riêng User
	private ConnectionPool cp;
	public User() {
		//xác định bộ quản lý kết nối
		this.cp = new ConnectionPoolImpl();	
		// xin kết nối để làm việc
		try {
			this.con = this.cp.getConnectionPool("User");
			// Kiểm tra chế độ thực thi của kết nối
			if (this.con.getAutoCommit()) {
				// Huỷ chế độ thực thi tự động
				this.con.setAutoCommit(false);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public ArrayList <UserObject> getUserObjects(UserObject similar, byte total){		
			ArrayList <UserObject> items = new ArrayList <>();
			UserObject item;		
			String sql = "";
			sql += "SELECT * FROM tbluser ";
			sql += "";
			sql += "ORDER BY user_name ASC ";
			sql += "LIMIT ? ";			
			try {
				PreparedStatement pre = this.con.prepareStatement(sql);				
				//Truyền giá trị cho tham số, tổng số bản ghi
				pre.setByte(1, total);				
				ResultSet rs = pre.executeQuery(); // Lấy về tập kết quả
				if (rs != null) {
					while (rs.next()) {
						item = new UserObject();			
						item.setUser_id(rs.getInt("user_id"));
						item.setUser_name(rs.getString("user_name"));
						item.setUser_fullname(rs.getString("user_fullname"));
						item.setUser_phone(rs.getString("user_phone"));
						item.setUser_birthday(rs.getString("user_birthday"));
						item.setUser_password(rs.getString("user_password"));
						item.setUser_email(rs.getString("user_email"));
						item.setUser_address(rs.getString("user_address"));
						item.setUser_job(rs.getString("user_job"));
						item.setUser_jobarea(rs.getString("user_jobarea"));
						item.setUser_permission(rs.getInt("user_permission"));
						item.setUser_roles(rs.getString("user_roles"));
						item.setUser_logined(rs.getInt("user_logined"));
						item.setUser_created_date(rs.getString("user_created_date"));
						item.setUser_last_modified(rs.getString("user_last_modified"));
						item.setUser_last_logined(rs.getString("user_last_logined"));
						item.setUser_notes(rs.getString("user_notes"));
						item.setUser_parent_id(rs.getInt("user_parent_id"));
						item.setUser_actions(rs.getInt("user_actions"));
						item.setUser_avatar(rs.getString("user_avatar"));
						// Đưa vào tập hợp
						items.add(item);
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
				// Trở về trạng thái an toàn của kết nối
				try {
					this.con.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}		
			return items;		
		}	
	public boolean addUser(UserObject user) {
	    StringBuilder sql = new StringBuilder();
	    sql.append("INSERT INTO tbluser(");
	    sql.append("user_name, user_fullname, user_phone, user_birthday, ");
	    sql.append("user_password, user_email, user_address, user_job, ");
	    sql.append("user_jobarea, user_permission, user_roles, user_logined, ");
	    sql.append("user_created_date, user_last_modified, user_last_logined, user_notes, ");
	    sql.append("user_parent_id, user_actions)");
	    sql.append("VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

	    try {
	        PreparedStatement pre = this.con.prepareStatement(sql.toString());
	        pre.setString(1, user.getUser_name());
	        pre.setString(2, user.getUser_fullname());
	        pre.setString(3, user.getUser_phone());
	        pre.setString(4, user.getUser_birthday());
	        pre.setString(5, user.getUser_password());
	        pre.setString(6, user.getUser_email());
	        pre.setString(7, user.getUser_address());
	        pre.setString(8, user.getUser_job());
	        pre.setString(9, user.getUser_jobarea());
	        pre.setInt(10, user.getUser_permission());
	        pre.setString(11, user.getUser_roles());
	        pre.setInt(12, user.getUser_logined());
	        pre.setString(13, user.getUser_created_date());
	        pre.setString(14, user.getUser_last_modified());
	        pre.setString(15, user.getUser_last_logined());
	        pre.setString(16, user.getUser_notes());
	        pre.setInt(17, user.getUser_parent_id());
	        pre.setInt(18, user.getUser_actions());

	        int result = pre.executeUpdate();
	        if (result == 0) {
	            this.con.rollback();
	            return false;
	        }

	        this.con.commit();
	        return true;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        try {
	            this.con.rollback();
	        } catch (SQLException e1) {
	            e1.printStackTrace();
	        }
	    }
	    return false;
	}

	public boolean updateUser(UserObject user) {
	    StringBuilder sql = new StringBuilder();
	    sql.append("UPDATE tbluser ");
	    sql.append("SET "
	            + "user_name = ?, user_fullname = ?, user_phone = ?, user_birthday = ?, "
	            + "user_password = ?, user_email = ?, user_address = ?, user_job = ?, "
	            + "user_jobarea = ?, user_permission = ?, user_roles = ?, user_logined = ?, "
	            + "user_created_date = ?, user_last_modified = ?, user_last_logined = ?, user_notes = ?, "
	            + "user_parent_id = ?, user_actions = ? ");
	    sql.append(" WHERE user_id = ? ");

	    try {
	        PreparedStatement pre = this.con.prepareStatement(sql.toString());
	        pre.setString(1, user.getUser_name());
	        pre.setString(2, user.getUser_fullname());
	        pre.setString(3, user.getUser_phone());
	        pre.setString(4, user.getUser_birthday());
	        pre.setString(5, user.getUser_password());
	        pre.setString(6, user.getUser_email());
	        pre.setString(7, user.getUser_address());
	        pre.setString(8, user.getUser_job());
	        pre.setString(9, user.getUser_jobarea());
	        pre.setInt(10, user.getUser_permission());
	        pre.setString(11, user.getUser_roles());
	        pre.setInt(12, user.getUser_logined());
	        pre.setString(13, user.getUser_created_date());
	        pre.setString(14, user.getUser_last_modified());
	        pre.setString(15, user.getUser_last_logined());
	        pre.setString(16, user.getUser_notes());
	        pre.setInt(17, user.getUser_parent_id());
	        pre.setInt(18, user.getUser_actions());
	        pre.setInt(19, user.getUser_id());

	        int result = pre.executeUpdate();
	        if (result == 0) {
	            this.con.rollback();
	            return false;
	        }

	        this.con.commit();
	        return true;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        try {
	            this.con.rollback();
	        } catch (SQLException e1) {
	            e1.printStackTrace();
	        }
	    }
	    return false;
	}

	public boolean deleteUser(int user_id_del) {
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM tbluser "
				+ "WHERE user_id = ? ;");
		try {
			PreparedStatement pre = this.con.prepareStatement(sql.toString());
			pre.setInt(1, user_id_del);
			//thực thi
			int result = pre.executeUpdate();
			if (result==0) {
				this.con.rollback();
				return false;
			}		
			//Ghi nhận thực thi sau cùng
			this.con.commit();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	//search by id
	public UserObject getUserById(int user_id) {
		UserObject item = new UserObject();
		
		//sql
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM tbluser ");
		sql.append("WHERE user_id = ? ");
		
		try {
			PreparedStatement pre = this.con.prepareStatement(sql.toString());
			pre.setInt(1, user_id);
			
			//lay tap ket qua
			ResultSet rs = pre.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					item.setUser_id(rs.getInt("user_id"));
					item.setUser_name(rs.getString("user_name"));
					item.setUser_fullname(rs.getString("user_fullname"));
					item.setUser_birthday(rs.getString("user_birthday"));
					item.setUser_phone(rs.getString("user_phone"));
					item.setUser_password(rs.getString("user_password"));
					item.setUser_email(rs.getString("user_email"));
					item.setUser_address(rs.getString("user_address"));
					item.setUser_job(rs.getString("user_job"));
					item.setUser_jobarea(rs.getString("user_jobarea"));
					item.setUser_permission(rs.getInt("user_permission"));
					item.setUser_roles(rs.getString("user_roles"));
					item.setUser_logined(rs.getInt("user_logined"));
					item.setUser_created_date(rs.getString("user_created_date"));
					item.setUser_last_modified(rs.getString("user_last_modified"));
					item.setUser_last_logined(rs.getString("user_last_logined"));
					item.setUser_parent_id(rs.getInt("user_parent_id"));
					item.setUser_actions(rs.getInt("user_actions"));
					item.setUser_notes(rs.getString("user_notes"));
					item.setUser_avatar(rs.getString("user_avatar"));
				}
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			//tro ve trang thai an toan cua ket noi
			try {
				this.con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return item;
	}
	public ArrayList<UserObject> getAllDoctor(UserObject similar) {
		ArrayList<UserObject> items = new ArrayList<>();
		UserObject item;
		
		//sql
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM tbluser ");
		sql.append("WHERE user_roles = 'd' ");
		sql.append("ORDER BY user_id ASC ");
		
		try {
			PreparedStatement pre = this.con.prepareStatement(sql.toString());
			//lay tap ket qua
			ResultSet rs = pre.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					item = new UserObject();
					item.setUser_id(rs.getInt("user_id"));
					item.setUser_name(rs.getString("user_name"));
					item.setUser_fullname(rs.getString("user_fullname"));
					item.setUser_birthday(rs.getString("user_birthday"));
					item.setUser_phone(rs.getString("user_phone"));
					item.setUser_password(rs.getString("user_password"));
					item.setUser_email(rs.getString("user_email"));
					item.setUser_address(rs.getString("user_address"));
					item.setUser_job(rs.getString("user_job"));
					item.setUser_jobarea(rs.getString("user_jobarea"));
					item.setUser_permission(rs.getInt("user_permission"));
					item.setUser_roles(rs.getString("user_roles"));
					item.setUser_logined(rs.getInt("user_logined"));
					item.setUser_created_date(rs.getString("user_created_date"));
					item.setUser_last_modified(rs.getString("user_last_modified"));
					item.setUser_last_logined(rs.getString("user_last_logined"));
					item.setUser_parent_id(rs.getInt("user_parent_id"));
					item.setUser_actions(rs.getInt("user_actions"));
					item.setUser_notes(rs.getString("user_notes"));
					
					items.add(item);
				}
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			//tro ve trang thai an toan cua ket noi
			try {
				this.con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		
		return items;
	}
	// Tìm kiếm theo điều kiện 
	public ArrayList<UserObject> searchUserByCondition(String condition) {    
	    ArrayList<UserObject> items = new ArrayList<>();
	    UserObject item;
	    String sql = "SELECT * FROM tbluser WHERE " + condition;
	    try {
	        PreparedStatement pre = this.con.prepareStatement(sql);
	        ResultSet rs = pre.executeQuery(); // Lấy về tập kết quả
	        if (rs != null) {
	            while (rs.next()) {
	                item = new UserObject();
	                item.setUser_id(rs.getInt("user_id"));
	                item.setUser_name(rs.getString("user_name"));
	                item.setUser_fullname(rs.getString("user_fullname"));
	                item.setUser_phone(rs.getString("user_phone"));
	                item.setUser_birthday(rs.getString("user_birthday"));
	                item.setUser_password(rs.getString("user_password"));
	                item.setUser_email(rs.getString("user_email"));
	                item.setUser_address(rs.getString("user_address"));
	                item.setUser_job(rs.getString("user_job"));
	                item.setUser_jobarea(rs.getString("user_jobarea"));
	                item.setUser_permission(rs.getInt("user_permission"));
	                item.setUser_roles(rs.getString("user_roles"));
	                item.setUser_logined(rs.getInt("user_logined"));
	                item.setUser_created_date(rs.getString("user_created_date"));
	                item.setUser_last_modified(rs.getString("user_last_modified"));
	                item.setUser_last_logined(rs.getString("user_last_logined"));
	                item.setUser_notes(rs.getString("user_notes"));
	                item.setUser_parent_id(rs.getInt("user_parent_id"));
	                item.setUser_actions(rs.getInt("user_actions"));
	                item.setUser_avatar(rs.getString("user_avatar"));

	                // Đưa vào tập hợp
	                items.add(item);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        // Trở về trạng thái an toàn của kết nối
	        try {
	            this.con.rollback();
	        } catch (SQLException e1) {
	            e1.printStackTrace();
	        }
	    }
	    return items;
	}
	// Tìm user theo tên
	public ArrayList<UserObject> searchUserByName(String keyword) {
	    ArrayList<UserObject> items = new ArrayList<>();
	    UserObject item;
	    String sql = "SELECT * FROM tbluser WHERE user_name LIKE ?";
	    try {
	        PreparedStatement pre = this.con.prepareStatement(sql);
	        // Truyền giá trị cho tham số, từ khóa tìm kiếm
	        pre.setString(1, "%" + keyword + "%");
	        ResultSet rs = pre.executeQuery(); // Lấy về tập kết quả
	        if (rs != null) {
	            while (rs.next()) {
	                item = new UserObject();
	                item.setUser_id(rs.getInt("user_id"));
	                item.setUser_name(rs.getString("user_name"));
	                item.setUser_fullname(rs.getString("user_fullname"));
	                item.setUser_phone(rs.getString("user_phone"));
	                item.setUser_birthday(rs.getString("user_birthday"));
	                item.setUser_password(rs.getString("user_password"));
	                item.setUser_email(rs.getString("user_email"));
	                item.setUser_address(rs.getString("user_address"));
	                item.setUser_job(rs.getString("user_job"));
	                item.setUser_jobarea(rs.getString("user_jobarea"));
	                item.setUser_permission(rs.getInt("user_permission"));
	                item.setUser_roles(rs.getString("user_roles"));
	                item.setUser_logined(rs.getInt("user_logined"));
	                item.setUser_created_date(rs.getString("user_created_date"));
	                item.setUser_last_modified(rs.getString("user_last_modified"));
	                item.setUser_last_logined(rs.getString("user_last_logined"));
	                item.setUser_notes(rs.getString("user_notes"));
	                item.setUser_parent_id(rs.getInt("user_parent_id"));
	                item.setUser_actions(rs.getInt("user_actions"));

	                // Đưa vào tập hợp
	                items.add(item);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        // Trở về trạng thái an toàn của kết nối
	        try {
	            this.con.rollback();
	        } catch (SQLException e1) {
	            e1.printStackTrace();
	        }
	    }
	    return items;
	}

	// đếm tổng số đối tượng
	public int countUser() {

	  String sql = "SELECT COUNT(*) FROM tbluser";
	  try {
	    PreparedStatement pre = this.con.prepareStatement(sql);
	    ResultSet rs = pre.executeQuery();
	    rs.next();
	    return rs.getInt(1);
	  } catch (SQLException e) {
	    e.printStackTrace();
	  }
	  return 0;
	}	
	// Đếm theo điều kiện
	public int countUserByCondition(String condition) {
	    int count = 0;
	    String sql = "SELECT COUNT(*) FROM tbluser WHERE " + condition;
	    try {
	        PreparedStatement pre = this.con.prepareStatement(sql);
	        ResultSet rs = pre.executeQuery();
	        if (rs != null) {
	            while (rs.next()) {
	                count = rs.getInt(1);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        // Trở về trạng thái an toàn của kết nối
	        try {
	            this.con.rollback();
	        } catch (SQLException e1) {
	            e1.printStackTrace();
	        }
	    }
	    return count;
	}
	// Kiểm tra đăng nhập
	public UserObject checkLogin(String username, String password) {
	    UserObject user = null;
	    String sql = "SELECT * FROM tbluser WHERE user_name = ? AND user_password = ?";
	    
	    try {
	        PreparedStatement pre = this.con.prepareStatement(sql);
	        pre.setString(1, username);
	        pre.setString(2, password);

	        ResultSet rs = pre.executeQuery();
	        if (rs != null && rs.next()) {
	            user = new UserObject();
	            user.setUser_id(rs.getInt("user_id"));
	            user.setUser_name(rs.getString("user_name"));
	            user.setUser_fullname(rs.getString("user_fullname"));
	            user.setUser_phone(rs.getString("user_phone"));
	            user.setUser_birthday(rs.getString("user_birthday"));
	            user.setUser_password(rs.getString("user_password"));
	            user.setUser_email(rs.getString("user_email"));
	            user.setUser_address(rs.getString("user_address"));
	            user.setUser_job(rs.getString("user_job"));
	            user.setUser_jobarea(rs.getString("user_jobarea"));
	            user.setUser_permission(rs.getInt("user_permission"));
	            user.setUser_roles(rs.getString("user_roles"));
	            user.setUser_logined(rs.getInt("user_logined"));
	            user.setUser_created_date(rs.getString("user_created_date"));
	            user.setUser_last_modified(rs.getString("user_last_modified"));
	            user.setUser_last_logined(rs.getString("user_last_logined"));
	            user.setUser_notes(rs.getString("user_notes"));
	            user.setUser_parent_id(rs.getInt("user_parent_id"));
	            user.setUser_actions(rs.getInt("user_actions"));
	            user.setUser_avatar(rs.getString("user_avatar"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return user;
	}
	// Đăng ký tài khoản
		public boolean registerUser(String username, String password, String email) {
		    StringBuilder sql = new StringBuilder();
		    sql.append("INSERT INTO tbluser(");
		    sql.append("user_name, user_password, user_email, user_created_date, user_roles)");
		    sql.append("VALUES(?,?,?,?,?)");

		    try {
		        PreparedStatement pre = this.con.prepareStatement(sql.toString());
		        pre.setString(1, username);
		        pre.setString(2, password);
		        pre.setString(3, email);
		        // Thời gian hiện tại của máy chủ
		        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		        pre.setTimestamp(4, currentTime); // user_created_date
		        pre.setString(5, "p");
		        
		        

		        int result = pre.executeUpdate();
		        if (result == 0) {
		            this.con.rollback();
		            return false;
		        }

		        this.con.commit();
		        return true;
		    } catch (SQLException e) {
		        e.printStackTrace();
		        try {
		            this.con.rollback();
		        } catch (SQLException e1) {
		            e1.printStackTrace();
		        }
		    }
		    return false;
		}
    // Kiểm tra xem username đã tồn tại chưa
    public boolean checkUsernameExists(String username) {
        String sql = "SELECT COUNT(*) FROM tbluser WHERE user_name = ?";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if (rs != null && rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Kiểm tra xem email đã tồn tại chưa
    public boolean checkEmailExists(String email) {
        String sql = "SELECT COUNT(*) FROM tbluser WHERE user_email = ?";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setString(1, email);
            ResultSet rs = pre.executeQuery();
            if (rs != null && rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    // Tìm theo vai trò
    public ArrayList<UserObject> getUsersByRole(String role) {
        ArrayList<UserObject> items = new ArrayList<>();
        UserObject item;
        
        String sql = "SELECT * FROM tbluser WHERE user_roles = ? ORDER BY user_id ASC LIMIT 100";
        
        try (PreparedStatement pre = this.con.prepareStatement(sql)) {
            pre.setString(1, role);
            
            try (ResultSet rs = pre.executeQuery()) {
                while (rs.next()) {
                    item = new UserObject();
                    item.setUser_id(rs.getInt("user_id"));
                    item.setUser_name(rs.getString("user_name"));
                    item.setUser_fullname(rs.getString("user_fullname"));
                    item.setUser_phone(rs.getString("user_phone"));
                    item.setUser_birthday(rs.getString("user_birthday"));
                    item.setUser_password(rs.getString("user_password"));
                    item.setUser_email(rs.getString("user_email"));
                    item.setUser_address(rs.getString("user_address"));
                    item.setUser_job(rs.getString("user_job"));
                    item.setUser_jobarea(rs.getString("user_jobarea"));
                    item.setUser_permission(rs.getInt("user_permission"));
                    item.setUser_roles(rs.getString("user_roles"));
                    item.setUser_logined(rs.getInt("user_logined"));
                    item.setUser_created_date(rs.getString("user_created_date"));
                    item.setUser_last_modified(rs.getString("user_last_modified"));
                    item.setUser_last_logined(rs.getString("user_last_logined"));
                    item.setUser_notes(rs.getString("user_notes"));
                    item.setUser_parent_id(rs.getInt("user_parent_id"));
                    item.setUser_actions(rs.getInt("user_actions"));
                    item.setUser_avatar(rs.getString("user_avatar"));
                    items.add(item);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            
            // Trở về trạng thái an toàn của kết nối
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
        
        return items;
    }
    // Phương thức lấy dữ liệu cho biểu đồ từ CSDL, trang index.jsp bên admin
    public ArrayList<Integer> getUserAgeGroupData() {
        ArrayList<Integer> data = new ArrayList<>();

  
        int infantData = 0;
        int childData = 0;
        int teenagerData = 0;
        int adultData = 0;
        int middleAgedData = 0;
        int oldsterData = 0;
        int elderlyData = 0;

        String sql = "SELECT user_birthday FROM tbluser WHERE user_roles = 'p'";
        
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                String birthday = rs.getString("user_birthday");

                int age = calculateAgeFromBirthday(birthday);
                if (age >= 0 && age <= 1) {
                    infantData++; 
                } else if (age >= 2 && age <= 12) {
                    childData++; 
                } else if (age >= 13 && age <= 17) {
                    teenagerData++; 
                } else if (age >= 18 && age <= 34) {
                    adultData++; 
                } else if (age >= 35 && age <= 64) {
                    middleAgedData++;
                } else if (age >= 65 && age <= 84) {
                    oldsterData++; 
                } else {
                    elderlyData++; 
                }
            }

            data.add(infantData);
            data.add(childData);
            data.add(teenagerData);
            data.add(adultData);
            data.add(middleAgedData);
            data.add(oldsterData);
            data.add(elderlyData);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return data;
    }

    private int calculateAgeFromBirthday(String birthday) {
        if (birthday == null || birthday.isEmpty()) {
            return -1; 
        }
      
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

        try {
         
        	Date birthDate = dateFormat.parse(birthday);       
            Date currentDate = new Date();

            Calendar cal = Calendar.getInstance();
            cal.setTime(birthDate);
            int birthYear = cal.get(Calendar.YEAR);
            int birthMonth = cal.get(Calendar.MONTH);
            int birthDay = cal.get(Calendar.DAY_OF_MONTH);

            cal.setTime(currentDate);
            int currentYear = cal.get(Calendar.YEAR);
            int currentMonth = cal.get(Calendar.MONTH);
            int currentDay = cal.get(Calendar.DAY_OF_MONTH);

            int age = currentYear - birthYear;
            if (currentMonth < birthMonth || (currentMonth == birthMonth && currentDay < birthDay)) {
                age--;
            }

            return age;
        } catch (ParseException e) {
            e.printStackTrace();
            return 0; 
        }
    }

}

