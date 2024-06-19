package HealthCare.process;

import java.util.*;

import java.sql.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import HealthCare.*;
import HealthCare.objects.*;

public class Appointment {
	//Ket noi de lam viec voi csdl
	private Connection con;
	//Bộ quản lý kết nối của riêng User
	private ConnectionPool cp;
	public Appointment() {
		//xác định bộ quản lý kết nối
		this.cp = new ConnectionPoolImpl();	
		// xin kết nối để làm việc
		try {
			this.con = this.cp.getConnectionPool("Appointment");
			// Kiểm tra chế độ thực thi của kết nối
			if (this.con.getAutoCommit()) {
				// Huỷ chế độ thực thi tự động
				this.con.setAutoCommit(false);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// Thêm appointment
    public boolean addAppointment(AppointmentObject appointment) {
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO tblappointment(");
        sql.append("app_date, app_time, app_status, app_created_date, ");
        sql.append("app_modified_date, app_notes, app_deleted, user_id, doctor_id) ");
        sql.append("VALUES(?,?,?,?,?,?,?,?,?)");

        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setString(1, appointment.getApp_date());
            pre.setString(2, appointment.getApp_time());
            pre.setString(3, appointment.getApp_status());
            pre.setString(4, appointment.getApp_created_date());
            pre.setString(5, appointment.getApp_modified_date());
            pre.setString(6, appointment.getApp_notes());
            pre.setBoolean(7, appointment.isApp_deleted());
            pre.setInt(8, appointment.getUser_id());
            pre.setInt(9, appointment.getDoctor_id());
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

    // Sửa appointment
    public boolean updateAppointment(AppointmentObject appointment) {
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE tblappointment ");
        sql.append("SET "
                + "app_date = ?, app_time = ?, app_status = ?, app_created_date = ?, "
                + "app_modified_date = ?, app_notes = ?, app_deleted = ? ,user_id = ? ");
        sql.append(" WHERE app_id = ? ");

        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setString(1, appointment.getApp_date());
            pre.setString(2, appointment.getApp_time());
            pre.setString(3, appointment.getApp_status());
            pre.setString(4, appointment.getApp_created_date());
            pre.setString(5, appointment.getApp_modified_date());
            pre.setString(6, appointment.getApp_notes());
            pre.setBoolean(7, appointment.isApp_deleted());
            pre.setInt(8, appointment.getApp_id());
            pre.setInt(8, appointment.getUser_id());

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
 // Hàm huỷ appointment
    public boolean cancelAppointment(int appointmentId) {
        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE tblappointment ");
        sql.append("SET app_status = 'Canceled' ");
        sql.append("WHERE app_id = ?");

        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setInt(1, appointmentId);

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
    // Xoá appointment
    public boolean deleteAppointment(int app_id_del) {
        StringBuilder sql = new StringBuilder();
        sql.append("DELETE FROM tblappointment "
                + "WHERE app_id = ? ;");
        try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setInt(1, app_id_del);

            int result = pre.executeUpdate();
            if (result == 0) {
                this.con.rollback();
                return false;
            }

            this.con.commit();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Lấy danh sách appointments
    public ArrayList<AppointmentObject> getAppointmentObjects() {
        ArrayList<AppointmentObject> items = new ArrayList<>();
        AppointmentObject item;
        String sql = "SELECT * FROM tblappointment";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    item = new AppointmentObject();
                    item.setApp_id(rs.getInt("app_id"));
                    item.setApp_date(rs.getString("app_date"));
                    item.setApp_time(rs.getString("app_time"));
                    item.setApp_status(rs.getString("app_status"));
                    item.setApp_created_date(rs.getString("app_created_date"));
                    item.setApp_modified_date(rs.getString("app_modified_date"));
                    item.setApp_notes(rs.getString("app_notes"));
                    item.setApp_deleted(rs.getBoolean("app_deleted"));
                    item.setUser_id(rs.getInt("user_id"));
                    item.setDoctor_id(rs.getInt("doctor_id"));

                    items.add(item);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
        return items;
    }
 // Hàm lấy dữ liệu cuộc hẹn từ cơ sở dữ liệu cho một người dùng cụ thể
    public ArrayList<Integer> getAppointmentStatusCountByUserId(int userId) {

        ArrayList<Integer> statusCounts = new ArrayList<>();

        // Khởi tạo mảng chứa số lượng cho từng trạng thái
        int[] counts = new int[4];

        String sql = "SELECT app_status, COUNT(*) FROM tblappointment WHERE user_id = ? GROUP BY app_status";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
            pre.setInt(1, userId);
            ResultSet rs = pre.executeQuery();

            String[] statusArray = {"Confirmed", "Scheduled", "Canceled", "Completed"};
            int[] statusIndex = {0, 1, 2, 3};

            Map<String, Integer> statusIndexMap = new HashMap<>();
            for (int i = 0; i < statusArray.length; i++) {
                statusIndexMap.put(statusArray[i], statusIndex[i]);
            }

            while (rs.next()) {
                String status = rs.getString("app_status");
                int count = rs.getInt(2);
                Integer index = statusIndexMap.get(status);

                if (index != null) {
                    counts[index] = count;
                } else {
                    System.out.println("Không tìm thấy index cho trạng thái: " + status);
                }
            }

            for (int count : counts) {
                statusCounts.add(count);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return statusCounts;
    }


    // Lấy danh sách appointments theo điều kiện (user_id)
    public ArrayList<AppointmentObject> getAppointmentsByUserId(int user_id) {
        ArrayList<AppointmentObject> items = new ArrayList<>();
        AppointmentObject item;
        String sql = "SELECT * FROM tblappointment WHERE user_id = ?";
        try {
            PreparedStatement pre = this.con.prepareStatement(sql);
	        // Truyền giá trị cho tham số
	        pre.setInt(1,user_id );
            ResultSet rs = pre.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    item = new AppointmentObject();
                    item.setApp_id(rs.getInt("app_id"));
                    item.setApp_date(rs.getString("app_date"));
                    item.setApp_time(rs.getString("app_time"));
                    item.setApp_status(rs.getString("app_status"));
                    item.setApp_created_date(rs.getString("app_created_date"));
                    item.setApp_modified_date(rs.getString("app_modified_date"));
                    item.setApp_notes(rs.getString("app_notes"));
                    item.setApp_deleted(rs.getBoolean("app_deleted"));
                    item.setUser_id(rs.getInt("user_id"));
                    item.setDoctor_id(rs.getInt("doctor_id"));

                    items.add(item);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
        return items;
    }
    // Đếm số lượng appointments
    public int countAppointments() {
        String sql = "SELECT COUNT(*) FROM tblappointment";
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
    public boolean countAppPerMonth(List<String> month, List<Integer> total) {
        
    	month.clear();
    	total.clear();
    	
    	StringBuilder sql = new StringBuilder();
    	sql.append("SELECT DATE_FORMAT(STR_TO_DATE(app_date, '%d/%m/%Y'), '%m/%Y') AS month, ");
    	sql.append("COUNT(app_id) AS total ");
    	sql.append("FROM tblappointment ");
    	sql.append("GROUP BY month, DATE_FORMAT(STR_TO_DATE(app_date, '%d/%m/%Y'), '%Y') ");
    	sql.append("ORDER BY DATE_FORMAT(STR_TO_DATE(app_date, '%d/%m/%Y'), '%Y'), month; ");
    	
		try {
			PreparedStatement pre = this.con.prepareStatement(sql.toString());
			ResultSet rs = pre.executeQuery();
	    	if (rs != null) {
	    		while (rs.next()) {
	    			month.add(rs.getString("month"));
	    			total.add(rs.getInt("total"));
	    		}
	    	}
	    	if (month.size() == total.size()) {
	    		return true;
	    	}
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
    
    
    // SAC
    public ArrayList<AppointmentObject> getAppointmentByDoctorId(int doctorId, String status, String date) {
		ArrayList<AppointmentObject> items = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM tblappointment ");
		sql.append("WHERE doctor_id = ? and app_status = ? ");
		sql.append("and app_date "+date+" ");
		sql.append("ORDER BY STR_TO_DATE(app_date, '%d/%m/%Y') asc ");
		
		AppointmentObject item;
		try {
			PreparedStatement pre = this.con.prepareStatement(sql.toString());
			pre.setInt(1, doctorId);
			pre.setString(2, status);
			
			ResultSet rs = pre.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					item = new AppointmentObject();
					item.setApp_id(rs.getInt("app_id"));
					item.setApp_date(rs.getString("app_date"));
					item.setApp_time(rs.getString("app_time"));
					item.setApp_status(rs.getString("app_status"));
					item.setApp_created_date(rs.getString("app_created_date"));
					item.setApp_modified_date(rs.getString("app_modified_date"));
					item.setApp_notes(rs.getString("app_notes"));
					item.setApp_deleted(rs.getBoolean("app_deleted"));
					item.setUser_id(rs.getInt("user_id"));

					items.add(item);
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				this.con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		
		return items;
	}
	public ArrayList<AppointmentObject> getDateAppointmentByDoctorId(int doctorId, String date, String status) {
		ArrayList<AppointmentObject> items = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM tblappointment ");
		sql.append("WHERE doctor_id = ? and app_status = ? and app_date = ? ");
		sql.append("ORDER BY STR_TO_DATE(app_date, '%d/%m/%Y') asc ");
		
		AppointmentObject item;
		try {
			PreparedStatement pre = this.con.prepareStatement(sql.toString());
			pre.setInt(1, doctorId);
			pre.setString(2, status);
			pre.setString(3, date);
			
			ResultSet rs = pre.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					item = new AppointmentObject();
					item.setApp_id(rs.getInt("app_id"));
					item.setApp_date(rs.getString("app_date"));
					item.setApp_time(rs.getString("app_time"));
					item.setApp_status(rs.getString("app_status"));
					item.setApp_created_date(rs.getString("app_created_date"));
					item.setApp_modified_date(rs.getString("app_modified_date"));
					item.setApp_notes(rs.getString("app_notes"));
					item.setApp_deleted(rs.getBoolean("app_deleted"));
					item.setUser_id(rs.getInt("user_id"));

					items.add(item);
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				this.con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		
		return items;
	}
	public ArrayList<AppointmentObject> getAppointmentByUserId(int userId) {
		ArrayList<AppointmentObject> items = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM tblappointment ");
		sql.append("WHERE user_id = ?");
		sql.append("ORDER BY STR_TO_DATE(app_date, '%d/%m/%Y') asc ");
		
		AppointmentObject item;
		try {
			PreparedStatement pre = this.con.prepareStatement(sql.toString());
			pre.setInt(1, userId);
			
			ResultSet rs = pre.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					item = new AppointmentObject();
					item.setApp_id(rs.getInt("app_id"));
					item.setApp_date(rs.getString("app_date"));
					item.setApp_time(rs.getString("app_time"));
					item.setApp_status(rs.getString("app_status"));
					item.setApp_created_date(rs.getString("app_created_date"));
					item.setApp_modified_date(rs.getString("app_modified_date"));
					item.setApp_notes(rs.getString("app_notes"));
					item.setApp_deleted(rs.getBoolean("app_deleted"));
					item.setUser_id(rs.getInt("user_id"));
					item.setDoctor_id(rs.getInt("doctor_id"));

					items.add(item);
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				this.con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		
		return items;
	}
	public int getTotalPatient(int doctor_id) {
		int total = 0;
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT count(app_id) FROM tblappointment ");
		sql.append("");
		sql.append("WHERE doctor_id = ?");
		
		try {
			PreparedStatement pre = this.con.prepareStatement(sql.toString());
			pre.setInt(1, doctor_id);
			
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
                // Retrieve the count value
                total = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			try {
				this.con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		return total;
	}
	public int getTotalPatientDate(String today, int doctor_id) {
		int total = 0;
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT count(user_id) FROM tblappointment ");
		sql.append("");
		sql.append("WHERE app_date = ? AND doctor_id = ?");
		
		try {
			PreparedStatement pre = this.con.prepareStatement(sql.toString());
			pre.setString(1, today);
			pre.setInt(2, doctor_id);
			
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
                // Retrieve the count value
                total = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			try {
				this.con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		return total;
	}
	public int getTotalAppointmentDate(String today, int doctor_id) {
		int total = 0;
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT count(app_id) FROM tblappointment ");
		sql.append("");
		sql.append("WHERE app_date = ? AND doctor_id = ?");
		
		try {
			PreparedStatement pre = this.con.prepareStatement(sql.toString());
			pre.setString(1, today);
			pre.setInt(2, doctor_id);
			
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
                // Retrieve the count value
                total = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			try {
				this.con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		return total;
	}
	public int getTotalAppointment(int doctor_id) {
		int total = 0;
		
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT count(app_id) FROM tblappointment ");
		sql.append("");
		sql.append("WHERE doctor_id = ?");
		
		try {
			PreparedStatement pre = this.con.prepareStatement(sql.toString());
			pre.setInt(1, doctor_id);
			
			ResultSet rs = pre.executeQuery();
			if (rs.next()) {
                // Retrieve the count value
                total = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			try {
				this.con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		return total;
	}
	public boolean updateStatus(int appId, String status) {
		//Câu lệnh sql
				StringBuilder sql = new StringBuilder();
				sql.append("UPDATE tblappointment ");
				sql.append("SET ");
				sql.append("app_status = ?, app_modified_date = ? ");
				sql.append("WHERE app_id = ?"); // update by id
				
				//set date
		        Calendar c = Calendar.getInstance();
		        Date currentDate = c.getTime();

		        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		        String formattedDate = formatter.format(currentDate);
				
				try {
					PreparedStatement pre = this.con.prepareStatement(sql.toString());
					pre.setString(1, status);
				    pre.setString(2, formattedDate);
				    pre.setInt(3, appId);
					
					//Execute sql
					int result = pre.executeUpdate();
					if (result == 0) {
						this.con.rollback();
						return false;
					}
					
					//ghi nhan thuc thi sau cung
					this.con.commit();
					return true;
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					try {
						this.con.rollback();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
				
				return false;
	}
	public ArrayList<AppointmentObject> getAppointmentFromNow(AppointmentObject similar, int number_days) {
		ArrayList<AppointmentObject> items = new ArrayList<>();
		AppointmentObject item;
		
		//sql
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM tblappointment ");
		sql.append("WHERE ");
		sql.append("DATEDIFF(CURDATE(), STR_TO_DATE(app_date, '%d/%m/%Y')) < ? ");
		sql.append("ORDER BY STR_TO_DATE(app_date, '%d/%m/%Y') desc ");
		
		try {
            PreparedStatement pre = this.con.prepareStatement(sql.toString());
            pre.setInt(1, number_days);
            ResultSet rs = pre.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    item = new AppointmentObject();
                    item.setApp_id(rs.getInt("app_id"));
                    item.setApp_date(rs.getString("app_date"));
                    item.setApp_time(rs.getString("app_time"));
                    item.setApp_status(rs.getString("app_status"));
                    item.setApp_created_date(rs.getString("app_created_date"));
                    item.setApp_modified_date(rs.getString("app_modified_date"));
                    item.setApp_notes(rs.getString("app_notes"));
                    item.setApp_deleted(rs.getBoolean("app_deleted"));
                    item.setUser_id(rs.getInt("user_id"));
                    item.setDoctor_id(rs.getInt("doctor_id"));

                    items.add(item);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                this.con.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
        return items;
	}
	public static void main(String[] args) {
		Appointment a = new Appointment();
//		ArrayList<String> month = new ArrayList<String>();
//		ArrayList<Integer> total = new ArrayList<Integer>();
//		if(a.countAppPerMonth(month, total)) {
//			for (int i=0; i<month.size(); i++) {
//				System.out.println(month.get(i) + " " + total.get(i));
//			}
//		}
		User u = new User();
		ArrayList<UserObject> doctorList = u.getAllDoctor(null);
		for (UserObject doctor : doctorList) {	
			int doctorApp = a.getTotalAppointment(doctor.getUser_id());
			System.out.println(doctor.getUser_id() + " " + doctorApp);
		} 
			
		
	}
}
   