package HealthCare.objects;

import java.io.Serializable;

public class UserObject implements Serializable {
    //tbluser
	private int user_id;
	private String user_name;
	private String user_fullname;
	private String user_phone;
	private String user_birthday;
	private String user_password;
	private String user_email;
	private String user_address;
	private String user_job;
	private String user_jobarea;
	private int user_permission;
	private String user_roles;
	private int user_logined;
	private String user_created_date;
	private String user_last_modified;
	private String user_last_logined;
	private String user_notes;
	private String user_avatar;
	private int user_parent_id;
	private int user_actions;
	
	
	public UserObject(int user_id, String user_name, String user_fullname, String user_phone, String user_birthday,
			String user_password, String user_email, String user_address, String user_job, String user_jobarea,
			int user_permission, String user_roles, int user_logined, String user_created_date,
			String user_last_modified, String user_last_logined, String user_notes, int user_parent_id,
			int user_actions, String user_avatar) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_fullname = user_fullname;
		this.user_phone = user_phone;
		this.user_birthday = user_birthday;
		this.user_password = user_password;
		this.user_email = user_email;
		this.user_address = user_address;
		this.user_job = user_job;
		this.user_jobarea = user_jobarea;
		this.user_permission = user_permission;
		this.user_roles = user_roles;
		this.user_logined = user_logined;
		this.user_created_date = user_created_date;
		this.user_last_modified = user_last_modified;
		this.user_last_logined = user_last_logined;
		this.user_notes = user_notes;
		this.user_parent_id = user_parent_id;
		this.user_actions = user_actions;
		this.user_avatar = user_avatar;
	}



	public UserObject() {
			
		}


	
public int getUser_id() {
		return user_id;
	}



	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}



	public String getUser_name() {
		return user_name;
	}



	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}



	public String getUser_fullname() {
		return user_fullname;
	}



	public void setUser_fullname(String user_fullname) {
		this.user_fullname = user_fullname;
	}



	public String getUser_phone() {
		return user_phone;
	}



	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}



	public String getUser_birthday() {
		return user_birthday;
	}



	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}



	public String getUser_password() {
		return user_password;
	}



	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}



	public String getUser_email() {
		return user_email;
	}



	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}



	public String getUser_address() {
		return user_address;
	}



	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}



	public String getUser_job() {
		return user_job;
	}



	public void setUser_job(String user_job) {
		this.user_job = user_job;
	}



	public String getUser_jobarea() {
		return user_jobarea;
	}



	public void setUser_jobarea(String user_jobarea) {
		this.user_jobarea = user_jobarea;
	}



	public int getUser_permission() {
		return user_permission;
	}



	public void setUser_permission(int user_permission) {
		this.user_permission = user_permission;
	}



	public String getUser_roles() {
		return user_roles;
	}



	public void setUser_roles(String user_roles) {
		this.user_roles = user_roles;
	}



	public int getUser_logined() {
		return user_logined;
	}



	public void setUser_logined(int user_logined) {
		this.user_logined = user_logined;
	}



	public String getUser_created_date() {
		return user_created_date;
	}



	public void setUser_created_date(String user_created_date) {
		this.user_created_date = user_created_date;
	}



	public String getUser_last_modified() {
		return user_last_modified;
	}



	public void setUser_last_modified(String user_last_modified) {
		this.user_last_modified = user_last_modified;
	}



	public String getUser_last_logined() {
		return user_last_logined;
	}



	public void setUser_last_logined(String user_last_logined) {
		this.user_last_logined = user_last_logined;
	}



	public String getUser_notes() {
		return user_notes;
	}



	public void setUser_notes(String user_notes) {
		this.user_notes = user_notes;
	}



	public int getUser_parent_id() {
		return user_parent_id;
	}



	public void setUser_parent_id(int user_parent_id) {
		this.user_parent_id = user_parent_id;
	}



	public int getUser_actions() {
		return user_actions;
	}



	public void setUser_actions(int user_actions) {
		this.user_actions = user_actions;
	}




	public String toString() {
	    return String.format("%-10s%-15s%-35s%-15s%-10s%-15s%-20s%-30s%-10s%-10s%-5s%-13s%-5s%-35s",
	            "ID: " + this.user_id,
	            "Name: " + this.user_name,
	            "Full Name: " + this.user_fullname,
	            "Phone: " + this.user_phone,
	            "Date of birth: " + this.user_birthday,
	            "Password: " + this.user_password,
	            "Email: " + this.user_email,
	            "Address: " + this.user_address,
	            "Job: " + this.user_job,
	            "Job area: " + this.user_jobarea,
	            "Permission: " + this.user_permission,
	            "Roles: " + this.user_roles,
	            "Logined: " + this.user_logined,
	            "Notes: " + this.user_notes);
	   
	}


	public String getUser_avatar() {
		return user_avatar;
	}

	public void setUser_avatar(String user_avatar) {
		this.user_avatar = user_avatar;
	}
}


